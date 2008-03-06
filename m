From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:26:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  synergy
Message-ID: <20080306182658.BD6E412028A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:26:58 -0800 (Thu, 06 Mar 2008)
New Revision: 21232

Log:
added synergy

Added:
   trunk/buildroot/package/synergy/
   trunk/buildroot/package/synergy/Config.in
   trunk/buildroot/package/synergy/synergy.mk


Changeset:
Added: trunk/buildroot/package/synergy/Config.in
===================================================================
--- trunk/buildroot/package/synergy/Config.in	                        (rev 0)
+++ trunk/buildroot/package/synergy/Config.in	2008-03-06 18:26:58 UTC (rev 21232)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SYNERGY
+	bool "synergy"
+	default n
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	help
+	  Synergy lets you easily share a single mouse and keyboard between multiple computers with different operating systems, each with its own display, without special hardware.
+
+	  http://synergy2.sourceforge.net/
+
+comment "synergy		- disabled (requires Xorg(7))"
+	depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)

Added: trunk/buildroot/package/synergy/synergy.mk
===================================================================
--- trunk/buildroot/package/synergy/synergy.mk	                        (rev 0)
+++ trunk/buildroot/package/synergy/synergy.mk	2008-03-06 18:26:58 UTC (rev 21232)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# synergy
+#
+#############################################################
+
+SYNERGY_VERSION = 1.3.1
+SYNERGY_SOURCE = synergy-$(SYNERGY_VERSION).tar.gz
+SYNERGY_SITE = http://internap.dl.sourceforge.net/sourceforge/synergy2/
+SYNERGY_AUTORECONF = NO
+SYNERGY_INSTALL_STAGING = NO
+SYNERGY_INSTALL_TARGET = YES
+
+SYNERGY_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc 
+
+SYNERGY_DEPENDENCIES = uclibc $(XSERVER)
+
+$(eval $(call AUTOTARGETS,package,synergy))
