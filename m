From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 07 Mar 2015 10:53:53 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
	new package
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com> <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK> <54F7898A.6090601@free.fr>
 <20150306231558.GE4220@free.fr> <20150307090354.60c844a3@free-electrons.com>
Message-ID: <XnsA4566EDC41249berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20150307090354.60c844a3 at free-electrons.com: 

> Will an old X.org server build/work fine with recent versions of the
> X.org libraries around it, so that we only have to change the version of
> the X.org server 

Hi Thomas,

I just compiled

-XSERVER_XORG_SERVER_VERSION = 1.17.1
+XSERVER_XORG_SERVER_VERSION = 1.14.7

(also removed package/x11r7/xserver_xorg-server/0004-backtrace.c-Fix-word-
cast-to-a-pointer.patch)

successfully using buildroot git master using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y

Regards, Bernd
