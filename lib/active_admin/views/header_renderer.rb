module ActiveAdmin
  module Views

    # Renderer for the header of the application. Includes the page
    # title, global navigation and utility navigation.
    class HeaderRenderer < ::ActiveAdmin::Renderer

      def to_html
        title + global_navigation + utility_navigation
      end

      protected

      def title
        content_tag 'h1', active_admin_application.site_title, :id => 'site_title'
      end

      # Renders the global navigation returned by
      # ActiveAdmin::ResourceController#current_menu
      #
      # It uses the ActiveAdmin.tabs_renderer option
      def global_navigation
        render view_factory.global_navigation, current_menu
      end

      def utility_navigation
        content_tag 'p', :id => "utility_nav" do
          if current_active_admin_user?
            content_tag(:span, display_name(current_active_admin_user), :class => "current_user") +
              link_to(I18n.t('active_admin.logout'), "#{controller.config.relative_url_root}/#{active_admin_application.default_namespace}/logout")
          end
        end
      end
    end

  end
end
