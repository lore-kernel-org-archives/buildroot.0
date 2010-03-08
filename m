From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump util-macros to 1.3.0
Message-ID: <20100308133617.54DAC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4c85b01f8727e98e2ccec73b3a9f9f068464a1c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xutil_util-macros/Config.in          |    2 +-
 .../xutil_util-macros-1.2.2.patch                  |   16 ----------------
 .../xutil_util-macros-1.3.0.patch                  |    9 +++++++++
 .../x11r7/xutil_util-macros/xutil_util-macros.mk   |    2 +-
 4 files changed, 11 insertions(+), 18 deletions(-)
 delete mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch
 create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch

diff --git a/package/x11r7/xutil_util-macros/Config.in b/package/x11r7/xutil_util-macros/Config.in
index 635c886..dd55243 100644
--- a/package/x11r7/xutil_util-macros/Config.in
+++ b/package/x11r7/xutil_util-macros/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XUTIL_UTIL_MACROS
 	bool "util-macros"
 	help
-	  util-macros 1.1.5
+	  util-macros 1.3.0
 	  No description available
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch
deleted file mode 100644
index 649db52..0000000
--- a/package/x11r7/xutil_util-macros/xutil_util-macros-1.2.2.patch
+++ /dev/null
@@ -1,16 +0,0 @@
----
- xorg-macros.m4.in |    3 +++
- 1 file changed, 3 insertions(+)
-
-Index: xutil_util-macros-1.2.2/xorg-macros.m4.in
-===================================================================
---- xutil_util-macros-1.2.2.orig/xorg-macros.m4.in
-+++ xutil_util-macros-1.2.2/xorg-macros.m4.in
-@@ -459,3 +459,6 @@
- fi
- AC_SUBST(CWARNFLAGS)
- ]) # XORG_CWARNFLAGS
-+
-+# Buildroot stuff
-+AC_SUBST(STAGING_DIR)
-\ No newline at end of file
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
new file mode 100644
index 0000000..de3ff01
--- /dev/null
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros-1.3.0.patch
@@ -0,0 +1,9 @@
+--- xutil_util-macros-1.3.0/xorg-macros.m4.in.orig	2010-01-23 19:23:30.306334212 +0200
++++ xutil_util-macros-1.3.0/xorg-macros.m4.in	2010-01-23 19:25:03.462333685 +0200
+@@ -499,3 +499,6 @@ XORG_RELEASE_VERSION
+ XORG_CHANGELOG
+ XORG_MANPAGE_SECTIONS
+ ]) # XORG_DEFAULT_OPTIONS
++
++# Buildroot stuff
++AC_SUBST(STAGING_DIR)
diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros.mk b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
index ca1890e..648136e 100644
--- a/package/x11r7/xutil_util-macros/xutil_util-macros.mk
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.2.2
+XUTIL_UTIL_MACROS_VERSION = 1.3.0
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.bz2
 XUTIL_UTIL_MACROS_SITE = http://xorg.freedesktop.org/releases/individual/util
 XUTIL_UTIL_MACROS_AUTORECONF = NO
-- 
1.6.3.3
