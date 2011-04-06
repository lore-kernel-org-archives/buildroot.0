From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:03:42 +0200
Subject: [Buildroot] [PATCH 28/63] xlib_libX11: verison bump to 1.4.2 and
	removed patch file xlib_libX11-1.3.2-keysymdef
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-29-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch  |   35 --------------------
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 +-
 2 files changed, 1 insertions(+), 36 deletions(-)
 delete mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch

diff --git a/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch b/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
deleted file mode 100644
index 9c4eae2..0000000
--- a/package/x11r7/xlib_libX11/xlib_libX11-1.3.2-keysymdef.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-[patch]: configure: add --with-keysymdef argument for cross compilation
-
-Based on a similar patch from Openembedded.
-
-The libX11 configure script hardcodes the location to keysymdef.h as
-<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
-but breaks with cross compilation as that directory is a location on
-the target, not the build host.
-
-Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
-===================================================================
-Index: xlib_libX11-1.3.2/configure.ac
-===================================================================
---- xlib_libX11-1.3.2.orig/configure.ac	2009-10-23 22:55:03.000000000 +0200
-+++ xlib_libX11-1.3.2/configure.ac	2010-05-04 16:26:39.000000000 +0200
-@@ -280,8 +280,15 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+      AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+      KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+      dir=`pkg-config --variable=includedir xproto`
-+      KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
-+
- if test -f "$KEYSYMDEF"; then
-         AC_MSG_RESULT([$KEYSYMDEF])
- else
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 1acc35c..48e9947 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.3.2
+XLIB_LIBX11_VERSION = 1.4.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
-- 
1.7.3.4
