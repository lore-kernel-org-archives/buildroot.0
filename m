From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 14:13:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090116141350.EECE477568@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 14:13:50 +0000 (Fri, 16 Jan 2009)
New Revision: 24881

Log:
toolchain/gcc: mark old versions as deprecated

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 14:13:46 UTC (rev 24880)
+++ trunk/buildroot/toolchain/gcc/Config.in	2009-01-16 14:13:50 UTC (rev 24881)
@@ -22,29 +22,35 @@
 	config BR2_GCC_VERSION_4_1_2
 		depends on !BR2_nios2
 		depends on BR2_EXT_GCC_VERSION_4_1_2
+		depends on BR2_DEPRECATED
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_1
 		depends on !BR2_nios2
 		depends on BR2_EXT_GCC_VERSION_4_2_1
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.1"
 
 	config BR2_GCC_VERSION_4_2_2
 		depends on BR2_avr32
 		depends on BR2_EXT_GCC_VERSION_4_2_2
+		depends on BR2_DEPRECATED
 		bool "gcc 4.2.2"
 
 	config BR2_GCC_VERSION_4_2_3
 		depends on !BR2_nios2
-		depends on BR2_EXT_GCC_VERSION_4_2_3 || BR2_DEPRECATED
+		depends on BR2_EXT_GCC_VERSION_4_2_3
+		depends on BR2_DEPRECATED || BR2_avr32
 		bool "gcc 4.2.3"
 
 	config BR2_GCC_VERSION_4_2_4
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "gcc 4.2.4"
 
 	config BR2_GCC_VERSION_4_3_1
 		depends on !BR2_avr32 && !BR2_nios2
+		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "gcc 4.3.1"
 
 	config BR2_GCC_VERSION_4_3_2
