From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:55 +0100
Subject: [Buildroot] [PATCH 84/91] xapp_xgc: Bump version to 1.0.4
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-36-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>

- removed xapp_xgc-replace-ac-check-file.patch, applied upstream

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xapp_xgc/xapp_xgc-replace-ac-check-file.patch  |   29 --------------------
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch

diff --git a/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch b/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch
deleted file mode 100644
index 97cbcda..0000000
--- a/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From ff668395fc408f540604bd534e323b483f52a4ea Mon Sep 17 00:00:00 2001
-From: Gaetan Nadon <memsize@videotron.ca>
-Date: Mon, 01 Nov 2010 17:19:23 +0000
-Subject: config: replace AC_CHECK_FILE with test -f
-
-* AC_CHECK_FILE doesn't work for cross compilation
-
-Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
----
-diff --git a/configure.ac b/configure.ac
-index 667a3e7..0644050 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,8 +36,11 @@ XORG_DEFAULT_OPTIONS
- AC_PROG_LEX
- AC_PROG_YACC
- AC_PATH_PROG([YACC_INST], $YACC)
--AC_CHECK_FILE([$srcdir/gram.c], [],
--              [test -z "$YACC_INST" && AC_MSG_ERROR([yacc not found - unable to compile gram.y])])
-+if test ! -f "gram.c"; then
-+   if test -z "$YACC_INST"; then
-+      AC_MSG_ERROR([yacc not found - unable to compile gram.y])
-+   fi
-+fi
- 
- PKG_CHECK_MODULES(XGC, xaw7 xt)
- xt_appdefaultdir=`$PKG_CONFIG --variable=appdefaultdir xt`
---
-cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 69c464f..6ea4ebb 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.3
+XAPP_XGC_VERSION = 1.0.4
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_LICENSE = MIT
 XAPP_XGC_LICENSE_FILES = COPYING
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
-XAPP_XGC_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.7.10.4
