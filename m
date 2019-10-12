From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 21:45:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libva: switch to virtual opengl
 provider
In-Reply-To: <20191012153931.24484-1-bernd.kuhls@t-online.de>
References: <20191012153931.24484-1-bernd.kuhls@t-online.de>
Message-ID: <20191012214504.3db2b51e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 12 Oct 2019 17:39:31 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/libva/libva.mk b/package/libva/libva.mk
> index 6c8243da90..176f971128 100644
> --- a/package/libva/libva.mk
> +++ b/package/libva/libva.mk
> @@ -20,8 +20,8 @@ LIBVA_CONF_OPTS = \
>  ifeq ($(BR2_PACKAGE_XORG7),y)
>  LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
>  LIBVA_CONF_OPTS += --enable-x11
> -ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
> -LIBVA_DEPENDENCIES += mesa3d
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +LIBVA_DEPENDENCIES += libgl
>  LIBVA_CONF_OPTS += --enable-glx

Do all OpenGL implementation provide GLX support ? I would assume that
in most practical cases, yes, but I'm wondering.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
