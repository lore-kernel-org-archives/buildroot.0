From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 10:03:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: cairo libgtk12
	libgtk2
Message-ID: <20070811170305.3CE0BA5D44@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 10:03:04 -0700 (Sat, 11 Aug 2007)
New Revision: 19431

Log:
Reintroduce dependencies on tinyx for libgtk[1]2 and cairo

Modified:
   trunk/buildroot/package/cairo/Config.in
   trunk/buildroot/package/libgtk12/Config.in
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/cairo/Config.in
===================================================================
--- trunk/buildroot/package/cairo/Config.in	2007-08-11 16:55:52 UTC (rev 19430)
+++ trunk/buildroot/package/cairo/Config.in	2007-08-11 17:03:04 UTC (rev 19431)
@@ -3,7 +3,7 @@
 	default n
 	select BR2_PACKAGE_PKGCONFIG
 	select BR2_PACKAGE_LIBPNG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	help
 	  Cairo is a 2D graphics library with support for multiple
 	  output devices. Currently supported output targets include

Modified: trunk/buildroot/package/libgtk12/Config.in
===================================================================
--- trunk/buildroot/package/libgtk12/Config.in	2007-08-11 16:55:52 UTC (rev 19430)
+++ trunk/buildroot/package/libgtk12/Config.in	2007-08-11 17:03:04 UTC (rev 19431)
@@ -2,7 +2,7 @@
 	bool "libgtk12"
 	default n
 	select BR2_PACKAGE_LIBGLIB12
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	help
 	  The GTK+ graphical user interface library
 

Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2007-08-11 16:55:52 UTC (rev 19430)
+++ trunk/buildroot/package/libgtk2/Config.in	2007-08-11 17:03:04 UTC (rev 19431)
@@ -7,7 +7,7 @@
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_LIBPNG
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	help
 	  The GTK+ version 2 graphical user interface library
 
