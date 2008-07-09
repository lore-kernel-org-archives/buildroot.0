From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  8 Jul 2008 21:27:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  gperf
Message-ID: <20080709042746.AE27F3C6A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-08 21:27:45 -0700 (Tue, 08 Jul 2008)
New Revision: 22696

Log:
Add gperf, perfect hash generator

Added:
   trunk/buildroot/package/gperf/
   trunk/buildroot/package/gperf/Config.in
   trunk/buildroot/package/gperf/gperf.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-07-08 20:41:57 UTC (rev 22695)
+++ trunk/buildroot/package/Config.in	2008-07-09 04:27:45 UTC (rev 22696)
@@ -71,6 +71,7 @@
 source "package/dash/Config.in"
 source "package/file/Config.in"
 source "package/gamin/Config.in"
+source "package/gperf/Config.in"
 source "package/icu/Config.in"
 source "package/ipkg/Config.in"
 source "package/kexec/Config.in"

Added: trunk/buildroot/package/gperf/Config.in
===================================================================
--- trunk/buildroot/package/gperf/Config.in	                        (rev 0)
+++ trunk/buildroot/package/gperf/Config.in	2008-07-09 04:27:45 UTC (rev 22696)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GPERF
+	bool "gperf"
+	default n
+	help
+	  A 'perfect hash function' generator
+
+	  $(BR2_GNU_MIRROR)

Added: trunk/buildroot/package/gperf/gperf.mk
===================================================================
--- trunk/buildroot/package/gperf/gperf.mk	                        (rev 0)
+++ trunk/buildroot/package/gperf/gperf.mk	2008-07-09 04:27:45 UTC (rev 22696)
@@ -0,0 +1,22 @@
+#############################################################
+#
+# gperf
+#
+#############################################################
+GPERF_VERSION = 3.0.3
+GPERF_SOURCE = gperf-$(GPERF_VERSION).tar.gz
+GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
+GPERF_AUTORECONF = NO
+GPERF_INSTALL_STAGING = YES
+GPERF_INSTALL_TARGET = YES
+GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
+GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install 
+
+GPERF_CONF_ENV = 
+
+GPERF_CONF_OPT = 
+
+GPERF_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,gperf))
+
