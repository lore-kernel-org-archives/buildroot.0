From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-tga to 1.2.1
Message-ID: <20100308133636.CA1D1776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4b388113794811244d1de66642a0d756b0ee9501
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-tga/Config.in     |    2 +-
 ...driver_xf86-video-tga-1.2.0-cross-compile.patch |   30 --------------------
 .../xdriver_xf86-video-tga.mk                      |    2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.2.0-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-tga/Config.in b/package/x11r7/xdriver_xf86-video-tga/Config.in
index f21c490..1fb8dab 100644
--- a/package/x11r7/xdriver_xf86-video-tga/Config.in
+++ b/package/x11r7/xdriver_xf86-video-tga/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_TGA
 	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-tga 1.1.0
+	  xf86-video-tga 1.2.1
 	  X.Org driver for tga cards
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.2.0-cross-compile.patch b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.2.0-cross-compile.patch
deleted file mode 100644
index fac8018..0000000
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga-1.2.0-cross-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
---- a/configure	2006-04-07 17:40:13.000000000 -0400
-+++ b/configure	2008-06-23 11:54:36.000000000 -0400
-@@ -20326,27 +20326,8 @@ echo "$as_me: Building with package name
- as_ac_File=`echo "ac_cv_file_$prefix/share/X11/sgml/defs.ent" | $as_tr_sh`
- echo "$as_me:$LINENO: checking for $prefix/share/X11/sgml/defs.ent" >&5
- echo $ECHO_N "checking for $prefix/share/X11/sgml/defs.ent... $ECHO_C" >&6
--if eval "test \"\${$as_ac_File+set}\" = set"; then
--  echo $ECHO_N "(cached) $ECHO_C" >&6
--else
--  test "$cross_compiling" = yes &&
--  { { echo "$as_me:$LINENO: error: cannot check for file existence when cross compiling" >&5
--echo "$as_me: error: cannot check for file existence when cross compiling" >&2;}
--   { (exit 1); exit 1; }; }
--if test -r "$prefix/share/X11/sgml/defs.ent"; then
--  eval "$as_ac_File=yes"
--else
--  eval "$as_ac_File=no"
--fi
--fi
--echo "$as_me:$LINENO: result: `eval echo '${'$as_ac_File'}'`" >&5
--echo "${ECHO_T}`eval echo '${'$as_ac_File'}'`" >&6
--if test `eval echo '${'$as_ac_File'}'` = yes; then
--  DEFS_ENT_PATH=$prefix/share/X11/sgml
--else
-   DEFS_ENT_PATH=
- 
--fi
- 
- 
- # Extract the first word of "linuxdoc", so it can be a program name with args.
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
index 6731646..23f4823 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_TGA_VERSION = 1.2.1
 XDRIVER_XF86_VIDEO_TGA_SOURCE = xf86-video-tga-$(XDRIVER_XF86_VIDEO_TGA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TGA_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TGA_AUTORECONF = NO
-- 
1.6.3.3
