From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Jun 2017 22:49:41 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump to the latest kernel
	version
Message-ID: <20170607205158.EE596803DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28d97609b25cb534a55b6cf6b1945428e817c54a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xtensa patches no longer required, the make target name changed
to Image. The Qemu binary for OpenRisc was renamed upstream.
I removed the x86->x86_64 symlink, independent files preferred.

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.11.3   2.9.0           YES     OK
arm_versatile           4.11.3   2.9.0           YES     OK
arm_versatile_nommu     4.4.70   2.9.0           YES     OK
arm_vexpress            4.11.3   2.9.0           YES     OK
m68k_mcf5208            4.11.3   2.9.0           YES     OK
m68k_q800               4.11.3   q800-v2.4.0     NO (2)  OK
microblazebe            4.11.3   2.9.0           YES     OK
microblazeel            4.11.3   2.9.0           YES     OK
mips32r2el_malta        4.11.3   2.9.0           YES     OK
mips32r2_malta          4.11.3   2.9.0           YES     OK
mips32r6el_malta        4.11.3   2.9.0           YES     OK
mips32r6_malta          4.11.3   2.9.0           YES     OK
mips64el_malta          4.11.3   2.9.0           YES     OK
mips64_malta            4.11.3   2.9.0           YES     OK
mips64r6el_malta        4.11.3   2.9.0           YES     OK
mips64r6_malta          4.11.3   2.9.0           YES     OK
nios2-10m50             4.11.3   2.9.0           NO      OK
or1k                    4.11.3   2.9.0           NO      OK (5)
ppc_g3beige             4.11.3   2.9.0           YES     OK
ppc_mpc8544ds           4.11.3   2.9.0           YES     OK
ppc_virtex_ml507        4.9.6    2.9.0           NO      OK (3)
ppc64_pseries           4.11.3   2.9.0           YES     OK
sh4                     4.9.6    2.9.0           YES     OK (4)
sh4eb                   4.9.6    2.9.0           NO (1)  OK (4)
sparc_ss10              4.11.3   2.9.0           YES     OK
sparc64_sun4u           4.11.3   2.9.0           YES     OK
sparc_sun4u             4.11.3   2.9.0           YES     OK
x86                     4.11.3   2.9.0           YES     OK
x86_64                  4.11.3   2.9.0           YES     OK
xtensa_lx60             4.11.3   2.9.0           YES     OK
xtensa_lx60_nommu       4.11.3   2.9.0           YES     OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Kernel oops with 4.11.3 on boot
(4) - System is extremely slow with 4.11.3, needs further investigation
(5) - Qemu binary got renamed to qemu-system-or1k

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/aarch64-virt/readme.txt                 |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/arm-versatile/readme.txt                |  2 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 .../{linux-4.8.config => linux-4.11.config}        |  0
 board/qemu/m68k-mcf5208/readme.txt                 |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/mips32r2-malta/readme.txt               |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/mips32r2el-malta/readme.txt             |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/mips32r6-malta/readme.txt               |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/mips32r6el-malta/readme.txt             |  2 +-
 .../{linux-4.8.config => linux-4.11.config}        |  0
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/mips64r6el-malta/readme.txt             |  5 +----
 .../{linux-4.9.fragment => linux-4.11.fragment}    |  0
 board/qemu/nios2-10m50/readme.txt                  |  4 +---
 .../or1k/{linux-4.9.config => linux-4.11.config}   |  0
 board/qemu/or1k/patches/linux/0001-ld-or1k.patch   | 16 --------------
 board/qemu/or1k/patches/linux/0002-kallsyms.patch  | 25 ----------------------
 board/qemu/or1k/readme.txt                         |  4 ++--
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/ppc-g3beige/readme.txt                  |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/ppc-mpc8544ds/readme.txt                |  2 +-
 board/qemu/ppc64-pseries/readme.txt                |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 .../{linux-4.9.config => linux-4.11.config}        |  0
 board/qemu/sparc64-sun4u/readme.txt                |  2 +-
 .../linux-4.9.config => x86/linux-4.11.config}     |  0
 board/qemu/x86/linux-4.9.config                    |  1 -
 board/qemu/x86/readme.txt                          |  2 +-
 .../x86_64/{linux-4.9.config => linux-4.11.config} |  0
 board/qemu/x86_64/readme.txt                       |  2 +-
 ...ux-4.9-nommu.config => linux-4.11-nommu.config} |  0
 .../{linux-4.9.config => linux-4.11.config}        |  0
 .../linux-0001-disable-redboot-and-uboot.patch     | 16 --------------
 board/qemu/xtensa-lx60/readme.txt                  |  3 +--
 configs/qemu_aarch64_virt_defconfig                |  8 +++----
 configs/qemu_arm_versatile_defconfig               |  8 +++----
 configs/qemu_arm_versatile_nommu_defconfig         |  2 +-
 configs/qemu_arm_vexpress_defconfig                |  6 +++---
 configs/qemu_m68k_mcf5208_defconfig                |  8 +++----
 configs/qemu_m68k_q800_defconfig                   |  8 +++----
 configs/qemu_microblazebe_mmu_defconfig            |  8 +++----
 configs/qemu_microblazeel_mmu_defconfig            |  8 +++----
 configs/qemu_mips32r2_malta_defconfig              |  8 +++----
 configs/qemu_mips32r2el_malta_defconfig            |  8 +++----
 configs/qemu_mips32r6_malta_defconfig              |  8 +++----
 configs/qemu_mips32r6el_malta_defconfig            |  8 +++----
 configs/qemu_mips64_malta_defconfig                |  8 +++----
 configs/qemu_mips64el_malta_defconfig              |  8 +++----
 configs/qemu_mips64r6_malta_defconfig              |  8 +++----
 configs/qemu_mips64r6el_malta_defconfig            |  8 +++----
 configs/qemu_nios2_10m50_defconfig                 |  8 +++----
 configs/qemu_or1k_defconfig                        | 11 ++++------
 configs/qemu_ppc64_pseries_defconfig               |  6 +++---
 configs/qemu_ppc_g3beige_defconfig                 |  8 +++----
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 +++----
 configs/qemu_sparc64_sun4u_defconfig               |  8 +++----
 configs/qemu_sparc_ss10_defconfig                  |  8 +++----
 configs/qemu_x86_64_defconfig                      |  8 +++----
 configs/qemu_x86_defconfig                         |  8 +++----
 configs/qemu_xtensa_lx60_defconfig                 | 13 +++++------
 configs/qemu_xtensa_lx60_nommu_defconfig           | 13 +++++------
 79 files changed, 128 insertions(+), 201 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-4.9.config b/board/qemu/aarch64-virt/linux-4.11.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.9.config
rename to board/qemu/aarch64-virt/linux-4.11.config
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 1c4c7f9..ece8a53 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/arm-versatile/linux-4.9.config b/board/qemu/arm-versatile/linux-4.11.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.9.config
rename to board/qemu/arm-versatile/linux-4.11.config
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index c8ea4cd..6e899f4 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -9,4 +9,4 @@ Or for the noMMU emulation:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 99812b9..57bb814 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -8,4 +8,4 @@ graphical window is the framebuffer.
 If you want to emulate more cores change "-smp 1" to "-smp 2" for
 dual-core or even "smp -4" for a quad-core configuration.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/m68k-mcf5208/linux-4.8.config b/board/qemu/m68k-mcf5208/linux-4.11.config
similarity index 100%
rename from board/qemu/m68k-mcf5208/linux-4.8.config
rename to board/qemu/m68k-mcf5208/linux-4.11.config
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
index 00deb2c..014a0dc 100644
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/m68k-q800/linux-4.9.config b/board/qemu/m68k-q800/linux-4.11.config
similarity index 100%
rename from board/qemu/m68k-q800/linux-4.9.config
rename to board/qemu/m68k-q800/linux-4.11.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.9.config b/board/qemu/microblazebe-mmu/linux-4.11.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.9.config
rename to board/qemu/microblazebe-mmu/linux-4.11.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 25fc35c..cf0afda 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/microblazeel-mmu/linux-4.9.config b/board/qemu/microblazeel-mmu/linux-4.11.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.9.config
rename to board/qemu/microblazeel-mmu/linux-4.11.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 1a77a56..9edf101 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r2-malta/linux-4.9.config b/board/qemu/mips32r2-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips32r2-malta/linux-4.9.config
rename to board/qemu/mips32r2-malta/linux-4.11.config
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index 13f8910..7002ab1 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r2el-malta/linux-4.9.config b/board/qemu/mips32r2el-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips32r2el-malta/linux-4.9.config
rename to board/qemu/mips32r2el-malta/linux-4.11.config
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 5c4bbda..bfc9c49 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r6-malta/linux-4.9.config b/board/qemu/mips32r6-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips32r6-malta/linux-4.9.config
rename to board/qemu/mips32r6-malta/linux-4.11.config
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 107c47d..7d79c66 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -d
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r6el-malta/linux-4.9.config b/board/qemu/mips32r6el-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips32r6el-malta/linux-4.9.config
rename to board/qemu/mips32r6el-malta/linux-4.11.config
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index e29115f..78f8350 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips64-malta/linux-4.8.config b/board/qemu/mips64-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.8.config
rename to board/qemu/mips64-malta/linux-4.11.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index a89985d..8a73210 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips64el-malta/linux-4.9.config b/board/qemu/mips64el-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.9.config
rename to board/qemu/mips64el-malta/linux-4.11.config
diff --git a/board/qemu/mips64r6-malta/linux-4.9.config b/board/qemu/mips64r6-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips64r6-malta/linux-4.9.config
rename to board/qemu/mips64r6-malta/linux-4.11.config
diff --git a/board/qemu/mips64r6el-malta/linux-4.9.config b/board/qemu/mips64r6el-malta/linux-4.11.config
similarity index 100%
rename from board/qemu/mips64r6el-malta/linux-4.9.config
rename to board/qemu/mips64r6el-malta/linux-4.11.config
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index b1dc23a..9250cf3 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -4,7 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
-
-Might work with 2.6.0 by changing the -cpu entry to MIPS64R6-generic
-since the naming was updated and the old name removed in 2.7.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/nios2-10m50/linux-4.9.fragment b/board/qemu/nios2-10m50/linux-4.11.fragment
similarity index 100%
rename from board/qemu/nios2-10m50/linux-4.9.fragment
rename to board/qemu/nios2-10m50/linux-4.11.fragment
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
index 978ba95..f7dee37 100644
--- a/board/qemu/nios2-10m50/readme.txt
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -4,6 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with the upcoming QEMU 2.9.0 [1]
-
-[1] http://git.qemu.org/?p=qemu.git;h=ae5045ae5b2bbd8ce1335d1b05f9ecacca83a6cf
+Tested with QEMU 2.9.0.
diff --git a/board/qemu/or1k/linux-4.9.config b/board/qemu/or1k/linux-4.11.config
similarity index 100%
rename from board/qemu/or1k/linux-4.9.config
rename to board/qemu/or1k/linux-4.11.config
diff --git a/board/qemu/or1k/patches/linux/0001-ld-or1k.patch b/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
deleted file mode 100644
index aba2463..0000000
--- a/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-OpenRISC arch name was in the beginning or32
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S
---- linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-03-10 00:35:58.000000000 +0100
-+++ linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S	2016-03-16 09:21:07.933535532 +0100
-@@ -30,7 +30,7 @@
- #include <asm/cache.h>
- #include <asm-generic/vmlinux.lds.h>
- 
--OUTPUT_FORMAT("elf32-or32", "elf32-or32", "elf32-or32")
-+OUTPUT_FORMAT("elf32-or1k", "elf32-or1k", "elf32-or1k")
- jiffies = jiffies_64 + 4;
- 
- SECTIONS
diff --git a/board/qemu/or1k/patches/linux/0002-kallsyms.patch b/board/qemu/or1k/patches/linux/0002-kallsyms.patch
deleted file mode 100644
index e788a7a..0000000
--- a/board/qemu/or1k/patches/linux/0002-kallsyms.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: https://lkml.org/lkml/2016/12/31/13
-
-The build robot reports:
-
-   .tmp_kallsyms1.o: In function `kallsyms_relative_base':
->> (.rodata+0x8a18): undefined reference to `_text'
-
-This is when using 'make alldefconfig'. Adding this _text symbol to mark
-the start of the kernel as in other architecture fixes this.
-
-Signed-off-by: Stafford Horne <shorne@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.9/arch/openrisc/kernel/vmlinux.lds.S
---- linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-12-11 20:17:54.000000000 +0100
-+++ linux-4.9/arch/openrisc/kernel/vmlinux.lds.S	2017-01-01 12:13:43.039107518 +0100
-@@ -38,6 +38,8 @@
-         /* Read-only sections, merged into text segment: */
-         . = LOAD_BASE ;
- 
-+	_text = .;
-+
- 	/* _s_kernel_ro must be page aligned */
- 	. = ALIGN(PAGE_SIZE);
- 	_s_kernel_ro = .;
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index 53c66ad..a04314e 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -1,9 +1,9 @@
 Run the emulation with:
 
- qemu-system-or32 -kernel output/images/vmlinux -nographic
+ qemu-system-or1k -kernel output/images/vmlinux -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
 Ethernet support is not working, yet.
 
-Tested with QEMU 2.8.0.
+Tested with QEMU 2.9.0.
diff --git a/board/qemu/ppc-g3beige/linux-4.9.config b/board/qemu/ppc-g3beige/linux-4.11.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.9.config
rename to board/qemu/ppc-g3beige/linux-4.11.config
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 3bd88a6..42c97a0 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.9.config b/board/qemu/ppc-mpc8544ds/linux-4.11.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.9.config
rename to board/qemu/ppc-mpc8544ds/linux-4.11.config
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index d8f31cb..0008c84 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 94fa228..7cc0c67 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/sh4-r2d/linux-4.9.config b/board/qemu/sh4-r2d/linux-4.11.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.9.config
rename to board/qemu/sh4-r2d/linux-4.11.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.9.config b/board/qemu/sh4eb-r2d/linux-4.11.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.9.config
rename to board/qemu/sh4eb-r2d/linux-4.11.config
diff --git a/board/qemu/sparc-ss10/linux-4.9.config b/board/qemu/sparc-ss10/linux-4.11.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.9.config
rename to board/qemu/sparc-ss10/linux-4.11.config
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 5a07ee0..0ce461d 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/sparc64-sun4u/linux-4.9.config b/board/qemu/sparc64-sun4u/linux-4.11.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.9.config
rename to board/qemu/sparc64-sun4u/linux-4.11.config
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index aaf96c3..adfff70 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/x86_64/linux-4.9.config b/board/qemu/x86/linux-4.11.config
similarity index 100%
copy from board/qemu/x86_64/linux-4.9.config
copy to board/qemu/x86/linux-4.11.config
diff --git a/board/qemu/x86/linux-4.9.config b/board/qemu/x86/linux-4.9.config
deleted file mode 120000
index 44b2fa1..0000000
--- a/board/qemu/x86/linux-4.9.config
+++ /dev/null
@@ -1 +0,0 @@
-../x86_64/linux-4.9.config
\ No newline at end of file
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4f2e4c7..1750096 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/x86_64/linux-4.9.config b/board/qemu/x86_64/linux-4.11.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.9.config
rename to board/qemu/x86_64/linux-4.11.config
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 6ea28d3..ecd7813 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/xtensa-lx60/linux-4.9-nommu.config b/board/qemu/xtensa-lx60/linux-4.11-nommu.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.9-nommu.config
rename to board/qemu/xtensa-lx60/linux-4.11-nommu.config
diff --git a/board/qemu/xtensa-lx60/linux-4.9.config b/board/qemu/xtensa-lx60/linux-4.11.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.9.config
rename to board/qemu/xtensa-lx60/linux-4.11.config
diff --git a/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch b/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
deleted file mode 100644
index c0ccf48..0000000
--- a/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-disable boot-uboot and boot-redboot, requires a patched u-boot and mkimage
-
-Signed-off-by:Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-3.15.orig/arch/xtensa/boot/Makefile linux-3.15/arch/xtensa/boot/Makefile
---- linux-3.15.orig/arch/xtensa/boot/Makefile	2014-06-08 20:19:54.000000000 +0200
-+++ linux-3.15/arch/xtensa/boot/Makefile	2014-06-14 20:07:15.206091165 +0200
-@@ -23,7 +23,7 @@
- 
- bootdir-$(CONFIG_XTENSA_PLATFORM_ISS)	 += boot-elf
- bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf boot-uboot
--bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf boot-uboot
-+bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-elf
- 
- zImage Image: $(bootdir-y)
- 
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index be77345..9a82c53 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,5 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
-Known to fail with 2.5.0
+Tested with QEMU 2.9.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 222c69e..1ef4405 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.11.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index afeef75..9845ec6 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.11.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 6cc646b..9c48172 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -27,6 +27,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.45"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.70"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4-nommu.config"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index f8dd5a0..faba6a6 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index a5ebf15..ccbdcfa 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 7bba7ef..6dc50a7 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 3af8ad9..ae736ff 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 6bda8cc..3dedecf 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index efac1f2..db408b0 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 066c897..ccec419 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 898477b..3aee84c 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index a082167..aa43dce 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 7c40063..52e4299 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index e957045..2b35c1a 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index dccdc16..06c0133 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 8bbc114..e80e728 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index 345a6e5..a9eaf08 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,10 +1,10 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.9.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.11.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 4f70285..0eb1916 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -1,19 +1,16 @@
 # Architecture
 BR2_or1k=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/or1k/patches"
-
 # Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4,11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.11.config"
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index c15de3b..7af20e9 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 58d4dfc..9482aaa 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 0252da7..d2d92b6 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index ef2d22f..1f4df06 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.11.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 1d6c951..b492f88 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.11.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 7002d5e..aa17ace 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 99ca604..c023a8e 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.11.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 915b6ff..3e98222 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -5,9 +5,6 @@ BR2_XTENSA_CUSTOM_NAME="dc233c"
 BR2_XTENSA_CORE_NAME="lx60"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -16,15 +13,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 8c66c3a..998cd2a 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -9,9 +9,6 @@ BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -20,15 +17,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
