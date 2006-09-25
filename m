From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Sep 2006 06:37:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dillo
Message-ID: <20060925133713.9DA7E48633@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-25 06:37:13 -0700 (Mon, 25 Sep 2006)
New Revision: 16218

Log:
depend instead of select on zlib/png to shut up Kconfig warning
(doesn't change anything as xorg already depends on them)


Modified:
   trunk/buildroot/package/dillo/Config.in


Changeset:
Modified: trunk/buildroot/package/dillo/Config.in
===================================================================
--- trunk/buildroot/package/dillo/Config.in	2006-09-25 12:35:27 UTC (rev 16217)
+++ trunk/buildroot/package/dillo/Config.in	2006-09-25 13:37:13 UTC (rev 16218)
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_DILLO
 	bool "dillo"
 	default n
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBGLIB12
 	select BR2_PACKAGE_LIBGTK12
 	depends BR2_PACKAGE_XORG
+	depends BR2_PACKAGE_ZLIB
+	depends BR2_PACKAGE_LIBPNG
 	help
 	  Dillo is a small GTK+ based web browser written in C.
 
