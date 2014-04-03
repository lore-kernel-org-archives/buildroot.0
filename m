From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:55:37 +0200
Subject: [Buildroot] [PATCH v4 21/37] libva: new package
In-Reply-To: <1396551692-12371-22-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
 <1396551692-12371-22-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140403215537.61b549f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Thu,  3 Apr 2014 21:01:16 +0200, Bernd Kuhls wrote:

> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> new file mode 100644
> index 0000000..1c7e6e0
> --- /dev/null
> +++ b/package/libva/libva.mk
> @@ -0,0 +1,59 @@
> +################################################################################
> +#
> +# libva
> +#
> +################################################################################
> +
> +LIBVA_VERSION = 1.3.0
> +LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
> +LIBVA_SITE = http://www.freedesktop.org/software/vaapi/releases/libva
> +LIBVA_LICENSE = MIT
> +LIBVA_INSTALL_STAGING = YES
> +
> +LIBVA_DEPENDENCIES = \
> +	host-pkgconf \
> +	libdrm

You're cutting lines a bit too much. This should be:

LIBVA_DEPENDENCIES = host-pkgconf libdram

> +ifeq ($(BR2_PACKAGE_MESA3D),y)
> +LIBVA_DEPENDENCIES += \
> +	mesa3d
> +LIBVA_CONF_OPT += \
> +	--enable-glx

Same here.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER),y)
> +LIBVA_DEPENDENCIES += \
> +	xlib_libX11 \
> +	xlib_libXext \
> +	xlib_libXfixes
> +LIBVA_CONF_OPT += \
> +	--enable-x11
> +else
> +LIBVA_CONF_OPT += \
> +	--disable-x11

And here, and so on.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
