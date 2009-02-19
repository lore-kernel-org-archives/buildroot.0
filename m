From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 15:45:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/libvorbis
Message-ID: <20090219154505.DB5AF766F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-19 15:45:05 +0000 (Thu, 19 Feb 2009)
New Revision: 25388

Log:
libvorbis: select libogg dependency

Library dependencies should be selected, and not use depends on.

Modified:
   trunk/buildroot/package/multimedia/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/libvorbis/Config.in	2009-02-19 15:45:00 UTC (rev 25387)
+++ trunk/buildroot/package/multimedia/libvorbis/Config.in	2009-02-19 15:45:05 UTC (rev 25388)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBVORBIS
 	bool "libvorbis"
-	depends on BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_PKGCONFIG
 	help
 	  Library for the Vorbis open source audio decoder
@@ -20,6 +20,3 @@
 	depends on BR2_PACKAGE_LIBVORBIS
 	help
 	  Use the Tremor fixed point implementation
-
-comment "libvorbis requires the package libogg to build"
-	depends on !BR2_PACKAGE_LIBOGG
