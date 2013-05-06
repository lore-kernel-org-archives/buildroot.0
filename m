From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:15:30 +0200
Subject: [Buildroot] [PATCH 2/2] jquery-ui-themes: new package
In-Reply-To: <1339704133-11220-2-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 14 Jun 2012 21:02:12 +0100")
References: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
 <1339704133-11220-2-git-send-email-spdawson@gmail.com>
Message-ID: <87haif4uwt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed with minor tweaks, thanks.

 spdawson> ---
 spdawson>  package/Config.in                            |    1 +
 spdawson>  package/jquery-ui-themes/Config.in           |   21 +++++++++++++++++
 spdawson>  package/jquery-ui-themes/jquery-ui-themes.mk |   31 ++++++++++++++++++++++++++
 spdawson>  3 files changed, 53 insertions(+)
 spdawson>  create mode 100644 package/jquery-ui-themes/Config.in
 spdawson>  create mode 100644 package/jquery-ui-themes/jquery-ui-themes.mk

 spdawson> diff --git a/package/Config.in b/package/Config.in
 spdawson> index 2f20617..20d7323 100644
 spdawson> --- a/package/Config.in
 spdawson> +++ b/package/Config.in
 spdawson> @@ -382,6 +382,7 @@ source "package/flot/Config.in"
 spdawson>  source "package/jquery/Config.in"
 spdawson>  source "package/jquery-sparkline/Config.in"
 spdawson>  source "package/jquery-ui/Config.in"
 spdawson> +source "package/jquery-ui-themes/Config.in"
 spdawson>  source "package/jquery-validation/Config.in"
 spdawson>  source "package/jsmin/Config.in"
 spdawson>  endmenu
 spdawson> diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..49180f9
 spdawson> --- /dev/null
 spdawson> +++ b/package/jquery-ui-themes/Config.in
 spdawson> @@ -0,0 +1,21 @@
 spdawson> +config BR2_PACKAGE_JQUERY_UI_THEMES
 spdawson> +	bool "jQuery UI themes"
 spdawson> +	select BR2_PACKAGE_JQUERY_UI

It imho makes more sense if it depends on JQUERY_UI.

 spdawson> +	help
 spdawson> +	  Themes for jQuery UI.
 spdawson> +
 spdawson> +	  http://jqueryui.com/
 spdawson> +
 spdawson> +config BR2_PACKAGE_JQUERY_UI_THEMES_CSS_PATH
 spdawson> +	string "Target install path for CSS"
 spdawson> +	default "/var/www/stylesheets"
 spdawson> +	depends on BR2_PACKAGE_JQUERY_UI_THEMES
 spdawson> +	help
 spdawson> +	  Specify a target install path for CSS files
 spdawson> +

Like for jquery-ui, I've dropped this option.

 spdawson> +++ b/package/jquery-ui-themes/jquery-ui-themes.mk
 spdawson> @@ -0,0 +1,31 @@
 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# jquery-ui-themes
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +JQUERY_UI_THEMES_VERSION = 1.8.21
 spdawson> +JQUERY_UI_THEMES_SITE = http://jquery-ui.googlecode.com/files
 spdawson> +JQUERY_UI_THEMES_SOURCE = jquery-ui-themes-$(JQUERY_UI_THEMES_VERSION).zip

It should have jquery-ui in it's _DEPENDENCIES to ensure it get's built
after it and overrides the base template.

-- 
Bye, Peter Korsgaard
