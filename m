From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:25:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:
	startup-notification
Message-ID: <20080306182546.D987F120281@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:25:46 -0800 (Thu, 06 Mar 2008)
New Revision: 21229

Log:
added startup-notification

Added:
   trunk/buildroot/package/startup-notification/
   trunk/buildroot/package/startup-notification/Config.in
   trunk/buildroot/package/startup-notification/startup-notification.mk


Changeset:
Added: trunk/buildroot/package/startup-notification/Config.in
===================================================================
--- trunk/buildroot/package/startup-notification/Config.in	                        (rev 0)
+++ trunk/buildroot/package/startup-notification/Config.in	2008-03-06 18:25:46 UTC (rev 21229)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_STARTUP_NOTIFICATION
+	bool "startup-notification"
+	default n
+	help
+	  Startup-notification is a library used to monitor application startup.
+
+	  http://freedesktop.org/software/startup-notification/releases

Added: trunk/buildroot/package/startup-notification/startup-notification.mk
===================================================================
--- trunk/buildroot/package/startup-notification/startup-notification.mk	                        (rev 0)
+++ trunk/buildroot/package/startup-notification/startup-notification.mk	2008-03-06 18:25:46 UTC (rev 21229)
@@ -0,0 +1,18 @@
+#############################################################
+#
+# startup-notification
+#
+#############################################################
+STARTUP_NOTIFICATION_VERSION = 0.9
+STARTUP_NOTIFICATION_SOURCE = startup-notification-$(STARTUP_NOTIFICATION_VERSION).tar.gz
+STARTUP_NOTIFICATION_SITE = http://freedesktop.org/software/startup-notification/releases
+STARTUP_NOTIFICATION_AUTORECONF = NO
+STARTUP_NOTIFICATION_INSTALL_STAGING = YES
+STARTUP_NOTIFICATION_INSTALL_TARGET = YES
+
+STARTUP_NOTIFICATION_CONF_ENV = lf_cv_sane_realloc=yes
+
+STARTUP_NOTIFICATION_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,startup-notification))
+
