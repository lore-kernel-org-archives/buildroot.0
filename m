From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libfontenc to 1.0.5
Message-ID: <20100308133658.05861776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=267bd669d9d43a56aa86ced148231013008ae696
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libfontenc/Config.in          |    2 +-
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/Config.in b/package/x11r7/xlib_libfontenc/Config.in
index f99ac91..6da66cf 100644
--- a/package/x11r7/xlib_libfontenc/Config.in
+++ b/package/x11r7/xlib_libfontenc/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XLIB_LIBFONTENC
 	bool "libfontenc"
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libfontenc 1.0.4
+	  libfontenc 1.0.5
 	  X.Org fontenc library
diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index 7ab4511..6bda081 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.0.4
+XLIB_LIBFONTENC_VERSION = 1.0.5
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_AUTORECONF = NO
+XLIB_LIBFONTENC_LIBTOOL_PATCH = NO
 XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 XLIB_LIBFONTENC_CONF_OPT = --enable-shared --disable-static
 
+HOST_XLIB_LIBFONTENC_LIBTOOL_PATCH = NO
 HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc))
-- 
1.6.3.3
