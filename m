From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 23:28:43 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 package/x11r7/xlib_libXft: remove autoreconf
Message-ID: <20181001212800.739518B4BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89e7af9a54528c287944ecb978a61061e7749b39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Nine years ago we added autoreconf to fix libtool-related problems
with the matchbox package:

https://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc

After building this defconfig with autoreconf removed from this package

BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XLIB_LIBXFONT=y
BR2_PACKAGE_MATCHBOX=y
BR2_PACKAGE_MATCHBOX_SM=y
BR2_PACKAGE_MATCHBOX_COMMON=y
BR2_PACKAGE_MATCHBOX_COMMON_PDA=y
BR2_PACKAGE_MATCHBOX_DESKTOP=y
BR2_PACKAGE_MATCHBOX_KEYBOARD=y
BR2_PACKAGE_MATCHBOX_PANEL=y
BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR=y

it is obvious that the problem which existed nine years ago seems to be
gone, therefore we remove autoreconf from this package because there is
no need for it anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ae61eac51459c4ec9ad3167567d164f25178791)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXft/xlib_libXft.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xlib_libXft/xlib_libXft.mk b/package/x11r7/xlib_libXft/xlib_libXft.mk
index de9b47093b..73fe6bb606 100644
--- a/package/x11r7/xlib_libXft/xlib_libXft.mk
+++ b/package/x11r7/xlib_libXft/xlib_libXft.mk
@@ -9,7 +9,6 @@ XLIB_LIBXFT_SOURCE = libXft-$(XLIB_LIBXFT_VERSION).tar.bz2
 XLIB_LIBXFT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFT_LICENSE = MIT
 XLIB_LIBXFT_LICENSE_FILES = COPYING
-XLIB_LIBXFT_AUTORECONF = YES
 XLIB_LIBXFT_INSTALL_STAGING = YES
 XLIB_LIBXFT_DEPENDENCIES = fontconfig freetype xlib_libX11 xlib_libXext xlib_libXrender xproto_xproto
 
