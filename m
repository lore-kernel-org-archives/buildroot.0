From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:21:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  pcmanfm
Message-ID: <20080306182105.869871201EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:21:04 -0800 (Thu, 06 Mar 2008)
New Revision: 21219

Log:
added pcmanfm file manager

Added:
   trunk/buildroot/package/pcmanfm/
   trunk/buildroot/package/pcmanfm/Config.in
   trunk/buildroot/package/pcmanfm/pcmanfm.mk


Changeset:
Added: trunk/buildroot/package/pcmanfm/Config.in
===================================================================
--- trunk/buildroot/package/pcmanfm/Config.in	                        (rev 0)
+++ trunk/buildroot/package/pcmanfm/Config.in	2008-03-06 18:21:04 UTC (rev 21219)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PCMANFM
+	bool "pcmanfm"
+	select BR2_PACKAGE_GAMIN
+	select BR2_PACKAGE_STARTUP_NOTIFICATION
+	select BR2_PACKAGE_LIBGTK2
+	default n
+	help
+	  An extremly fast and lightweight file manager which features tabbed browsing and user-friendly interface.
+
+	  http://internap.dl.sourceforge.net/sourceforge/pcmanfm

Added: trunk/buildroot/package/pcmanfm/pcmanfm.mk
===================================================================
--- trunk/buildroot/package/pcmanfm/pcmanfm.mk	                        (rev 0)
+++ trunk/buildroot/package/pcmanfm/pcmanfm.mk	2008-03-06 18:21:04 UTC (rev 21219)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# pcmanfm
+#
+#############################################################
+PCMANFM_VERSION = 0.3.5.9
+PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
+PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
+PCMANFM_AUTORECONF = NO
+PCMANFM_INSTALL_STAGING = NO
+PCMANFM_INSTALL_TARGET = YES
+
+PCMANFM_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+PCMANFM_CONF_OPT = --disable-hal
+
+PCMANFM_DEPENDENCIES = uclibc libgtk2 gamin startup-notification
+
+$(eval $(call AUTOTARGETS,package,pcmanfm))
+
