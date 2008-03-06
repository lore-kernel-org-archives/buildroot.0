From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:14:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  leafpad
Message-ID: <20080306181438.513D21201F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:14:37 -0800 (Thu, 06 Mar 2008)
New Revision: 21203

Log:
added leafpad

Added:
   trunk/buildroot/package/leafpad/
   trunk/buildroot/package/leafpad/Config.in
   trunk/buildroot/package/leafpad/leafpad.mk


Changeset:
Added: trunk/buildroot/package/leafpad/Config.in
===================================================================
--- trunk/buildroot/package/leafpad/Config.in	                        (rev 0)
+++ trunk/buildroot/package/leafpad/Config.in	2008-03-06 18:14:37 UTC (rev 21203)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LEAFPAD
+	bool "leafpad"
+	default n
+	help
+	  GTK+ based simple text editor
+
+	  http://savannah.nongnu.org/download/leafpad

Added: trunk/buildroot/package/leafpad/leafpad.mk
===================================================================
--- trunk/buildroot/package/leafpad/leafpad.mk	                        (rev 0)
+++ trunk/buildroot/package/leafpad/leafpad.mk	2008-03-06 18:14:37 UTC (rev 21203)
@@ -0,0 +1,16 @@
+#############################################################
+#
+# leafpad
+#
+#############################################################
+LEAFPAD_VERSION = 0.8.14
+LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
+LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
+LEAFPAD_AUTORECONF = NO
+LEAFPAD_INSTALL_STAGING = NO
+LEAFPAD_INSTALL_TARGET = YES
+
+LEAFPAD_DEPENDENCIES = uclibc libgtk2
+
+$(eval $(call AUTOTARGETS,package,leafpad))
+
