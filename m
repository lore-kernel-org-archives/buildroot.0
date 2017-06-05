From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 05 Jun 2017 20:23:56 +0200
Subject: [Buildroot] [PATCH] x11r7: xf86-input-tslib: upgrade to 1.0.0
References: <20170514075026.13434-1-martink@posteo.de>
Message-ID: <s6kg0ex6ur.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 14 May 2017 09:50:26 +0200 schrieb Martin Kepplinger:

> -XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.7
> +XDRIVER_XF86_INPUT_TSLIB_VERSION = 1.0.0

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

compile-tested using this defconfig (X.org 1.14.7):

 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_XSERVER_XORG_SERVER=y
 BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB=y

http://patchwork.ozlabs.org/patch/771379/ is needed to fix a build error 
with >= gcc5 & X.org 1.14.7

and this defconfig (X.org 1.19.3)

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_TSLIB=y

Regards, Bernd
