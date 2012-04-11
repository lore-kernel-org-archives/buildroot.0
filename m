From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Wed, 11 Apr 2012 11:53:30 +0200
Subject: [Buildroot] [PATCH] Add lcdproc config options,
 for driver selection
In-Reply-To: <1334138568-28717-1-git-send-email-spdawson@gmail.com>
References: <1334138568-28717-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120411095330.GP29577@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> +
> +config BR2_PACKAGE_LCDPROC_DRIVER_ULA200
> +	bool "ula200"
> +	help
> +	  Driver for ula200 devices
> +
> +config BR2_PACKAGE_LCDPROC_DRIVER_XOSD
> +	bool "xosd"
> +	help
> +	  Driver for xosd devices
> +
> +endmenu
> diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
> index e8919e9..e0964a5 100644
> --- a/package/lcdproc/lcdproc.mk
> +++ b/package/lcdproc/lcdproc.mk
> @@ -7,7 +7,156 @@ LCDPROC_VERSION = 0.5.5
>  LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
>  LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
>  
> -LCDPROC_CONF_OPT = --enable-drivers=all
> +LCDPROC_DRIVERS =
> +ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_BAYRAD),y)
> +	LCDPROC_DRIVERS += bayrad
> +endif
LCDPROC_DRIVERS-$(BR2_PACKAGE_LCDPROC_DRIVER_BAYRAD) += bayrad

and then use
LCDPROC_DRIVERS-y


so we can drop the ifeq blabla

Best Regards,
J.
