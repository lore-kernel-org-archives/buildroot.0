From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 14:17:01 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090304141702.2759E7626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 14:17:00 +0000 (Wed, 04 Mar 2009)
New Revision: 25527

Log:
alsa-utils: the entire package needs largefile support, not just aplay

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 14:13:37 UTC (rev 25526)
+++ trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 14:17:00 UTC (rev 25527)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
+	depends on BR2_LARGEFILE
 	depends on BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_NCURSES
 	help
@@ -8,6 +9,9 @@
 
 	  http://www.alsa-project.org/
 
+comment "alsa-utils requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 if BR2_PACKAGE_ALSA_UTILS
 menu "ALSA utils selection"
 
@@ -30,11 +34,7 @@
 
 config BR2_PACKAGE_ALSA_UTILS_APLAY
 	bool "aplay"
-	depends on BR2_LARGEFILE
 
-comment "aplay requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_ALSA_UTILS_ARECORD
 	bool "arecord"
 
