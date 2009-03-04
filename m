From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 13:22:55 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/alsa-utils
Message-ID: <20090304132255.6D2047626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 13:22:54 +0000 (Wed, 04 Mar 2009)
New Revision: 25525

Log:
alsa-utils: use conditional for utils selection menu items

Modified:
   trunk/buildroot/package/multimedia/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:50 UTC (rev 25524)
+++ trunk/buildroot/package/multimedia/alsa-utils/Config.in	2009-03-04 13:22:54 UTC (rev 25525)
@@ -8,69 +8,58 @@
 
 	  http://www.alsa-project.org/
 
+if BR2_PACKAGE_ALSA_UTILS
 menu "ALSA utils selection"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ALSACONF
 	bool "alsaconf"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 	bool "alsactl"
 	default y
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	default y
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
 	bool "amixer"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_APLAY
 	bool "aplay"
 	depends on BR2_LARGEFILE
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 comment "aplay requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORD
 	bool "arecord"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
 	bool "iecset"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ACONNECT
 	bool "aconnect"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
 	bool "aplaymidi"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
 	bool "arecordmidi"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQDUMP
 	bool "aseqdump"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQNET
 	bool "aseqnet"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 	bool "speaker-test"
-	depends on BR2_PACKAGE_ALSA_UTILS
 
 endmenu
+
+endif
+
