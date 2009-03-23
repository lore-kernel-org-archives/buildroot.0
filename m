From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 13:30:30 +0000 (UTC)
Subject: [Buildroot] svn commit: [25795] trunk/buildroot/target/u-boot:
	1.2.0-atmel 1.3.4 2008.10 2009.01
Message-ID: <20090323133030.714547656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 13:30:30 +0000 (Mon, 23 Mar 2009)
New Revision: 25795

Log:
u-boot: get rid of version specific patch dirs

All those dirs seem a bit excessive for a single patch

Added:
   trunk/buildroot/target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32

Removed:
   trunk/buildroot/target/u-boot/1.2.0-atmel/.empty
   trunk/buildroot/target/u-boot/1.3.4/.empty
   trunk/buildroot/target/u-boot/2008.10/.empty
   trunk/buildroot/target/u-boot/2009.01/.empty
   trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32

Modified:
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Deleted: trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32
===================================================================
--- trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	2009-03-23 12:50:10 UTC (rev 25794)
+++ trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	2009-03-23 13:30:30 UTC (rev 25795)
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

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-03-23 12:50:10 UTC (rev 25794)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-03-23 13:30:30 UTC (rev 25795)
@@ -81,7 +81,7 @@
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
 ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),)

Copied: trunk/buildroot/target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32 (from rev 25794, trunk/buildroot/target/u-boot/2009.01/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32)
===================================================================
--- trunk/buildroot/target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	                        (rev 0)
+++ trunk/buildroot/target/u-boot/u-boot-2009.01-include_asm-avr32_io.h.patch.avr32	2009-03-23 13:30:30 UTC (rev 25795)
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
