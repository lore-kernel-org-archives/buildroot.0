From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 19:58:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 Glamor depends on dri3
In-Reply-To: <1426429839-6908-1-git-send-email-bernd.kuhls@t-online.de>
References: <1426429839-6908-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150401195850.738b9f17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Mar 2015 15:30:39 +0100, Bernd Kuhls wrote:
> Fixes
> 
> ../../../glamor/glamor_egl.c:603:25: error: unknown type name 'RRProviderPtr'
>                          RRProviderPtr provider,
>                          ^
> ../../../glamor/glamor_egl.c:650:1: error: unknown type name 'dri3_screen_info_rec'
>  static dri3_screen_info_rec glamor_dri3_info = {
>  ^
> 
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
> BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
> 
> RRProviderPtr is defined in dri3/dri3.h, so make sure glamor is enabled only
> if dri3 is enabled, too.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
