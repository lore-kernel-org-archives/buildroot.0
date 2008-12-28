From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 28 Dec 2008 22:28:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081228222851.47FA276D44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-28 22:28:49 +0000 (Sun, 28 Dec 2008)
New Revision: 24586

Log:
package: make X server selection a choice and fix tinyx prefix

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-28 22:15:26 UTC (rev 24585)
+++ trunk/buildroot/package/Config.in	2008-12-28 22:28:49 UTC (rev 24586)
@@ -315,7 +315,12 @@
 #source "package/microwin/Config.in"
 
 
-menu "X Window System server"
+choice
+	prompt "X Window System server"
+	default BR2_PACKAGE_XSERVER_none
+	help
+	  Select the X Window System server to use
+
 config BR2_PACKAGE_XSERVER_none
 	bool "none"
 	default y
@@ -327,12 +332,12 @@
 	depends on !(BR2_USE_WCHAR && BR2_ENABLE_LOCALE)
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
-endmenu
+endchoice
 
 config BR2_X11_PREFIX
 	string
-	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg || BR2_PACKAGE_XSERVER_tinyx
-	default "/usr"		if !BR2_PACKAGE_XSERVER_xorg && !BR2_PACKAGE_XSERVER_tinyx
+	default "/usr/X11R6"	if BR2_PACKAGE_XSERVER_xorg
+	default "/usr"		if BR2_PACKAGE_XSERVER_tinyx
 	help
 	  X11 apps root location
 
