From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  2 Jan 2009 20:30:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
Message-ID: <20090102203056.D5B9E769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-02 20:30:54 +0000 (Fri, 02 Jan 2009)
New Revision: 24649

Log:
toolchain/binutils: fix up avr32 related fallout of r24474

It's been 10 days now without any reply from Ulf, so fix it up to what
seems sensible.

Modified:
   trunk/buildroot/toolchain/binutils/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2009-01-02 15:44:18 UTC (rev 24648)
+++ trunk/buildroot/toolchain/binutils/Config.in	2009-01-02 20:30:54 UTC (rev 24649)
@@ -9,8 +9,8 @@
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_17
-		depends on BR2_avr32 || !BR2_nios2
-		depends on BR2_DEPRECATED && !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_DEPRECATED
 		depends on BR2_EXT_BINUTILS_VERSION_2_17
 		bool "binutils 2.17"
 
