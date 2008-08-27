From: laird at uclibc.org <laird@uclibc.org>
Date: Wed, 27 Aug 2008 05:21:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gtkperf
Message-ID: <20080827122109.F24AB3C808@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-27 05:21:09 -0700 (Wed, 27 Aug 2008)
New Revision: 23241

Log:
gtkperf: Adding gtkperf package

Allows some benchmarking of GTK on different targets.



Added:
   trunk/buildroot/package/gtkperf/
   trunk/buildroot/package/gtkperf/Config.in
   trunk/buildroot/package/gtkperf/gtkperf.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-27 11:40:02 UTC (rev 23240)
+++ trunk/buildroot/package/Config.in	2008-08-27 12:21:09 UTC (rev 23241)
@@ -405,6 +405,7 @@
 source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/gqview/Config.in"
+source "package/gtkperf/Config.in"
 source "package/leafpad/Config.in"
 source "package/midori/Config.in"
 source "package/pcmanfm/Config.in"

Added: trunk/buildroot/package/gtkperf/Config.in
===================================================================
--- trunk/buildroot/package/gtkperf/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gtkperf/Config.in	2008-08-27 12:21:09 UTC (rev 23241)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GTKPERF
+	bool "gtkperf (performance test for GTK2)"
+	depends on BR2_PACKAGE_LIBGTK2
+	help
+	  GtkPerf is an application designed to test GTK+ performance.
+	  The point is to create common testing platform to run
+	  predefined GTK+ widgets
+	  e.g. (opening comboboxes, toggling buttons, scrolling text yms.)
+	  and this way define the speed of device/platform.
+

Added: trunk/buildroot/package/gtkperf/gtkperf.mk
===================================================================
--- trunk/buildroot/package/gtkperf/gtkperf.mk	                        (rev 0)
+++ trunk/buildroot/package/gtkperf/gtkperf.mk	2008-08-27 12:21:09 UTC (rev 23241)
@@ -0,0 +1,15 @@
+#############################################################
+#
+# GtkPerf
+#
+#############################################################
+GTKPERF_VERSION:=0.40
+GTKPERF_SOURCE:=gtkperf_$(GTKPERF_VERSION).tar.gz
+GTKPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gtkperf
+GTKPERF_AUTORECONF = NO
+GTKPERF_INSTALL_TARGET = YES
+GTKPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+GTKPERF_DEPENDENCIES = libgtk2
+
+$(eval $(call AUTOTARGETS,package,gtkperf))
+
