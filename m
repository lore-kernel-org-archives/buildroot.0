From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 02 Sep 2014 20:21:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/xbmc: add option to enable RSXS
	screensaver
References: <cover.1409588958.git.yann.morin.1998@free.fr>
 <698b2e4019db6d62c78b18c03e455fc08c65659c.1409588958.git.yann.morin.1998@free.fr>
Message-ID: <XnsA39CCF2279128berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:698b2e4019db6d62c78b18c03e455fc08c65659c.1409588958.git.yann.morin.199
8 at free.fr:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998-
GANU6spQydw@public.gmane.org>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/Config.in | 9 +++++++++
>  package/xbmc/xbmc.mk   | 4 ++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index ebe0882..ed0d4ed 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -138,6 +138,15 @@ config BR2_PACKAGE_XBMC_GOOM
>  comment "goom needs an OpenGL backend"
>       depends on !BR2_PACKAGE_XBMC_GL
>  
> +config BR2_PACKAGE_XBMC_RSXS
> +     bool "rsxs screensaver"
> +     depends on BR2_PACKAGE_XBMC_GL
> +     help
> +       Enable goom screensaver
> +
> +comment "rsxs needs an OpenGL backend"
> +     depends on !BR2_PACKAGE_XBMC_GL
> +
>  config BR2_PACKAGE_XBMC_LIBCEC
>       bool "hdmi cec"
>       depends on !BR2_PREFER_STATIC_LIB # libcec
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 87b81c4..8bcad00 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -88,6 +88,7 @@ ifeq ($(BR2_PACKAGE_XBMC_GL),y)
>  XBMC_DEPENDENCIES += libglew libglu libgl sdl_image xlib_libX11 
xlib_libXext \
>       xlib_libXmu xlib_libXrandr xlib_libXt
>  XBMC_CONF_OPT += --enable-gl --enable-sdl --enable-x11 --enable-xrandr 
--disable-gles
> +ifeq ($(BR2_PACKAGE_XBMC_RSXS),y)
>  # fix rsxs compile
>  # make sure target libpng-config is used, options taken from rsxs-
0.9/acinclude.m4
>  XBMC_CONF_ENV += \
> @@ -99,6 +100,9 @@ XBMC_CONF_ENV += \
>       mac_cv_pkg_libs="`$(STAGING_DIR)/usr/bin/libpng-config --libs`"
>  XBMC_CONF_OPT += --enable-rsxs
>  else
> +XBMC_CONF_OPT += --disable-rsxs
> +endif
> +else
>  XBMC_CONF_OPT += --disable-gl --disable-rsxs --disable-sdl --disable-x11 
--disable-xrandr
>  ifeq ($(BR2_PACKAGE_XBMC_EGL_GLES),y)
>  XBMC_DEPENDENCIES += libegl libgles

Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
