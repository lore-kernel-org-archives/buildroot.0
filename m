From: Will Newton <will.newton@gmail.com>
Date: Thu, 2 Feb 2012 11:31:09 +0000
Subject: [Buildroot] [PATCH] pixman: Bump version to 0.24.2
Message-ID: <CAFbHwiTE-oKMz5iyy284Kz++1VwWhei-T=iAhUVx3o2_GJs-jA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch to disable tests is no longer required as configure
checks to see if the GTK+ tests should be built.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/pixman/pixman-0.10.0-no-tests.patch |   11 -----------
 package/pixman/pixman.mk                    |    2 +-
 2 files changed, 1 insertions(+), 12 deletions(-)
 delete mode 100644 package/pixman/pixman-0.10.0-no-tests.patch

diff --git a/package/pixman/pixman-0.10.0-no-tests.patch
b/package/pixman/pixman-0.10.0-no-tests.patch
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
index 2b39a77..11c21b9 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,7 +3,7 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.17.6
+PIXMAN_VERSION = 0.24.2
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
-- 
1.7.1
-------------- next part --------------
