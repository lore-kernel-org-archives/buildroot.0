From: correa at uclibc.org <correa@uclibc.org>
Date: Wed,  8 Oct 2008 22:06:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20081009050643.525103C755@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-08 22:06:42 -0700 (Wed, 08 Oct 2008)
New Revision: 23629

Log:
Fix dependencies in directfb config options

Modified:
   trunk/buildroot/package/directfb/Config.in


Changeset:
Modified: trunk/buildroot/package/directfb/Config.in
===================================================================
--- trunk/buildroot/package/directfb/Config.in	2008-10-08 23:22:11 UTC (rev 23628)
+++ trunk/buildroot/package/directfb/Config.in	2008-10-09 05:06:42 UTC (rev 23629)
@@ -17,6 +17,7 @@
         bool "build with X server backend"
         default n
         depends on BR2_PACKAGE_DIRECTFB
+	depends on BR2_PACKAGE_XSERVER_x11r7 || BR2_PACKAGE_XSERVER_tinyx
 
 config BR2_PACKAGE_DIRECTFB_UNIQUE
         bool "enable unique window manager"
@@ -63,7 +64,6 @@
         default y
         depends on BR2_PACKAGE_DIRECTFB
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_DIRECTFB_TSLIB
         bool "enable touchscreen support"
@@ -75,6 +75,7 @@
         bool "enable GIF support"
         default y
         depends on BR2_PACKAGE_DIRECTFB
+	select BR2_PACKAGE_LIBUNGIF
 
 config BR2_PACKAGE_DIRECTFB_JPEG
         bool "enable JPEG support"
