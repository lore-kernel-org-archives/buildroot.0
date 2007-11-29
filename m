From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:01:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dillo
Message-ID: <20071129130124.5BC7630084@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:01:23 -0800 (Thu, 29 Nov 2007)
New Revision: 20581

Log:
Make dillo depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/dillo/Config.in


Changeset:
Modified: trunk/buildroot/package/dillo/Config.in
===================================================================
--- trunk/buildroot/package/dillo/Config.in	2007-11-29 13:00:53 UTC (rev 20580)
+++ trunk/buildroot/package/dillo/Config.in	2007-11-29 13:01:23 UTC (rev 20581)
@@ -1,13 +1,16 @@
 config BR2_PACKAGE_DILLO
 	bool "dillo"
 	default n
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBGLIB12
-	select BR2_PACKAGE_LIBGTK12
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBPNG
+	depends BR2_PACKAGE_JPEG
+	depends BR2_PACKAGE_LIBGLIB12
+	depends BR2_PACKAGE_LIBGTK12
+	depends BR2_PACKAGE_ZLIB
+	depends BR2_PACKAGE_LIBPNG
 	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
 	help
 	  Dillo is a small GTK+ based web browser written in C.
 
 	  http://www.dillo.org/
+
+comment "dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))"
+	depends !BR2_PACKAGE_JPEG || !BR2_PACKAGE_LIBGLIB12 || !BR2_PACKAGE_LIBGTK12 || !BR2_PACKAGE_ZLIB || !BR2_PACKAGE_LIBPNG || !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
