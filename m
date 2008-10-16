From: laird at uclibc.org <laird@uclibc.org>
Date: Thu, 16 Oct 2008 05:10:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sawman
Message-ID: <20081016121023.841B23C8CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-16 05:10:23 -0700 (Thu, 16 Oct 2008)
New Revision: 23694

Log:
package/sawman: Add Package SawMan

SaWMan is a new window manager module for use with DirectFB. 
Its main difference to the default module is that it allows one process 
to be an application and window manager, 
implementing all kinds of diversity, 
while SaWMan is only the working horse. 

Daniel Laird


Added:
   trunk/buildroot/package/sawman/
   trunk/buildroot/package/sawman/Config.in
   trunk/buildroot/package/sawman/sawman.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-10-16 09:46:07 UTC (rev 23693)
+++ trunk/buildroot/package/Config.in	2008-10-16 12:10:23 UTC (rev 23694)
@@ -318,6 +318,7 @@
 source "package/libungif/Config.in"
 source "package/lite/Config.in"
 source "package/pixman/Config.in"
+source "package/sawman/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"

Added: trunk/buildroot/package/sawman/Config.in
===================================================================
--- trunk/buildroot/package/sawman/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sawman/Config.in	2008-10-16 12:10:23 UTC (rev 23694)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SAWMAN
+	bool "SawMan (Window Manager)"
+	depends on BR2_PACKAGE_DIRECTFB
+	help
+	  SaWMan is a new window manager module for use with DirectFB. 
+          Its main difference to the default module is that it allows 
+          one process to be an application and window manager, 
+          implementing all kinds of diversity, while SaWMan is only the 
+          working horse.
+
+	   See http://www.directfb.org/downloads/Extras/README.SaWMan
+

Added: trunk/buildroot/package/sawman/sawman.mk
===================================================================
--- trunk/buildroot/package/sawman/sawman.mk	                        (rev 0)
+++ trunk/buildroot/package/sawman/sawman.mk	2008-10-16 12:10:23 UTC (rev 23694)
@@ -0,0 +1,16 @@
+#############################################################
+#
+# SAWMAN
+#
+#############################################################
+SAWMAN_VERSION:=1.2.0-rc1
+SAWMAN_SOURCE:=SaWMan-$(SAWMAN_VERSION).tar.gz
+SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
+SAWMAN_INSTALL_STAGING = YES
+SAWMAN_INSTALL_TARGET = YES
+SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
+SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install-strip
+SAWMAN_DEPENDENCIES = directfb
+
+$(eval $(call AUTOTARGETS,package,sawman))
+
