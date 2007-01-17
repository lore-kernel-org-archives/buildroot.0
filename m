From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 04:04:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070117120400.60D5D48591@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 04:03:59 -0800 (Wed, 17 Jan 2007)
New Revision: 17337

Log:
- make the BR2_X_WINDOW_SYSTEM a menuconfig to make it look nicer


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 11:48:11 UTC (rev 17336)
+++ trunk/buildroot/package/Config.in	2007-01-17 12:03:59 UTC (rev 17337)
@@ -217,14 +217,13 @@
 source "package/xfsprogs/Config.in"
 source "package/zlib/Config.in"
 
-config BR2_X_WINDOW_SYSTEM
+menuconfig BR2_X_WINDOW_SYSTEM
 	bool "X Window System"
 	default n
 	help
 	  Support for X and related packages
 
 if BR2_X_WINDOW_SYSTEM
-menu "X11"
 comment "X server"
 source "package/xorg/Config.in"
 source "package/tinyx/Config.in"
@@ -243,7 +242,7 @@
 comment "X applications"
 source "package/rxvt/Config.in"
 source "package/dillo/Config.in"
-endmenu
+
 endif
 
 endmenu
