From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 07:39:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc3
Message-ID: <20090122073913.5C9CE765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 07:39:12 +0000 (Thu, 22 Jan 2009)
New Revision: 24950

Log:
Fix AVR32 u.boot build bug

Added:
   trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32


Changeset:
Added: trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32	                        (rev 0)
+++ trunk/buildroot/target/u-boot/2009.01-rc3/u-boot-2009.01-rc3-include_asm-avr32_io.h.patch.avr32	2009-01-22 07:39:12 UTC (rev 24950)
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
