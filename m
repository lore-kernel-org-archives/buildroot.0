From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sun, 20 Dec 2009 17:22:25 +0100
Subject: [Buildroot] [PATCH 6/6] Fix gst-plugins-bad dependency on
	libdvdnav
In-Reply-To: <1258065198-22972-7-git-send-email-llandwerlin@gmail.com>
References: <1258065198-22972-1-git-send-email-llandwerlin@gmail.com>
	<1258065198-22972-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261326145.5294.2.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Didn't you forgot this patch ?

Regards,


Le jeudi 12 novembre 2009 ? 23:33 +0100, llandwerlin at gmail.com a ?crit :
> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
> ---
>  package/multimedia/gst-plugins-bad/Config.in       |    4 ++++
>  .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    7 +++++++
>  2 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
> index 3061822..132a770 100644
> --- a/package/multimedia/gst-plugins-bad/Config.in
> +++ b/package/multimedia/gst-plugins-bad/Config.in
> @@ -53,6 +53,10 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DEBUGUTILS
>  config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DTMF
>  	bool "dtmf"
>  
> +config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV
> +	bool "dvdnav"
> +        select BR2_PACKAGE_LIBDVDNAV
> +
>  config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU
>  	bool "dvdspu"
>  
> diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
> index 8c73bf0..10cd226 100644
> --- a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
> +++ b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
> @@ -95,6 +95,13 @@ else
>  GST_PLUGINS_BAD_CONF_OPT += --disable-dtmf
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDNAV),y)
> +GST_PLUGINS_BAD_CONF_OPT += --enable-dvdnav
> +GST_PLUGINS_BAD_DEPENDENCIES += libdvdnav
> +else
> +GST_PLUGINS_BAD_CONF_OPT += --disable-dvdnav
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVDSPU),y)
>  GST_PLUGINS_BAD_CONF_OPT += --enable-dvdspu
>  else

-- 
Lionel Landwerlin
