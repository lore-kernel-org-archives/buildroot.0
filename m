From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jun 2018 22:23:39 +0200
Subject: [Buildroot] [git commit] qemu: update defconfigs to Linux 4.16.7
Message-ID: <20180602202203.BCDE383866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03fb00f2175cdb4565e26fcb9b3da1c1059de1bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All linux configs are renamed to a version neutral filename
to avoid further renaming on kernel bumps.

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.16.7   2.12.0           YES     OK
arm_versatile           4.16.7   2.12.0           YES     OK
arm_versatile_nommu     4.16.7   2.12.0           YES     OK (3)
arm_vexpress            4.16.7   2.12.0           YES     OK
m68k_mcf5208            4.16.7   2.12.0           YES     OK
m68k_q800               4.16.7   q800-v2.11.0     NO (2)  OK
microblazebe            4.16.7   2.12.0           YES     OK
microblazeel            4.16.7   2.12.0           YES     OK
mips32r2el_malta        4.16.7   2.12.0           YES     OK
mips32r2_malta          4.16.7   2.12.0           YES     OK
mips32r6el_malta        4.16.7   2.12.0           YES     OK
mips32r6_malta          4.16.7   2.12.0           YES     OK
mips64el_malta          4.16.7   2.12.0           YES     OK
mips64_malta            4.16.7   2.12.0           YES     OK
mips64r6el_malta        4.16.7   2.12.0           YES     OK
mips64r6_malta          4.16.7   2.12.0           YES     OK
nios2-10m50             4.16.7   2.12.0           NO      OK
or1k                    4.16.7   2.12.0           NO      OK
ppc_g3beige             4.16.7   2.12.0           YES     OK
ppc_mpc8544ds           4.16.7   2.12.0           YES     OK
ppc_virtex_ml507        4.16.7   2.12.0           NO      OK
ppc64_pseries           4.16.7   2.12.0           YES     OK
ppc64le_pseries         4.16.7   2.12.0           YES     OK
ppc64_e5500             4.16.7   2.12.0           YES     OK
sh4                     4.16.7   2.12.0           YES     OK
sh4eb                   4.16.7   2.12.0           NO (1)  OK
sparc_ss10              4.16.7   2.12.0           YES     OK
sparc64_sun4u           4.16.7   2.12.0           YES     OK
x86                     4.16.7   2.12.0           YES     OK
x86_64                  4.16.7   2.12.0           YES     OK
xtensa_lx60             4.16.7   2.12.0           YES     OK
xtensa_lx60_nommu       4.16.7   2.12.0           YES     OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Kernel patch required, switched to devicetree usage

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../{linux-4.15.config => linux.config}            |  0
 board/qemu/aarch64-virt/readme.txt                 |  2 +-
 .../{linux-4.4-nommu.config => linux-nommu.config} |  3 +-
 .../{linux-4.13.config => linux.config}            |  0
 .../patches/linux/versatile-nommu.patch            | 96 +++++++++++++++++-----
 board/qemu/arm-versatile/readme.txt                |  4 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/m68k-mcf5208/readme.txt                 |  2 +-
 .../m68k-q800/{linux-4.11.config => linux.config}  |  0
 board/qemu/m68k-q800/readme.txt                    |  4 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips32r2-malta/readme.txt               |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips32r2el-malta/readme.txt             |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips32r6-malta/readme.txt               |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips32r6el-malta/readme.txt             |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips64el-malta/readme.txt               |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips64r6-malta/readme.txt               |  5 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/mips64r6el-malta/readme.txt             |  2 +-
 .../{linux-4.11.fragment => linux.fragment}        |  0
 board/qemu/nios2-10m50/readme.txt                  |  2 +-
 board/qemu/or1k/readme.txt                         |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/ppc-g3beige/readme.txt                  |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/ppc-mpc8544ds/readme.txt                |  2 +-
 .../{linux-4.9.config => linux.config}             |  0
 board/qemu/ppc-virtex-ml507/readme.txt             |  2 +-
 board/qemu/ppc64-e5500/readme.txt                  |  2 +-
 board/qemu/ppc64-pseries/readme.txt                |  2 +-
 board/qemu/ppc64le-pseries/readme.txt              |  2 +-
 .../sh4-r2d/{linux-4.9.config => linux.config}     |  0
 board/qemu/sh4-r2d/readme.txt                      |  2 +-
 .../sh4eb-r2d/{linux-4.9.config => linux.config}   |  0
 board/qemu/sh4eb-r2d/readme.txt                    |  2 +-
 .../sparc-ss10/{linux-4.11.config => linux.config} |  0
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/sparc64-sun4u/readme.txt                |  2 +-
 board/qemu/x86/{linux-4.15.config => linux.config} |  0
 board/qemu/x86/readme.txt                          |  2 +-
 .../x86_64/{linux-4.15.config => linux.config}     |  0
 board/qemu/x86_64/readme.txt                       |  2 +-
 ...{linux-4.11-nommu.config => linux-nommu.config} |  0
 .../{linux-4.11.config => linux.config}            |  0
 board/qemu/xtensa-lx60/readme.txt                  |  2 +-
 configs/qemu_aarch64_virt_defconfig                |  8 +-
 configs/qemu_arm_versatile_defconfig               |  8 +-
 configs/qemu_arm_versatile_nommu_defconfig         | 10 ++-
 configs/qemu_m68k_mcf5208_defconfig                |  8 +-
 configs/qemu_m68k_q800_defconfig                   |  8 +-
 configs/qemu_microblazebe_mmu_defconfig            |  8 +-
 configs/qemu_microblazeel_mmu_defconfig            |  8 +-
 configs/qemu_mips32r2_malta_defconfig              |  8 +-
 configs/qemu_mips32r2el_malta_defconfig            |  8 +-
 configs/qemu_mips32r6_malta_defconfig              |  8 +-
 configs/qemu_mips32r6el_malta_defconfig            |  8 +-
 configs/qemu_mips64_malta_defconfig                |  8 +-
 configs/qemu_mips64el_malta_defconfig              |  8 +-
 configs/qemu_mips64r6_malta_defconfig              |  8 +-
 configs/qemu_mips64r6el_malta_defconfig            |  8 +-
 configs/qemu_nios2_10m50_defconfig                 |  8 +-
 configs/qemu_or1k_defconfig                        |  6 +-
 configs/qemu_ppc64_e5500_defconfig                 |  4 +-
 configs/qemu_ppc64_pseries_defconfig               |  6 +-
 configs/qemu_ppc64le_pseries_defconfig             |  6 +-
 configs/qemu_ppc_g3beige_defconfig                 |  8 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |  8 +-
 configs/qemu_sh4_r2d_defconfig                     |  8 +-
 configs/qemu_sh4eb_r2d_defconfig                   |  8 +-
 configs/qemu_sparc64_sun4u_defconfig               |  8 +-
 configs/qemu_sparc_ss10_defconfig                  |  8 +-
 configs/qemu_x86_64_defconfig                      |  8 +-
 configs/qemu_x86_defconfig                         |  8 +-
 configs/qemu_xtensa_lx60_defconfig                 |  8 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |  8 +-
 89 files changed, 230 insertions(+), 176 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-4.15.config b/board/qemu/aarch64-virt/linux.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.15.config
rename to board/qemu/aarch64-virt/linux.config
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index ce0b621366..76fc2d6f32 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.11.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-versatile/linux-4.4-nommu.config b/board/qemu/arm-versatile/linux-nommu.config
similarity index 94%
rename from board/qemu/arm-versatile/linux-4.4-nommu.config
rename to board/qemu/arm-versatile/linux-nommu.config
index e1264dca00..1d91d51a14 100644
--- a/board/qemu/arm-versatile/linux-4.4-nommu.config
+++ b/board/qemu/arm-versatile/linux-nommu.config
@@ -1,11 +1,12 @@
 # CONFIG_MMU is not set
 CONFIG_ARCH_VERSATILE=y
+CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
 CONFIG_SET_MEM_PARAM=y
 CONFIG_DRAM_BASE=0x00000000
 CONFIG_DRAM_SIZE=0x08000000
 CONFIG_ARCH_VERSATILE_PB=y
 CONFIG_MACH_VERSATILE_AB=y
-# CONFIG_MACH_VERSATILE_DT is not set
+CONFIG_MACH_VERSATILE_DT=y
 CONFIG_BINFMT_FLAT=y
 CONFIG_SYSVIPC=y
 CONFIG_MODULES=y
diff --git a/board/qemu/arm-versatile/linux-4.13.config b/board/qemu/arm-versatile/linux.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.13.config
rename to board/qemu/arm-versatile/linux.config
diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
index 961b6c3dd1..883bd0de6e 100644
--- a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
+++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
@@ -1,30 +1,84 @@
-From b7c1666813424d329868335c8faf8886b0f85b6c Mon Sep 17 00:00:00 2001
-From: Greg Ungerer <gerg@linux-m68k.org>
-Date: Thu, 11 Aug 2016 21:33:11 +1000
-Subject: [PATCH] arm: fix versatile platform to work in no-MMU mode
+Signed-Off-by: Waldemar Brodkorb <wbx@openadk.org>
+From LKML.
 
-If CONFIG_MMU is disabled then do not carry out the virtual memory address
-translation for IO devices.
-
-With this fix in place we can run the ARM Versatile board (including its
-qemu emulation) as a no-MMU Linux system.
-
-Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-4.4.17.orig/arch/arm/mach-versatile/include/mach/hardware.h linux-4.4.17/arch/arm/mach-versatile/include/mach/hardware.h
---- linux-4.4.17.orig/arch/arm/mach-versatile/include/mach/hardware.h	2016-08-10 11:49:43.000000000 +0200
-+++ linux-4.4.17/arch/arm/mach-versatile/include/mach/hardware.h	2016-08-25 23:19:03.691716292 +0200
-@@ -30,8 +30,12 @@
- #define VERSATILE_PCI_VIRT_BASE		(void __iomem *)0xe8000000ul
- #define VERSATILE_PCI_CFG_VIRT_BASE	(void __iomem *)0xe9000000ul
+diff -Nur linux-4.15.13.orig/arch/arm/Kconfig linux-4.15.13/arch/arm/Kconfig
+--- linux-4.15.13.orig/arch/arm/Kconfig	2018-03-24 11:02:53.000000000 +0100
++++ linux-4.15.13/arch/arm/Kconfig	2018-04-01 03:47:33.415078244 +0100
+@@ -355,6 +355,17 @@
+ 	select SPARSE_IRQ
+ 	select USE_OF
+ 
++config ARM_SINGLE_ARCH_VERSATILE
++	bool "ARM Ltd. Versatile family"
++	depends on !MMU
++	select AUTO_ZRELADDR
++	select CLKSRC_OF
++	select COMMON_CLK
++	select GENERIC_CLOCKEVENTS
++	select GPIOLIB
++	select SPARSE_IRQ
++	select USE_OF
++
+ config ARCH_EBSA110
+ 	bool "EBSA-110"
+ 	select ARCH_USES_GETTIMEOFFSET
+diff -Nur linux-4.15.13.orig/arch/arm/Kconfig.debug linux-4.15.13/arch/arm/Kconfig.debug
+--- linux-4.15.13.orig/arch/arm/Kconfig.debug	2018-03-24 11:02:53.000000000 +0100
++++ linux-4.15.13/arch/arm/Kconfig.debug	2018-04-01 03:47:33.416078232 +0100
+@@ -1795,7 +1795,8 @@
+ config UNCOMPRESS_INCLUDE
+ 	string
+ 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
+-					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
++					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
++					ARM_SINGLE_ARCH_VERSATILE
+ 	default "mach/uncompress.h"
+ 
+ config EARLY_PRINTK
+diff -Nur linux-4.15.13.orig/arch/arm/include/asm/mach/map.h linux-4.15.13/arch/arm/include/asm/mach/map.h
+--- linux-4.15.13.orig/arch/arm/include/asm/mach/map.h	2018-03-24 11:02:53.000000000 +0100
++++ linux-4.15.13/arch/arm/include/asm/mach/map.h	2018-04-01 03:47:17.587276119 +0100
+@@ -62,6 +62,7 @@
+ #else
+ #define iotable_init(map,num)	do { } while (0)
+ #define vm_reserve_area_early(a,s,c)	do { } while (0)
++#define debug_ll_io_init()	do { } while (0)
+ #endif
+ 
+ #endif
+diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/Kconfig linux-4.15.13/arch/arm/mach-versatile/Kconfig
+--- linux-4.15.13.orig/arch/arm/mach-versatile/Kconfig	2018-03-24 11:02:53.000000000 +0100
++++ linux-4.15.13/arch/arm/mach-versatile/Kconfig	2018-04-01 03:47:33.417078219 +0100
+@@ -1,7 +1,8 @@
+ # SPDX-License-Identifier: GPL-2.0
+ config ARCH_VERSATILE
+-	bool "ARM Ltd. Versatile family"
+-	depends on ARCH_MULTI_V5
++	bool "ARM Ltd. Versatile family" if ARCH_MULTI_V5
++	depends on ARCH_MULTI_V5 || ARM_SINGLE_ARCH_VERSATILE
++	default y if ARM_SINGLE_ARCH_VERSATILE
+ 	select ARM_AMBA
+ 	select ARM_TIMER_SP804
+ 	select ARM_VIC
+diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/Makefile.boot linux-4.15.13/arch/arm/mach-versatile/Makefile.boot
+--- linux-4.15.13.orig/arch/arm/mach-versatile/Makefile.boot	1970-01-01 01:00:00.000000000 +0100
++++ linux-4.15.13/arch/arm/mach-versatile/Makefile.boot	2018-04-01 03:47:25.644175394 +0100
+@@ -0,0 +1,3 @@
++# Empty file waiting for deletion once Makefile.boot isn't needed any more.
++# Patch waits for application at
++# http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=7889/1 .
+diff -Nur linux-4.15.13.orig/arch/arm/mach-versatile/versatile_dt.c linux-4.15.13/arch/arm/mach-versatile/versatile_dt.c
+--- linux-4.15.13.orig/arch/arm/mach-versatile/versatile_dt.c	2018-03-24 11:02:53.000000000 +0100
++++ linux-4.15.13/arch/arm/mach-versatile/versatile_dt.c	2018-04-01 03:47:10.913359555 +0100
+@@ -37,7 +37,11 @@
+ #include <asm/mach/map.h>
  
-+#ifdef CONFIG_MMU
  /* macro to get at MMIO space when running virtually */
++#ifdef CONFIG_MMU
  #define IO_ADDRESS(x)		(((x) & 0x0fffffff) + (((x) >> 4) & 0x0f000000) + 0xf0000000)
 +#else
 +#define IO_ADDRESS(x)		(x)
 +#endif
- 
  #define __io_address(n)		((void __iomem __force *)IO_ADDRESS(n))
  
+ /*
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 6e899f4b5f..33cdb7b81e 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -4,9 +4,9 @@ Run the emulation with:
 
 Or for the noMMU emulation:
 
-  qemu-system-arm -M versatilepb -kernel output/images/zImage -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
+  qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
 
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 57bb814198..35137e050c 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -8,4 +8,4 @@ graphical window is the framebuffer.
 If you want to emulate more cores change "-smp 1" to "-smp 2" for
 dual-core or even "smp -4" for a quad-core configuration.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-mcf5208/linux-4.11.config b/board/qemu/m68k-mcf5208/linux.config
similarity index 100%
rename from board/qemu/m68k-mcf5208/linux-4.11.config
rename to board/qemu/m68k-mcf5208/linux.config
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
index 014a0dc09f..d1c9086805 100644
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/m68k-q800/linux-4.11.config b/board/qemu/m68k-q800/linux.config
similarity index 100%
rename from board/qemu/m68k-q800/linux-4.11.config
rename to board/qemu/m68k-q800/linux.config
diff --git a/board/qemu/m68k-q800/readme.txt b/board/qemu/m68k-q800/readme.txt
index 78267a318f..bead8cdde2 100644
--- a/board/qemu/m68k-q800/readme.txt
+++ b/board/qemu/m68k-q800/readme.txt
@@ -4,5 +4,5 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.4.0 from https://github.com/vivier/qemu-m68k
-You need following branch: q800-v2.4.0
+Tested with QEMU 2.11.0 from https://github.com/vivier/qemu-m68k
+You need following branch: q800-v2.11.0
diff --git a/board/qemu/microblazebe-mmu/linux-4.11.config b/board/qemu/microblazebe-mmu/linux.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.11.config
rename to board/qemu/microblazebe-mmu/linux.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index cf0afdaff8..4f52baff1f 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/microblazeel-mmu/linux-4.11.config b/board/qemu/microblazeel-mmu/linux.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.11.config
rename to board/qemu/microblazeel-mmu/linux.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 9edf101afd..0b0f330a5e 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2-malta/linux-4.11.config b/board/qemu/mips32r2-malta/linux.config
similarity index 100%
rename from board/qemu/mips32r2-malta/linux-4.11.config
rename to board/qemu/mips32r2-malta/linux.config
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index 7002ab1d86..d1bbcc4749 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r2el-malta/linux-4.11.config b/board/qemu/mips32r2el-malta/linux.config
similarity index 100%
rename from board/qemu/mips32r2el-malta/linux-4.11.config
rename to board/qemu/mips32r2el-malta/linux.config
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index bfc9c49d5a..4f59d34308 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6-malta/linux-4.11.config b/board/qemu/mips32r6-malta/linux.config
similarity index 100%
rename from board/qemu/mips32r6-malta/linux-4.11.config
rename to board/qemu/mips32r6-malta/linux.config
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 7d79c6602c..04de7e5c3e 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -d
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips32r6el-malta/linux-4.11.config b/board/qemu/mips32r6el-malta/linux.config
similarity index 100%
rename from board/qemu/mips32r6el-malta/linux-4.11.config
rename to board/qemu/mips32r6el-malta/linux.config
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index 78f8350506..88602de0bb 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64-malta/linux-4.11.config b/board/qemu/mips64-malta/linux.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.11.config
rename to board/qemu/mips64-malta/linux.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 8a732101a8..f0e7fef795 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64el-malta/linux-4.11.config b/board/qemu/mips64el-malta/linux.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.11.config
rename to board/qemu/mips64el-malta/linux.config
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 25fc9ee172..03b149bc8f 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6-malta/linux-4.11.config b/board/qemu/mips64r6-malta/linux.config
similarity index 100%
rename from board/qemu/mips64r6-malta/linux-4.11.config
rename to board/qemu/mips64r6-malta/linux.config
diff --git a/board/qemu/mips64r6-malta/readme.txt b/board/qemu/mips64r6-malta/readme.txt
index 4a6c5fe798..bf5b517a32 100644
--- a/board/qemu/mips64r6-malta/readme.txt
+++ b/board/qemu/mips64r6-malta/readme.txt
@@ -4,7 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.7.0
-
-Might work with 2.6.0 by changing the -cpu entry to MIPS64R6-generic
-since the naming was updated and the old name removed in 2.7.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/mips64r6el-malta/linux-4.11.config b/board/qemu/mips64r6el-malta/linux.config
similarity index 100%
rename from board/qemu/mips64r6el-malta/linux-4.11.config
rename to board/qemu/mips64r6el-malta/linux.config
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index 9250cf3791..d51bffd08a 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/nios2-10m50/linux-4.11.fragment b/board/qemu/nios2-10m50/linux.fragment
similarity index 100%
rename from board/qemu/nios2-10m50/linux-4.11.fragment
rename to board/qemu/nios2-10m50/linux.fragment
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
index f7dee370f7..44cbcb08a2 100644
--- a/board/qemu/nios2-10m50/readme.txt
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0.
+Tested with QEMU 2.12.0.
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index a04314e750..df6b467e82 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu.
 
 Ethernet support is not working, yet.
 
-Tested with QEMU 2.9.0.
+Tested with QEMU 2.12.0.
diff --git a/board/qemu/ppc-g3beige/linux-4.11.config b/board/qemu/ppc-g3beige/linux.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.11.config
rename to board/qemu/ppc-g3beige/linux.config
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 42c97a0c14..1c3b515396 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.11.config b/board/qemu/ppc-mpc8544ds/linux.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.11.config
rename to board/qemu/ppc-mpc8544ds/linux.config
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index 0008c84b20..172aad5626 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.9.config b/board/qemu/ppc-virtex-ml507/linux.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.9.config
rename to board/qemu/ppc-virtex-ml507/linux.config
diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index 42aa204bd7..6178ace816 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
index a6ad893b4d..cfc563974d 100644
--- a/board/qemu/ppc64-e5500/readme.txt
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.0.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 9de13779d0..5069df9e5b 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/ppc64le-pseries/readme.txt b/board/qemu/ppc64le-pseries/readme.txt
index 95455e9478..c23da70df0 100644
--- a/board/qemu/ppc64le-pseries/readme.txt
+++ b/board/qemu/ppc64le-pseries/readme.txt
@@ -4,4 +4,4 @@ qemu-system-ppc64 -M pseries -cpu POWER8 -m 256 -kernel output/images/vmlinux -a
 
 The login prompt will appear in the terminal window.
 
-Tested with QEMU 2.10.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/sh4-r2d/linux-4.9.config b/board/qemu/sh4-r2d/linux.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.9.config
rename to board/qemu/sh4-r2d/linux.config
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index aa0e369d89..d22af73ae3 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/sh4eb-r2d/linux-4.9.config b/board/qemu/sh4eb-r2d/linux.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.9.config
rename to board/qemu/sh4eb-r2d/linux.config
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
index 147adc6e2e..daf515ab2b 100644
--- a/board/qemu/sh4eb-r2d/readme.txt
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc-ss10/linux-4.11.config b/board/qemu/sparc-ss10/linux.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.11.config
rename to board/qemu/sparc-ss10/linux.config
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 0ce461d2ea..df6a75a3fb 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/sparc64-sun4u/linux-4.11.config b/board/qemu/sparc64-sun4u/linux.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.11.config
rename to board/qemu/sparc64-sun4u/linux.config
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index adfff7089e..24d5bbaffe 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/x86/linux-4.15.config b/board/qemu/x86/linux.config
similarity index 100%
rename from board/qemu/x86/linux-4.15.config
rename to board/qemu/x86/linux.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index b003ad5373..c5e687734c 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/x86_64/linux-4.15.config b/board/qemu/x86_64/linux.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.15.config
rename to board/qemu/x86_64/linux.config
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index ed7b5f5532..425e34b12c 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/board/qemu/xtensa-lx60/linux-4.11-nommu.config b/board/qemu/xtensa-lx60/linux-nommu.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.11-nommu.config
rename to board/qemu/xtensa-lx60/linux-nommu.config
diff --git a/board/qemu/xtensa-lx60/linux-4.11.config b/board/qemu/xtensa-lx60/linux.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.11.config
rename to board/qemu/xtensa-lx60/linux.config
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index 9a82c53752..4287e1f09e 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.9.0
+Tested with QEMU 2.12.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 076773302d..2706544e52 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 0423dc06c5..348b91bc96 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.13.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 9c48172e40..910c382439 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -21,12 +21,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.70"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index ccbdcfa3b7..8f8d0a048a 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 6dc50a7c05..d9238b650f 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index ae736ff101..3055a0f8cd 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 3dedecf710..073a7173fa 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index db408b0e72..d07bc11003 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index ccec419add..55e68b1fdc 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 3aee84c53a..5802393368 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index aa43dce945..93e2a86509 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 52e42992a6..99b457a9f8 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 2b35c1a016..f2dacbd760 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index 06c0133f9f..d291213db7 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index e80e728486..4740bdee28 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index a9eaf0800a..cff219257a 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,10 +1,10 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.11.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index c667142185..636a0d25b1 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -5,12 +5,12 @@ BR2_or1k=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14=y
+# Linux headers same as kernel, a 4,16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.14.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux.config"
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index 8173a0251b..7a325a5070 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -6,12 +6,12 @@ BR2_powerpc_e5500=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Linux headers same as the kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 84076314d9..d2d69f1c3c 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 62e729d302..9a85f76dd9 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 9482aaa874..451a9b52d8 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index d2d92b6652..38e41a7fa2 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 84cb329872..6824afca3c 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index becce23ee1..8ddcb80b02 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 61d9ac9dde..79e8c38e8a 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 072fba79bc..baa8dbfb59 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 8c6b563a85..9943781a5b 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index b92ae17ae6..12b30bf764 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index ed6c198ac2..985ff32b44 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.15.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index d8614ef244..a735c991c7 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -11,15 +11,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 174ebd3d5f..f4d6837bc1 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -15,15 +15,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.11 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+# Linux headers same as kernel, a 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
