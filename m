From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  7 Mar 2009 13:51:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [25567] trunk/buildroot/toolchain/binutils
Message-ID: <20090307135122.8A0F37646C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-07 13:51:22 +0000 (Sat, 07 Mar 2009)
New Revision: 25567

Log:
binutils: undeprecate 2.18 for avr32

As discussed on the list. AVR32 is still stuck at 2.18, so don't mark it as
deprecated yet.

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2009-03-07 01:54:24 UTC (rev 25566)
+++ trunk/buildroot/toolchain/binutils/Config.in	2009-03-07 13:51:22 UTC (rev 25567)
@@ -20,7 +20,7 @@
 
 	config BR2_BINUTILS_VERSION_2_18
 		depends on !BR2_nios2
-		depends on BR2_DEPRECATED
+		depends on BR2_DEPRECATED || BR2_avr32
 		depends on BR2_EXT_BINUTILS_VERSION_2_18
 		bool "binutils 2.18"
 
