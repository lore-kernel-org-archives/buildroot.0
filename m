From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Jun 2008 06:00:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/x11r7/pixman
Message-ID: <20080630130018.89B1E3C3F8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-30 06:00:18 -0700 (Mon, 30 Jun 2008)
New Revision: 22566

Log:
pixman: bump version

Based on googlecode r507 by Arnar Mar Sigurdsson.


Added:
   trunk/buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch

Removed:
   trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-no-tests.patch

Modified:
   trunk/buildroot/package/x11r7/pixman/pixman.mk


Changeset:
Added: trunk/buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch	                        (rev 0)
+++ trunk/buildroot/package/x11r7/pixman/pixman-0.10.0-no-tests.patch	2008-06-30 13:00:18 UTC (rev 22566)
@@ -0,0 +1,11 @@
+--- a/Makefile.in.orig	2008-05-23 14:04:37.000000000 +0000
++++ b/Makefile.in	2008-05-23 14:04:50.000000000 +0000
+@@ -198,7 +198,7 @@ sysconfdir = @sysconfdir@
+ target_alias = @target_alias@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = pixman test
++SUBDIRS = pixman
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = pixman-1.pc
+ USERNAME = $$USER

Deleted: trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-no-tests.patch
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-no-tests.patch	2008-06-30 12:55:29 UTC (rev 22565)
+++ trunk/buildroot/package/x11r7/pixman/pixman-0.9.6-no-tests.patch	2008-06-30 13:00:18 UTC (rev 22566)
@@ -1,11 +0,0 @@
---- a/Makefile.in.orig	2008-01-30 12:56:25.000000000 -0500
-+++ b/Makefile.in	2008-01-30 12:56:38.000000000 -0500
-@@ -198,7 +198,7 @@ sbindir = @sbindir@
- sharedstatedir = @sharedstatedir@
- sysconfdir = @sysconfdir@
- target_alias = @target_alias@
--SUBDIRS = pixman test
-+SUBDIRS = pixman 
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = pixman-1.pc
- RELEASE_OR_SNAPSHOT = $$(if test "x$(CAIRO_VERSION_MINOR)" = "x$$(echo "$(CAIRO_VERSION_MINOR)/2*2" | bc)" ; then echo release; else echo snapshot; fi)

Modified: trunk/buildroot/package/x11r7/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/x11r7/pixman/pixman.mk	2008-06-30 12:55:29 UTC (rev 22565)
+++ trunk/buildroot/package/x11r7/pixman/pixman.mk	2008-06-30 13:00:18 UTC (rev 22566)
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIXMAN_VERSION = 0.9.6
+PIXMAN_VERSION = 0.10.0
 PIXMAN_SOURCE = pixman-$(PIXMAN_VERSION).tar.gz
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
