From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 16:14:50 +0200
Subject: [Buildroot] [PATCH 6/6]
 package/kodi-screensaver/visualisation-*: allow OpenGL build on arm
In-Reply-To: <1462905623-17739-6-git-send-email-bernd.kuhls@t-online.de>
References: <1462905623-17739-1-git-send-email-bernd.kuhls@t-online.de>
 <1462905623-17739-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160511161450.61474be4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 May 2016 20:40:23 +0200, Bernd Kuhls wrote:
> Kodi depends on egl/gles on arm, our Kconfig option BR2_PACKAGE_KODI_GL
> reflects this, it depends on !BR2_arm.
> 
> This option is wrongly used in many Kodi addons needing OpenGL, they
> can be compiled even if Kodi itself uses egl/gles. This patch changes
> the dependency on BR2_PACKAGE_KODI_GL to BR2_PACKAGE_HAS_LIBGL.
> 
> Tested using this defconfig:
> 
> BR2_arm=y
> BR2_cortex_a17=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
> BR2_PACKAGE_KODI_SCREENSAVER_ASTERWAVE=y
> BR2_PACKAGE_KODI_SCREENSAVER_BIOGENESIS=y
> BR2_PACKAGE_KODI_SCREENSAVER_CPBLOBS=y
> BR2_PACKAGE_KODI_SCREENSAVER_CRYSTALMORPH=y
> BR2_PACKAGE_KODI_SCREENSAVER_GREYNETIC=y
> BR2_PACKAGE_KODI_SCREENSAVER_MATRIXTRAILS=y
> BR2_PACKAGE_KODI_SCREENSAVER_PINGPONG=y
> BR2_PACKAGE_KODI_SCREENSAVER_PLANESTATE=y
> BR2_PACKAGE_KODI_SCREENSAVER_PYRO=y
> BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
> BR2_PACKAGE_KODI_SCREENSAVER_STARS=y
> BR2_PACKAGE_KODI_VISUALISATION_FISHBMC=y
> BR2_PACKAGE_KODI_VISUALISATION_FOUNTAIN=y
> BR2_PACKAGE_KODI_VISUALISATION_GOOM=y
> BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY=y
> BR2_PACKAGE_KODI_VISUALISATION_SPECTRUM=y
> BR2_PACKAGE_KODI_VISUALISATION_WAVEFORHUE=y
> BR2_PACKAGE_KODI_VISUALISATION_WAVEFORM=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> 
> $ grep PACKAGE_HAS_LIB .config
> BR2_PACKAGE_HAS_LIBGL=y
> BR2_PACKAGE_HAS_LIBEGL=y
> BR2_PACKAGE_HAS_LIBGLES=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi-screensaver-asteroids/Config.in    | 4 ++--
>  package/kodi-screensaver-asterwave/Config.in    | 4 ++--
>  package/kodi-screensaver-biogenesis/Config.in   | 4 ++--
>  package/kodi-screensaver-cpblobs/Config.in      | 4 ++--
>  package/kodi-screensaver-crystalmorph/Config.in | 4 ++--
>  package/kodi-screensaver-greynetic/Config.in    | 4 ++--
>  package/kodi-screensaver-matrixtrails/Config.in | 4 ++--
>  package/kodi-screensaver-pingpong/Config.in     | 4 ++--
>  package/kodi-screensaver-planestate/Config.in   | 4 ++--
>  package/kodi-screensaver-pyro/Config.in         | 4 ++--
>  package/kodi-screensaver-rsxs/Config.in         | 4 ++--
>  package/kodi-screensaver-stars/Config.in        | 4 ++--
>  package/kodi-visualisation-fishbmc/Config.in    | 4 ++--
>  package/kodi-visualisation-fountain/Config.in   | 4 ++--
>  package/kodi-visualisation-goom/Config.in       | 4 ++--
>  15 files changed, 30 insertions(+), 30 deletions(-)

In fact, I re-read your patch and the explanation, and got the idea. So
I've applied it. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
