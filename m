From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 May 2007 00:42:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dillo
Message-ID: <20070522074232.18A1F4809B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-22 00:42:32 -0700 (Tue, 22 May 2007)
New Revision: 18665

Log:
Use select instead of depends for dependencies

Modified:
   trunk/buildroot/package/dillo/Config.in


Changeset:
Modified: trunk/buildroot/package/dillo/Config.in
===================================================================
--- trunk/buildroot/package/dillo/Config.in	2007-05-22 07:40:36 UTC (rev 18664)
+++ trunk/buildroot/package/dillo/Config.in	2007-05-22 07:42:32 UTC (rev 18665)
@@ -4,9 +4,9 @@
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB12
 	select BR2_PACKAGE_LIBGTK12
-	depends BR2_PACKAGE_XORG
-	depends BR2_PACKAGE_ZLIB
-	depends BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_XORG
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
 	help
 	  Dillo is a small GTK+ based web browser written in C.
 
