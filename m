From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:40:31 +0100
Subject: [Buildroot] [PATCH next 1/1] package/x11r7/xserver_xorg-server:
 Relax dependency on libdrm
In-Reply-To: <1424006372-4230-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424006372-4230-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150219224031.45cb0bb0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 15 Feb 2015 14:19:32 +0100, Bernd Kuhls wrote:
> xserver_xorg-server needs libdrm only when DRI is enabled, see configure.ac,
> line 1280. But since version 1.16.99.901 configure searches for optional libdrm
> support in configure.ac, line 2041,
> 
> http://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?id=2feda3b6b58f46cef91ea41312aac9021a703777
> 
> as well due to libdrm support being enabled by default, but the macro
> PKG_CHECK_EXISTS used in line 2041 does not add libdrm-specific CFLAGS to
> Makefile causing the build to fail:
> 
> In file included from dumb_bo.c:36:0:
> /home/br/br7/output/host/usr/i586-buildroot-linux-uclibc/sysroot/usr/include/xf86drm.h:40:17: fatal error: drm.h: No such file or directory
>  #include <drm.h>
> 
> This patch enables libdrm support only when dri support is enabled, which in
> turn depends on mesa3d. Since mesa3d selects libdrm already remove that line
> from Config.in as well.
> 
> Tested using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
