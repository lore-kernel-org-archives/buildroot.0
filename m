From: daggs <daggs@gmx.com>
Date: Sun, 1 Apr 2018 09:17:59 +0200
Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
In-Reply-To: <20180401070337.18301-1-bernd.kuhls@t-online.de>
References: <20180401070337.18301-1-bernd.kuhls@t-online.de>
Message-ID: <trinity-60c51855-aef6-4353-90a8-2e1f048863e2-1522567079284@3c-app-mailcom-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Sent: Sunday, April 01, 2018 at 10:03 AM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at buildroot.org
> Cc: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
> Subject: [Buildroot] [PATCH 1/4] package/kodi: remove libamcodec support
>
> Using the libamcodec package (-DENABLE_AML=ON) is not enough:
> 
> -- Could NOT find OpenGLES (missing:  OPENGLES_gl_LIBRARY OPENGLES_egl_LIBRARY OPENGLES_INCLUDE_DIR)
> CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
>   Could NOT find EGL (missing: EGL_LIBRARY EGL_INCLUDE_DIR)
> Call Stack (most recent call first):
>   /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>   modules/FindEGL.cmake:30 (find_package_handle_standard_args)
>   scripts/common/Macros.cmake:354 (find_package)
>   CMakeLists.txt:208 (core_require_dep)
> 
> Libreelec provides pre-compiled OpenGL ES libraries for AML which are
> not provided by buildroot:
> https://github.com/LibreELEC/LibreELEC.tv/tree/master/packages/graphics/opengl-meson
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi.mk | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 9d3b65ae91..5af9fe180d 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -72,6 +72,7 @@ KODI_CONF_OPTS += \
>  	-DLIBDVDCSS_URL=$(DL_DIR)/$(KODI_LIBDVDCSS_VERSION).tar.gz \
>  	-DLIBDVDNAV_URL=$(DL_DIR)/$(KODI_LIBDVDNAV_VERSION).tar.gz \
>  	-DLIBDVDREAD_URL=$(DL_DIR)/$(KODI_LIBDVDREAD_VERSION).tar.gz \
> +	-DENABLE_AML=OFF \
>  	-DENABLE_IMX=OFF
>  
>  ifeq ($(BR2_ENABLE_LOCALE),)
> @@ -186,12 +187,6 @@ else
>  # "linux" platforms. The "rpbi" platform has a different set of
>  # options, defined in project/cmake/scripts/rbpi/
>  KODI_CONF_OPTS += -DENABLE_LDGOLD=OFF
> -ifeq ($(BR2_PACKAGE_LIBAMCODEC),y)
> -KODI_CONF_OPTS += -DENABLE_AML=ON
> -KODI_DEPENDENCIES += libamcodec
> -else
> -KODI_CONF_OPTS += -DENABLE_AML=OFF
> -endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> -- 
> 2.14.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I'm trying to understand this change, does this means libamlogic is missing something or kodi doesn't supports gles anymore?
also, can you explain how Libreelec provided pre-compiled OpenGL ES libraries for AML are related to this? the link you've added points to a systemd script

Dagg.
