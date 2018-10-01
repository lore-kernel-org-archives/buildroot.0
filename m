From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 23:27:30 +0200
Subject: [Buildroot] [git commit branch/2018.05.x]
 package/x11r7/xlib_libXfont: remove autoreconf
Message-ID: <20181001212652.2B4C98B4B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=218b5a0d5ae2223ef48f27229fcea8c4cfd5281e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Nine years ago we added autoreconf to fix libtool-related problems
with the matchbox package:

https://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc

Autoreconf for this package needs the xutil_util-macros but after
building this defconfig with autoreconf removed from this package

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
gone. So instead of fixing autoreconf we remove it from this package
because there is no need for it anymore.

Fixes
http://autobuild.buildroot.net/results/30c/30cf5cc139f9f6a9dc070953270f74e18b9310d4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 534706e260b536d0389a058bb15085c9ea06f335)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 30163eec6f..420bbd1d50 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -9,7 +9,6 @@ XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
 XLIB_LIBXFONT_LICENSE_FILES = COPYING
-XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
