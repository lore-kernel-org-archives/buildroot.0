From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 15:19:05 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090210151905.3E14176275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-10 15:19:04 +0000 (Tue, 10 Feb 2009)
New Revision: 25290

Log:
u-boot: don't make ETH1ADDR setting depend on avr32

No sensible reason why this should only be present on avr32.

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-02-10 13:01:28 UTC (rev 25289)
+++ trunk/buildroot/target/u-boot/Config.in	2009-02-10 15:19:04 UTC (rev 25290)
@@ -311,7 +311,6 @@
 
 config BR2_TARGET_UBOOT_ETH1ADDR
 	string "ethernet 2 address"
-	depends on BR2_TARGET_AVR32
 	help
 	  Target MAC address for the second ethernet interface.
 
