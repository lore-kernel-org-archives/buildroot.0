From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 13:22:51 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090304132251.3B72D7626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 13:22:50 +0000 (Wed, 04 Mar 2009)
New Revision: 25524

Log:
alsa-utils: aplay: use depends for toolchain options, not select

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:44 UTC (rev 25523)
+++ trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:50 UTC (rev 25524)
@@ -35,9 +35,12 @@
 
 config BR2_PACKAGE_ALSA_UTILS_APLAY
 	bool "aplay"
-	select BR2_LARGEFILE
+	depends on BR2_LARGEFILE
 	depends on BR2_PACKAGE_ALSA_UTILS
 
+comment "aplay requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_ALSA_UTILS_ARECORD
 	bool "arecord"
 	depends on BR2_PACKAGE_ALSA_UTILS
