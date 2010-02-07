From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:48 +0100
Subject: [Buildroot] [PATCH 06/14] pixman: bump to 0.16.4
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-7-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/pixman/pixman-0.10.0-no-tests.patch |   11 -----------
 package/pixman/pixman.mk                    |    6 ++++--
 2 files changed, 4 insertions(+), 13 deletions(-)
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
index 9507bbf..95cd28d 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -3,11 +3,13 @@
 # pixman
 #
 ################################################################################
-PIXMAN_VERSION = 0.10.0
+PIXMAN_VERSION = 0.16.4
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
-PIXMAN_AUTORECONF = NO
+PIXMAN_LIBTOOL_PATCH = NO
 PIXMAN_INSTALL_STAGING = YES
 
+PIXMAN_CONF_OPT = --disable-gtk
+
 $(eval $(call AUTOTARGETS,package,pixman))
 $(eval $(call AUTOTARGETS,package,pixman,host))
-- 
1.6.6
