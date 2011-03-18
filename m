From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 18 Mar 2011 15:04:49 +0800
Subject: [Buildroot] [PATCH RESEND 1/2] pixman : bump to 0.20.2
Message-ID: <1300431891-15379-1-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "no-tests" patch hack Makefile.in to forbid test problems build
Without this patch, test programs are built but not installed. Only
building time is a little prolongd

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/pixman/pixman-0.10.0-no-tests.patch |   11 -----------
 package/pixman/pixman.mk                    |    3 ++-
 2 files changed, 2 insertions(+), 12 deletions(-)
 delete mode 100644 package/pixman/pixman-0.10.0-no-tests.patch

diff --git a/package/pixman/pixman-0.10.0-no-tests.patch b/package/pixman/pixman-0.10.0-no-tests.patch
deleted file mode 100644
index fbd0d26..0000000
--- a/package/pixman/pixman-0.10.0-no-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in.orig	2008-05-23 14:04:37.000000000 +0000
-+++ b/Makefile.in	2008-05-23 14:04:50.000000000 +0000
-@@ -198,7 +198,7 @@ sysconfdir = @sysconfdir@
- target_alias = @target_alias@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = pixman test
-+SUBDIRS = pixman
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = pixman-1.pc
- USERNAME = $$USER
diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 8c7a233..261b85a 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,8 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.6
+# "even, 0,2,4,6,8" major is stable version
+PIXMAN_VERSION = 0.20.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
-- 
1.7.0.4
