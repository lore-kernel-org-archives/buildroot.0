From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 07:11:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20070812141103.129AEA611A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 07:11:02 -0700 (Sun, 12 Aug 2007)
New Revision: 19461

Log:
Use new x11r7 configs

Modified:
   trunk/buildroot/package/matchbox/Config.in


Changeset:
Modified: trunk/buildroot/package/matchbox/Config.in
===================================================================
--- trunk/buildroot/package/matchbox/Config.in	2007-08-12 12:37:51 UTC (rev 19460)
+++ trunk/buildroot/package/matchbox/Config.in	2007-08-12 14:11:02 UTC (rev 19461)
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MATCHBOX
 	bool "MatchBox Window Manager"
 	default n
-	select BR2_PACKAGE_X11SERVER
+	select BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_X11R7_LIBXDAMAGE
-	select BR2_PACKAGE_X11R7_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	help
 
 	  http://projects.o-hand.com/matchbox
@@ -12,7 +12,7 @@
 config BR2_PACKAGE_MATCHBOX_SNOTIFY
 	bool "Enable Matchbox Startup Notification"
 	depends BR2_PACKAGE_MATCHBOX
-	select BR2_PACKAGE_X11R7_LIBXSM
+	select BR2_PACKAGE_XAPP_XSM
 	default n
 	help
 
@@ -37,7 +37,7 @@
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Metchbox Virtual Keyboard"
 	depends BR2_PACKAGE_MATCHBOX
-	select BR2_PACKAGE_X11R7_LIBXTST
+	select BR2_PACKAGE_XLIB_LIBXTST
 	default n
 	help
 
