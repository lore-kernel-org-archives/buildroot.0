From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 16:04:20 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090219160420.D7A1F764B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-19 16:04:20 +0000 (Thu, 19 Feb 2009)
New Revision: 25389

Log:
alsa-utils: select ncurses library dependency

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-02-19 15:45:05 UTC (rev 25388)
+++ trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-02-19 16:04:20 UTC (rev 25389)
@@ -1,17 +1,13 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_PACKAGE_ALSA_LIB
-	depends on BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
 
 	  http://www.alsa-project.org/
 
-comment "alsa-utils needs ncurses"
-	depends on BR2_PACKAGE_ALSA_LIB
-	depends on !BR2_PACKAGE_NCURSES
-
 menu "ALSA utils selection"
 	depends on BR2_PACKAGE_ALSA_UTILS
 
