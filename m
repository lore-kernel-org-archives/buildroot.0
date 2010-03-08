From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-newport to 0.2.3
Message-ID: <20100308133630.75EA3776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1104dc3ea934326d148dc161dc18dd7f4f86c895
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-newport/Config.in |    2 +-
 ...er_xf86-video-newport-0.2.1-cross-compile.patch |   31 --------------------
 .../xdriver_xf86-video-newport.mk                  |    2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport-0.2.1-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-newport/Config.in b/package/x11r7/xdriver_xf86-video-newport/Config.in
index c00431b..bea4c3d 100644
--- a/package/x11r7/xdriver_xf86-video-newport/Config.in
+++ b/package/x11r7/xdriver_xf86-video-newport/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_NEWPORT
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-newport 0.2.1
+	  xf86-video-newport 0.2.3
 	  Newport video driver
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport-0.2.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport-0.2.1-cross-compile.patch
deleted file mode 100644
index 34c8a7a..0000000
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport-0.2.1-cross-compile.patch
+++ /dev/null
@@ -1,31 +0,0 @@
---- a/configure	2006-10-13 18:36:20.000000000 -0400
-+++ b/configure	2008-06-23 11:38:03.000000000 -0400
-@@ -20191,28 +20191,8 @@ echo "$as_me: Building with package name
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
--
- 
- # Extract the first word of "linuxdoc", so it can be a program name with args.
- set dummy linuxdoc; ac_word=$2
diff --git a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
index 486f63f..fb7dd1c 100644
--- a/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
+++ b/package/x11r7/xdriver_xf86-video-newport/xdriver_xf86-video-newport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.1
+XDRIVER_XF86_VIDEO_NEWPORT_VERSION = 0.2.3
 XDRIVER_XF86_VIDEO_NEWPORT_SOURCE = xf86-video-newport-$(XDRIVER_XF86_VIDEO_NEWPORT_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_NEWPORT_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_NEWPORT_AUTORECONF = NO
-- 
1.6.3.3
