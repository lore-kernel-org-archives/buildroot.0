From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:38:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  xstroke
Message-ID: <20080306183820.F367B1202BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:38:20 -0800 (Thu, 06 Mar 2008)
New Revision: 21245

Log:
added xstroke

Added:
   trunk/buildroot/package/xstroke/
   trunk/buildroot/package/xstroke/Config.in
   trunk/buildroot/package/xstroke/xstroke.mk


Changeset:
Added: trunk/buildroot/package/xstroke/Config.in
===================================================================
--- trunk/buildroot/package/xstroke/Config.in	                        (rev 0)
+++ trunk/buildroot/package/xstroke/Config.in	2008-03-06 18:38:20 UTC (rev 21245)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XSTROKE
+	bool "xstroke"
+	default n
+	help
+	  Handwriting recognition for X
+
+	  http://avr32linux.org/twiki/pub/Main/XStroke

Added: trunk/buildroot/package/xstroke/xstroke.mk
===================================================================
--- trunk/buildroot/package/xstroke/xstroke.mk	                        (rev 0)
+++ trunk/buildroot/package/xstroke/xstroke.mk	2008-03-06 18:38:20 UTC (rev 21245)
@@ -0,0 +1,17 @@
+#############################################################
+#
+# xstroke
+#
+#############################################################
+XSTROKE_VERSION = 0.6
+XSTROKE_SOURCE = xstroke-$(XSTROKE_VERSION).tar.gz
+XSTROKE_SITE = http://avr32linux.org/twiki/pub/Main/XStroke
+XSTROKE_AUTORECONF = NO
+XSTROKE_INSTALL_STAGING = NO
+XSTROKE_INSTALL_TARGET = YES
+XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+XSTROKE_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,xstroke))
+
