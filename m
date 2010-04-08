From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Apr 2010 22:10:18 +0200
Subject: [Buildroot] [git commit master] xlib_libpciaccess: bump version
Message-ID: <20100408201139.AEBF28B35D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=741d1cd4b0413c2ad1526fa4ba2c0cae89984414
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove version from Config.in help]
Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 ++--
 package/x11r7/xlib_libpciaccess/Config.in          |    1 -
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |    5 ++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 12e66a2..e8ca5b7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,8 +16,8 @@
 	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
 	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
 	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xlib_libX11, xlib_libXfont, xproto_dri2proto,
-	xproto_fontcacheproto, xproto_xf86miscproto
+	wget, xlib_libX11, xlib_libXfont, xlib_libpciaccess,
+	xproto_dri2proto, xproto_fontcacheproto, xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/x11r7/xlib_libpciaccess/Config.in
index 2300822..b53aa31 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/x11r7/xlib_libpciaccess/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XLIB_LIBPCIACCESS
 	bool "libpciaccess"
 	depends on BR2_LARGEFILE
 	help
-	  libpciaccess 0.10.9
 	  X.Org libpciaccess
 
 comment "libpciaccess requires a toolchain with LARGEFILE support"
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
index 73a9642..9bb1576 100644
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBPCIACCESS_VERSION = 0.10.9
+XLIB_LIBPCIACCESS_VERSION = 0.11.0
 XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
 XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_AUTORECONF = NO
+XLIB_LIBPCIACCESS_LIBTOOL_PATCH = NO
 XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-XLIB_LIBPCIACCESS_DEPENDENCIES =
 XLIB_LIBPCIACCESS_CONF_OPT = --enable-shared --disable-static
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libpciaccess))
-- 
1.6.3.3
