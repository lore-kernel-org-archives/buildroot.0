From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 10:11:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot: 2009.01
	2009.01-rc3
Message-ID: <20090122101110.24613765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-22 10:11:09 +0000 (Thu, 22 Jan 2009)
New Revision: 24958

Log:
u-boot: add 2009.01, remove -rc3

Added:
   trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32

Removed:
   trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32

Modified:
   trunk/buildroot/target/u-boot/Config.in


Changeset:
Copied: trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 (from rev 24957, trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32)
===================================================================
--- trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	                        (rev 0)
+++ trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	2009-01-22 10:11:09 UTC (rev 24958)
@@ -0,0 +1,13 @@
+diff -urN u-boot-2009.01-rc3/include/asm-avr32/io.h u-boot-avr32//include/asm-avr32/io.h
+--- u-boot-2009.01-rc3/include/asm-avr32/io.h	2009-01-18 21:37:48.000000000 +0100
++++ u-boot-avr32//include/asm-avr32/io.h	2009-01-22 07:14:38.000000000 +0100
+@@ -125,9 +125,4 @@
+ 
+ }
+ 
+-static inline phys_addr_t virt_to_phys(void * vaddr)
+-{
+-	return (phys_addr_t)(vaddr);
+-}
+-
+ #endif /* __ASM_AVR32_IO_H */

Deleted: trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32	2009-01-22 10:04:30 UTC (rev 24957)
+++ trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32	2009-01-22 10:11:09 UTC (rev 24958)
@@ -1,13 +0,0 @@
-diff -urN u-boot-2009.01-rc3/include/asm-avr32/io.h u-boot-avr32//include/asm-avr32/io.h
---- u-boot-2009.01-rc3/include/asm-avr32/io.h	2009-01-18 21:37:48.000000000 +0100
-+++ u-boot-avr32//include/asm-avr32/io.h	2009-01-22 07:14:38.000000000 +0100
-@@ -125,9 +125,4 @@
- 
- }
- 
--static inline phys_addr_t virt_to_phys(void * vaddr)
--{
--	return (phys_addr_t)(vaddr);
--}
--
- #endif /* __ASM_AVR32_IO_H */

Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-22 10:04:30 UTC (rev 24957)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-22 10:11:09 UTC (rev 24958)
@@ -17,12 +17,9 @@
 	help
 	  Select the specific U-Boot version you want to use
 
-#config BR2_TARGET_UBOOT_2009_01
-#	bool "u-boot-2009.01"
+config BR2_TARGET_UBOOT_2009_01
+	bool "u-boot-2009.01"
 
-config BR2_TARGET_UBOOT_2009_01_RC3
-	bool "u-boot-2009.01-rc3"
-
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
 
@@ -39,7 +36,6 @@
 config BR2_UBOOT_VERSION
 	string
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
-	default "2009.01-rc3"	if BR2_TARGET_UBOOT_2009_01_RC3
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
 	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
 	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
