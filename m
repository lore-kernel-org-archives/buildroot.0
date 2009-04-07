From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  7 Apr 2009 19:22:50 +0000 (UTC)
Subject: [Buildroot] svn commit: [26016] trunk/buildroot/target/jffs2
Message-ID: <20090407192250.C8A3F768C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-07 19:22:50 +0000 (Tue, 07 Apr 2009)
New Revision: 26016

Log:
target/jffs2: default to big endian format for big endian archs

Same logic as in target/Config.in.arch.

Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2009-04-07 19:22:46 UTC (rev 26015)
+++ trunk/buildroot/target/jffs2/Config.in	2009-04-07 19:22:50 UTC (rev 26016)
@@ -90,7 +90,10 @@
 
 choice
 	prompt "Endianess"
-	default BR2_TARGET_ROOTFS_JFFS2_LE
+	default BR2_TARGET_ROOTFS_JFFS2_BE if BR2_alpha || BR2_armeb || \
+			BR2_avr32 || BR2_m68k || BR2_mips || \
+			BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
+			BR2_sh3eb || BR2_sh4eb || BR2_sparc || BR2_sparc64
 
 config BR2_TARGET_ROOTFS_JFFS2_LE
 	bool "little-endian"
