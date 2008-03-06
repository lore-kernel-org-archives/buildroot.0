From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:27:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  torsmo
Message-ID: <20080306182738.CDFCA120281@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:27:38 -0800 (Thu, 06 Mar 2008)
New Revision: 21234

Log:
added torsmo

Added:
   trunk/buildroot/package/torsmo/
   trunk/buildroot/package/torsmo/Config.in
   trunk/buildroot/package/torsmo/torsmo.mk


Changeset:
Added: trunk/buildroot/package/torsmo/Config.in
===================================================================
--- trunk/buildroot/package/torsmo/Config.in	                        (rev 0)
+++ trunk/buildroot/package/torsmo/Config.in	2008-03-06 18:27:38 UTC (rev 21234)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TORSMO
+	bool "torsmo"
+	default n
+	help
+	  Torsmo is a system monitor that sits in the corner of your desktop.
+
+	  http://avr32linux.org/twiki/pub/Main/Torsmo

Added: trunk/buildroot/package/torsmo/torsmo.mk
===================================================================
--- trunk/buildroot/package/torsmo/torsmo.mk	                        (rev 0)
+++ trunk/buildroot/package/torsmo/torsmo.mk	2008-03-06 18:27:38 UTC (rev 21234)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# torsmo
+#
+#############################################################
+TORSMO_VERSION = 0.18
+TORSMO_SOURCE = torsmo-$(TORSMO_VERSION).tar.gz
+TORSMO_SITE = http://avr32linux.org/twiki/pub/Main/Torsmo
+TORSMO_AUTORECONF = NO
+TORSMO_INSTALL_STAGING = NO
+TORSMO_INSTALL_TARGET = YES
+
+TORSMO_CONF_OPT = --x-includes="-I$(STAGING_DIR)/usr/include/X11" --x-libraries="-I$(STAGING_DIR)/usr/lib" --with-x
+
+TORSMO_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,torsmo))
+
