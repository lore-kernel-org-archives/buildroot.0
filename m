From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:13:37 +0200
Subject: [Buildroot] [PATCH 1/2] jquery-ui: new package
In-Reply-To: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 14 Jun 2012 21:02:11 +0100")
References: <1339704133-11220-1-git-send-email-spdawson@gmail.com>
Message-ID: <87li7r4uzy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed with minor changes, thanks.

 spdawson> ---
 spdawson>  package/Config.in              |    1 +
 spdawson>  package/jquery-ui/Config.in    |   23 +++++++++++++++++++++++
 spdawson>  package/jquery-ui/jquery-ui.mk |   36 ++++++++++++++++++++++++++++++++++++
 spdawson>  3 files changed, 60 insertions(+)
 spdawson>  create mode 100644 package/jquery-ui/Config.in
 spdawson>  create mode 100644 package/jquery-ui/jquery-ui.mk

 spdawson> diff --git a/package/Config.in b/package/Config.in
 spdawson> index d047ce8..2f20617 100644
 spdawson> --- a/package/Config.in
 spdawson> +++ b/package/Config.in
 spdawson> @@ -381,6 +381,7 @@ source "package/explorercanvas/Config.in"
 spdawson>  source "package/flot/Config.in"
 spdawson>  source "package/jquery/Config.in"
 spdawson>  source "package/jquery-sparkline/Config.in"
 spdawson> +source "package/jquery-ui/Config.in"
 spdawson>  source "package/jquery-validation/Config.in"
 spdawson>  source "package/jsmin/Config.in"
 spdawson>  endmenu
 spdawson> diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
 spdawson> new file mode 100644
 spdawson> index 0000000..073a40a
 spdawson> --- /dev/null
 spdawson> +++ b/package/jquery-ui/Config.in
 spdawson> @@ -0,0 +1,23 @@
 spdawson> +config BR2_PACKAGE_JQUERY_UI
 spdawson> +	bool "jQuery UI"

It should select BR2_PACKAGE_JQUERY

 spdawson> +	help
 spdawson> +	  jQuery UI provides abstractions for low-level interaction and
 spdawson> +	  animation, advanced effects and high-level, themeable widgets,
 spdawson> +	  built on top of the jQuery JavaScript Library, that you can use
 spdawson> +	  to build highly interactive web applications.
 spdawson> +
 spdawson> +	  http://jqueryui.com/
 spdawson> +
 spdawson> +config BR2_PACKAGE_JQUERY_UI_JAVASCRIPT_PATH
 spdawson> +	string "Target install path for JavaScript"
 spdawson> +	default "/var/www/javascripts"
 spdawson> +	depends on BR2_PACKAGE_JQUERY_UI
 spdawson> +	help
 spdawson> +	  Specify a target install path for JavaScript files
 spdawson> +
 spdawson> +config BR2_PACKAGE_JQUERY_UI_CSS_PATH
 spdawson> +	string "Target install path for CSS"
 spdawson> +	default "/var/www/stylesheets"
 spdawson> +	depends on BR2_PACKAGE_JQUERY_UI
 spdawson> +	help
 spdawson> +	  Specify a target install path for CSS files

We afaik discussed these options some time ago. I dislike them, so I've
dropped them for now atleast.

-- 
Bye, Peter Korsgaard
