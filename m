From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jun 2016 17:30:30 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to latest version
Message-ID: <1465072230-12316-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.5.6   2.5.0           YES     OK (4)
arm_versatile           4.6.1   2.5.0           YES     OK
arm_vexpress            4.6.1   2.5.0           YES     OK
m68k_mcf5208            4.6.1   2.5.0           YES     OK
m68k_q800               4.6.1   q800-v2.4.0     NO (3)  OK
microblazebe            4.6.1   2.5.0           YES     OK
microblazeel            4.6.1   2.5.0           YES     OK
mips64el_malta          4.6.1   2.5.0           YES     OK
mips64_malta            4.6.1   2.5.0           YES     OK
mipsel_malta            4.6.1   2.5.0           YES     OK
mips_malta              4.6.1   2.5.0           YES     OK
ppc_g3beige             4.6.1   2.5.0           YES     OK
ppc_mpc8544ds           4.6.1   2.5.0           YES     OK
ppc_virtex_ml507        4.6.1   2.5.0           NO      OK
ppc64_pseries           4.6.1   2.5.0           YES     OK
sh4                     4.6.1   2.5.0           YES     OK
sh4eb                   4.6.1   2.5.0           NO (1)  OK
sparc_ss10              4.6.1   2.5.0           YES     OK
sparc64_sun4u           4.6.1   2.5.0           YES     OK
sparc_sun4u             4.6.1   2.5.0           YES     OK
x86                     4.6.1   2.5.0           YES     OK
x86_64                  4.6.1   2.5.0           YES     OK
xtensa_lx60             4.4.12  2.5.0           YES     OK (2)
xtensa_lx60_nommu       4.4.12  2.5.0           YES     OK (2)

(1) - Probably an endian issue with 8139 emulation/driver
(2) - xtensa ethernet broken in 4.5/4.6
(3) - There's a network interface, but enabling it in qemu fails
(4) - Console looks dead in 4.6

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../patches/linux/0001-fix-do_sigreturn.patch      | 100 ---------------------
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../sh4-r2d/{linux-4.5.config => linux-4.6.config} |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 .../{linux-4.5.config => linux-4.6.config}         |   0
 board/qemu/x86/linux-4.5.config                    |   1 -
 board/qemu/x86/linux-4.6.config                    |   1 +
 .../x86_64/{linux-4.5.config => linux-4.6.config}  |   0
 configs/pc_x86_64_bios_defconfig                   |   8 +-
 configs/pc_x86_64_efi_defconfig                    |   8 +-
 configs/qemu_aarch64_virt_defconfig                |   2 +-
 configs/qemu_arm_versatile_defconfig               |   8 +-
 configs/qemu_arm_vexpress_defconfig                |   6 +-
 configs/qemu_m68k_mcf5208_defconfig                |  10 +--
 configs/qemu_m68k_q800_defconfig                   |   8 +-
 configs/qemu_microblazebe_mmu_defconfig            |   8 +-
 configs/qemu_microblazeel_mmu_defconfig            |   8 +-
 configs/qemu_mips64_malta_defconfig                |   8 +-
 configs/qemu_mips64el_malta_defconfig              |   8 +-
 configs/qemu_mips_malta_defconfig                  |   8 +-
 configs/qemu_mipsel_malta_defconfig                |   8 +-
 configs/qemu_ppc64_pseries_defconfig               |   6 +-
 configs/qemu_ppc_g3beige_defconfig                 |   8 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |   8 +-
 configs/qemu_ppc_virtex_ml507_defconfig            |   8 +-
 configs/qemu_sh4_r2d_defconfig                     |   8 +-
 configs/qemu_sh4eb_r2d_defconfig                   |   8 +-
 configs/qemu_sparc64_sun4u_defconfig               |   8 +-
 configs/qemu_sparc_ss10_defconfig                  |   8 +-
 configs/qemu_x86_64_defconfig                      |   8 +-
 configs/qemu_x86_defconfig                         |   8 +-
 configs/qemu_xtensa_lx60_defconfig                 |   2 +-
 configs/qemu_xtensa_lx60_nommu_defconfig           |   2 +-
 45 files changed, 90 insertions(+), 192 deletions(-)
 rename board/qemu/arm-versatile/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/m68k-mcf5208/{linux-4.5.config => linux-4.6.config} (100%)
 delete mode 100644 board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
 rename board/qemu/m68k-q800/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/mips-malta/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/mips64-malta/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/mipsel-malta/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/ppc-mpc8544ds/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/ppc-virtex-ml507/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/sh4eb-r2d/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.5.config => linux-4.6.config} (100%)
 rename board/qemu/sparc64-sun4u/{linux-4.5.config => linux-4.6.config} (100%)
 delete mode 120000 board/qemu/x86/linux-4.5.config
 create mode 120000 board/qemu/x86/linux-4.6.config
 rename board/qemu/x86_64/{linux-4.5.config => linux-4.6.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-4.5.config b/board/qemu/arm-versatile/linux-4.6.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.5.config
rename to board/qemu/arm-versatile/linux-4.6.config
diff --git a/board/qemu/m68k-mcf5208/linux-4.5.config b/board/qemu/m68k-mcf5208/linux-4.6.config
similarity index 100%
rename from board/qemu/m68k-mcf5208/linux-4.5.config
rename to board/qemu/m68k-mcf5208/linux-4.6.config
diff --git a/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch b/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
deleted file mode 100644
index c52a4e2..0000000
--- a/board/qemu/m68k-mcf5208/patches/linux/0001-fix-do_sigreturn.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From a95517992a37488c0bc8b629c47c570e580e407d Mon Sep 17 00:00:00 2001
-From: Greg Ungerer <gerg@uclinux.org>
-Date: Mon, 15 Feb 2016 16:36:29 +1000
-Subject: m68k: Use conventional function parameters for do_sigreturn
-
-Create conventional stack parameters for the calls to do_sigreturn and
-do_rt_sigreturn. The current C code for do_sigreturn and do_rt_sigreturn
-dig into the stack to create local pointers to the saved switch stack
-and the pt_regs structs.
-
-The motivation for this change is a problem with non-MMU targets that
-have broken signal return paths on newer versions of gcc. It appears as
-though gcc has determined that the pointers into the saved stack structs,
-and the saved structs themselves, are function parameters and updates to
-them will be lost on function return, so they are optimized away. This
-results in large parts of restore_sigcontext() and mangle_kernel_stack()
-functions being removed. Of course this results in non-functional code
-causing kernel oops. This problem has been observed with gcc version
-5.2 and 5.3, and probably exists in earlier versions as well.
-
-Using conventional stack parameter pointers passed to these functions has
-the advantage of the code here not needing to know the exact details of
-how the underlying entry handler layed these structs out on the stack.
-So the rather ugly pointer setup casting and arg referencing can be
-removed.
-
-The resulting code after this change is a few bytes larger (due to the
-overhead of creating the stack args and their tear down). Not being hot
-paths I don't think this is too much of a problem here.
-
-An alternative solution is to put a barrier() in the do_sigreturn() code,
-but this doesn't feel quite as clean as this solution.
-
-This change has been compile tested on all defconfigs, and run tested on
-Atari (through aranym), ColdFire with MMU (M5407EVB) and ColdFire with
-no-MMU (QEMU and M5208EVB).
-
-Signed-off-by: Greg Ungerer <gerg@uclinux.org>
-Acked-by: Andreas Schwab <schwab@linux-m68k.org>
-Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
----
- arch/m68k/kernel/entry.S  | 6 ++++++
- arch/m68k/kernel/signal.c | 8 ++------
- 2 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/arch/m68k/kernel/entry.S b/arch/m68k/kernel/entry.S
-index b54ac7a..97cd3ea 100644
---- a/arch/m68k/kernel/entry.S
-+++ b/arch/m68k/kernel/entry.S
-@@ -71,13 +71,19 @@ ENTRY(__sys_vfork)
- 
- ENTRY(sys_sigreturn)
- 	SAVE_SWITCH_STACK
-+	movel	%sp,%sp at -		  | switch_stack pointer
-+	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
- 	jbsr	do_sigreturn
-+	addql	#8,%sp
- 	RESTORE_SWITCH_STACK
- 	rts
- 
- ENTRY(sys_rt_sigreturn)
- 	SAVE_SWITCH_STACK
-+	movel	%sp,%sp at -		  | switch_stack pointer
-+	pea	%sp@(SWITCH_STACK_SIZE+4) | pt_regs pointer
- 	jbsr	do_rt_sigreturn
-+	addql	#8,%sp
- 	RESTORE_SWITCH_STACK
- 	rts
- 
-diff --git a/arch/m68k/kernel/signal.c b/arch/m68k/kernel/signal.c
-index af1c4f3..2dcee3a 100644
---- a/arch/m68k/kernel/signal.c
-+++ b/arch/m68k/kernel/signal.c
-@@ -737,10 +737,8 @@ badframe:
- 	return 1;
- }
- 
--asmlinkage int do_sigreturn(unsigned long __unused)
-+asmlinkage int do_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
- {
--	struct switch_stack *sw = (struct switch_stack *) &__unused;
--	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
- 	unsigned long usp = rdusp();
- 	struct sigframe __user *frame = (struct sigframe __user *)(usp - 4);
- 	sigset_t set;
-@@ -764,10 +762,8 @@ badframe:
- 	return 0;
- }
- 
--asmlinkage int do_rt_sigreturn(unsigned long __unused)
-+asmlinkage int do_rt_sigreturn(struct pt_regs *regs, struct switch_stack *sw)
- {
--	struct switch_stack *sw = (struct switch_stack *) &__unused;
--	struct pt_regs *regs = (struct pt_regs *) (sw + 1);
- 	unsigned long usp = rdusp();
- 	struct rt_sigframe __user *frame = (struct rt_sigframe __user *)(usp - 4);
- 	sigset_t set;
--- 
-cgit v0.12
-
diff --git a/board/qemu/m68k-q800/linux-4.5.config b/board/qemu/m68k-q800/linux-4.6.config
similarity index 100%
rename from board/qemu/m68k-q800/linux-4.5.config
rename to board/qemu/m68k-q800/linux-4.6.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.5.config b/board/qemu/microblazebe-mmu/linux-4.6.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.5.config
rename to board/qemu/microblazebe-mmu/linux-4.6.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.5.config b/board/qemu/microblazeel-mmu/linux-4.6.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.5.config
rename to board/qemu/microblazeel-mmu/linux-4.6.config
diff --git a/board/qemu/mips-malta/linux-4.5.config b/board/qemu/mips-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mips-malta/linux-4.5.config
rename to board/qemu/mips-malta/linux-4.6.config
diff --git a/board/qemu/mips64-malta/linux-4.5.config b/board/qemu/mips64-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.5.config
rename to board/qemu/mips64-malta/linux-4.6.config
diff --git a/board/qemu/mips64el-malta/linux-4.5.config b/board/qemu/mips64el-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.5.config
rename to board/qemu/mips64el-malta/linux-4.6.config
diff --git a/board/qemu/mipsel-malta/linux-4.5.config b/board/qemu/mipsel-malta/linux-4.6.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-4.5.config
rename to board/qemu/mipsel-malta/linux-4.6.config
diff --git a/board/qemu/ppc-g3beige/linux-4.5.config b/board/qemu/ppc-g3beige/linux-4.6.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.5.config
rename to board/qemu/ppc-g3beige/linux-4.6.config
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.5.config b/board/qemu/ppc-mpc8544ds/linux-4.6.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.5.config
rename to board/qemu/ppc-mpc8544ds/linux-4.6.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.5.config b/board/qemu/ppc-virtex-ml507/linux-4.6.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.5.config
rename to board/qemu/ppc-virtex-ml507/linux-4.6.config
diff --git a/board/qemu/sh4-r2d/linux-4.5.config b/board/qemu/sh4-r2d/linux-4.6.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.5.config
rename to board/qemu/sh4-r2d/linux-4.6.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.5.config b/board/qemu/sh4eb-r2d/linux-4.6.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.5.config
rename to board/qemu/sh4eb-r2d/linux-4.6.config
diff --git a/board/qemu/sparc-ss10/linux-4.5.config b/board/qemu/sparc-ss10/linux-4.6.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.5.config
rename to board/qemu/sparc-ss10/linux-4.6.config
diff --git a/board/qemu/sparc64-sun4u/linux-4.5.config b/board/qemu/sparc64-sun4u/linux-4.6.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.5.config
rename to board/qemu/sparc64-sun4u/linux-4.6.config
diff --git a/board/qemu/x86/linux-4.5.config b/board/qemu/x86/linux-4.5.config
deleted file mode 120000
index 735bcf7..0000000
--- a/board/qemu/x86/linux-4.5.config
+++ /dev/null
@@ -1 +0,0 @@
-../x86_64/linux-4.5.config
\ No newline at end of file
diff --git a/board/qemu/x86/linux-4.6.config b/board/qemu/x86/linux-4.6.config
new file mode 120000
index 0000000..62e694f
--- /dev/null
+++ b/board/qemu/x86/linux-4.6.config
@@ -0,0 +1 @@
+../x86_64/linux-4.6.config
\ No newline at end of file
diff --git a/board/qemu/x86_64/linux-4.5.config b/board/qemu/x86_64/linux-4.6.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.5.config
rename to board/qemu/x86_64/linux-4.6.config
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index c3a1a35..e47ae3e 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.6.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 3152115..9b15495 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -23,15 +23,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.6.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index acd9280..d540bf5 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -15,6 +15,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.5.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 444cc20..f219ebf 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.6.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index ebe6bca..65fa3be 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index 31db912..babde74 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,17 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-BR2_GLOBAL_PATCH_DIR="board/qemu/m68k-mcf5208/patches/"
-
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index e1df89d..f23fe9f 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index dc6e9cb..32a6d65 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.6.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 519c4be..5725ad6 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.6.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 02e5300..6d1e207 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 9bbf691..a4b638a 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 26c729d..66b67a5 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 3b3911b..4e4f838 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index a7a6b7a..133c977 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 6e10f06..bb4e681 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 4c112ad..9131855 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 4c029a3..ec39f1d 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.6.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 7df8e84..0a48ca2 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.6.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 9bf21fd..f0844a0 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.6.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index f7e0749..12c0358 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.6.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index c88654a..7d24905 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.6.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index c3c2c3d..8972ed9 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.6.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index f7d757d..658beb1 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.5.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.6.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index c46610a..0d439af 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.4.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 7880a6c..ebd3cd3 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -26,7 +26,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.12"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.4-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.7.3
