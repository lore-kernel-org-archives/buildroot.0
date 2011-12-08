From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 08 Dec 2011 09:35:47 +0100
Subject: [Buildroot] [PATCH v6 2/3] New package: giblib
In-Reply-To: <1318840867-20976-3-git-send-email-yegorslists@googlemail.com>
References: <1318840867-20976-1-git-send-email-yegorslists@googlemail.com>
 <1318840867-20976-3-git-send-email-yegorslists@googlemail.com>
Message-ID: <4EE076E3.3070306@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 17.10.2011 10:41, schrieb yegorslists at googlemail.com:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/Config.in        |    1 +
>  package/giblib/Config.in |    8 ++++++++
>  package/giblib/giblib.mk |   15 +++++++++++++++
>  3 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 package/giblib/Config.in
>  create mode 100644 package/giblib/giblib.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 7a7b4bf..7f82934 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -280,6 +280,7 @@ source "package/cairo/Config.in"
>  source "package/fltk/Config.in"
>  source "package/fontconfig/Config.in"
>  source "package/freetype/Config.in"
> +source "package/giblib/Config.in"
>  source "package/gtk2-engines/Config.in"
>  source "package/gtk2-themes/Config.in"
>  source "package/imlib2/Config.in"
> diff --git a/package/giblib/Config.in b/package/giblib/Config.in
> new file mode 100644
> index 0000000..0c704e1
> --- /dev/null
> +++ b/package/giblib/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_GIBLIB
> +	bool "giblib"
> +	select BR2_PACKAGE_IMLIB2
> +	help
> +	  Giblib is a simple library which wraps imlib2.
> +
> +	  http://linuxbrit.co.uk/giblib/
> +
> diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
> new file mode 100644
> index 0000000..8a868c5
> --- /dev/null
> +++ b/package/giblib/giblib.mk
> @@ -0,0 +1,15 @@
> +#############################################################
> +#
> +# giblib
> +#
> +#############################################################
> +GIBLIB_VERSION = 1.2.4
> +GIBLIB_SOURCE = giblib-$(GIBLIB_VERSION).tar.gz
> +GIBLIB_SITE = http://linuxbrit.co.uk/downloads/
> +GIBLIB_INSTALL_STAGING = YES
> +GIBLIB_DEPENDENCIES = imlib2
> +GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING)/usr/lib \
> +		  --with-imlib2-exec-prefix=$(STAGING)/usr/bin
> +
> +$(eval $(call AUTOTARGETS))
> +

ping
