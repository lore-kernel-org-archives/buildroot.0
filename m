From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 31 Jan 2017 07:35:31 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest kernel version
Message-ID: <20170131103531.14518-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also bump the pc samples since they're tied to the (base) qemu config.

Results table:

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.9.6   2.6.0           YES     OK (3)
arm_versatile           4.9.6   2.5.0           YES     OK
arm_versatile_nommu     4.4.45  2.5.0           YES     OK
arm_vexpress            4.9.6   2.5.0           YES     OK
m68k_mcf5208            4.8.17  2.5.0           YES     OK (6)
m68k_q800               4.9.6   q800-v2.4.0     NO (2)  OK
microblazebe            4.9.6   2.5.0           YES     OK
microblazeel            4.9.6   2.5.0           YES     OK
mips32r2el_malta        4.9.6   2.5.0           YES     OK
mips32r2_malta          4.9.6   2.5.0           YES     OK
mips32r6el_malta        4.9.6   2.6.0           YES     OK (3)
mips32r6_malta          4.9.6   2.6.0           YES     OK (3)
mips64el_malta          4.9.6   2.5.0           YES     OK
mips64_malta            4.8.17  2.5.0           YES     OK (6)
mips64r6el_malta        4.9.6   2.7.0           YES     OK (3)(4)
mips64r6_malta          4.9.6   2.7.0           YES     OK (3)(4)
nios2-10m50             4.9.6   2.9.0           NO      OK
or1k                    4.9.6   2.5.0           NO      OK
ppc_g3beige             4.9.6   2.5.0           YES     OK
ppc_mpc8544ds           4.9.6   2.5.0           YES     OK
ppc_virtex_ml507        4.9.6   2.5.0           NO      OK
ppc64_pseries           4.9.6   2.5.0           YES     OK
sh4                     4.9.6   2.5.0           YES     OK
sh4eb                   4.9.6   2.5.0           NO (1)  OK
sparc_ss10              4.9.6   2.5.0           YES     OK
sparc64_sun4u           4.9.6   2.5.0           YES     OK
sparc_sun4u             4.9.6   2.5.0           YES     OK
x86                     4.9.6   2.5.0           YES     OK
x86_64                  4.9.6   2.5.0           YES     OK
xtensa_lx60             4.8.17  2.6.0           YES     OK (6)
xtensa_lx60_nommu       4.8.17  2.6.0           YES     OK (5)

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Known to fail with qemu versions lower than 2.6.0
(4) - Might work with 2.6.0, but the cpu definition changed in 2.7.0
(5) - Kept back on 4.8.x series since 4.9.x fails to build
(6) - Kept back on 4.8.x series since 4.9.x fails to boot

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/aarch64-virt/{linux-4.8.config => linux-4.9.config}    | 0
 board/qemu/arm-versatile/{linux-4.8.config => linux-4.9.config}   | 0
 board/qemu/m68k-q800/{linux-4.8.config => linux-4.9.config}       | 0
 .../qemu/microblazebe-mmu/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/microblazeel-mmu/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/mips32r2-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/mips32r2el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/mips32r6-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/mips32r6el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/mips64el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/mips64r6-malta/{linux-4.8.config => linux-4.9.config}  | 0
 .../qemu/mips64r6el-malta/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/ppc-g3beige/{linux-4.8.config => linux-4.9.config}     | 0
 board/qemu/ppc-mpc8544ds/{linux-4.8.config => linux-4.9.config}   | 0
 .../qemu/ppc-virtex-ml507/{linux-4.8.config => linux-4.9.config}  | 0
 board/qemu/sh4-r2d/{linux-4.8.config => linux-4.9.config}         | 0
 board/qemu/sh4eb-r2d/{linux-4.8.config => linux-4.9.config}       | 0
 board/qemu/sparc-ss10/{linux-4.8.config => linux-4.9.config}      | 0
 board/qemu/sparc64-sun4u/{linux-4.8.config => linux-4.9.config}   | 0
 board/qemu/x86/linux-4.8.config                                   | 1 -
 board/qemu/x86/linux-4.9.config                                   | 1 +
 board/qemu/x86_64/{linux-4.8.config => linux-4.9.config}          | 0
 configs/pc_x86_64_bios_defconfig                                  | 8 ++++----
 configs/pc_x86_64_efi_defconfig                                   | 8 ++++----
 configs/qemu_aarch64_virt_defconfig                               | 8 ++++----
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_versatile_nommu_defconfig                        | 2 +-
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_m68k_mcf5208_defconfig                               | 2 +-
 configs/qemu_m68k_q800_defconfig                                  | 8 ++++----
 configs/qemu_microblazebe_mmu_defconfig                           | 8 ++++----
 configs/qemu_microblazeel_mmu_defconfig                           | 8 ++++----
 configs/qemu_mips32r2_malta_defconfig                             | 8 ++++----
 configs/qemu_mips32r2el_malta_defconfig                           | 8 ++++----
 configs/qemu_mips32r6_malta_defconfig                             | 8 ++++----
 configs/qemu_mips32r6el_malta_defconfig                           | 8 ++++----
 configs/qemu_mips64_malta_defconfig                               | 2 +-
 configs/qemu_mips64el_malta_defconfig                             | 8 ++++----
 configs/qemu_mips64r6_malta_defconfig                             | 8 ++++----
 configs/qemu_mips64r6el_malta_defconfig                           | 8 ++++----
 configs/qemu_nios2_10m50_defconfig                                | 2 +-
 configs/qemu_or1k_defconfig                                       | 2 +-
 configs/qemu_ppc64_pseries_defconfig                              | 6 +++---
 configs/qemu_ppc_g3beige_defconfig                                | 8 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig                              | 8 ++++----
 configs/qemu_ppc_virtex_ml507_defconfig                           | 8 ++++----
 configs/qemu_sh4_r2d_defconfig                                    | 8 ++++----
 configs/qemu_sh4eb_r2d_defconfig                                  | 8 ++++----
 configs/qemu_sparc64_sun4u_defconfig                              | 8 ++++----
 configs/qemu_sparc_ss10_defconfig                                 | 8 ++++----
 configs/qemu_x86_64_defconfig                                     | 8 ++++----
 configs/qemu_x86_defconfig                                        | 8 ++++----
 configs/qemu_xtensa_lx60_defconfig                                | 4 ++--
 configs/qemu_xtensa_lx60_nommu_defconfig                          | 2 +-
 54 files changed, 107 insertions(+), 107 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/arm-versatile/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/m68k-q800/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips32r2-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips32r2el-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips32r6-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips32r6el-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips64r6-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/mips64r6el-malta/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/ppc-mpc8544ds/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/ppc-virtex-ml507/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/sh4eb-r2d/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.8.config => linux-4.9.config} (100%)
 rename board/qemu/sparc64-sun4u/{linux-4.8.config => linux-4.9.config} (100%)
 delete mode 120000 board/qemu/x86/linux-4.8.config
 create mode 120000 board/qemu/x86/linux-4.9.config
 rename board/qemu/x86_64/{linux-4.8.config => linux-4.9.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.8.config b/board/qemu/aarch64-virt/linux-4.9.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.8.config
rename to board/qemu/aarch64-virt/linux-4.9.config
diff --git a/board/qemu/arm-versatile/linux-4.8.config b/board/qemu/arm-versatile/linux-4.9.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.8.config
rename to board/qemu/arm-versatile/linux-4.9.config
diff --git a/board/qemu/m68k-q800/linux-4.8.config b/board/qemu/m68k-q800/linux-4.9.config
similarity index 100%
rename from board/qemu/m68k-q800/linux-4.8.config
rename to board/qemu/m68k-q800/linux-4.9.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.8.config b/board/qemu/microblazebe-mmu/linux-4.9.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.8.config
rename to board/qemu/microblazebe-mmu/linux-4.9.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.8.config b/board/qemu/microblazeel-mmu/linux-4.9.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.8.config
rename to board/qemu/microblazeel-mmu/linux-4.9.config
diff --git a/board/qemu/mips32r2-malta/linux-4.8.config b/board/qemu/mips32r2-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips32r2-malta/linux-4.8.config
rename to board/qemu/mips32r2-malta/linux-4.9.config
diff --git a/board/qemu/mips32r2el-malta/linux-4.8.config b/board/qemu/mips32r2el-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips32r2el-malta/linux-4.8.config
rename to board/qemu/mips32r2el-malta/linux-4.9.config
diff --git a/board/qemu/mips32r6-malta/linux-4.8.config b/board/qemu/mips32r6-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips32r6-malta/linux-4.8.config
rename to board/qemu/mips32r6-malta/linux-4.9.config
diff --git a/board/qemu/mips32r6el-malta/linux-4.8.config b/board/qemu/mips32r6el-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips32r6el-malta/linux-4.8.config
rename to board/qemu/mips32r6el-malta/linux-4.9.config
diff --git a/board/qemu/mips64el-malta/linux-4.8.config b/board/qemu/mips64el-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.8.config
rename to board/qemu/mips64el-malta/linux-4.9.config
diff --git a/board/qemu/mips64r6-malta/linux-4.8.config b/board/qemu/mips64r6-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips64r6-malta/linux-4.8.config
rename to board/qemu/mips64r6-malta/linux-4.9.config
diff --git a/board/qemu/mips64r6el-malta/linux-4.8.config b/board/qemu/mips64r6el-malta/linux-4.9.config
similarity index 100%
rename from board/qemu/mips64r6el-malta/linux-4.8.config
rename to board/qemu/mips64r6el-malta/linux-4.9.config
diff --git a/board/qemu/ppc-g3beige/linux-4.8.config b/board/qemu/ppc-g3beige/linux-4.9.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.8.config
rename to board/qemu/ppc-g3beige/linux-4.9.config
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.8.config b/board/qemu/ppc-mpc8544ds/linux-4.9.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.8.config
rename to board/qemu/ppc-mpc8544ds/linux-4.9.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.8.config b/board/qemu/ppc-virtex-ml507/linux-4.9.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.8.config
rename to board/qemu/ppc-virtex-ml507/linux-4.9.config
diff --git a/board/qemu/sh4-r2d/linux-4.8.config b/board/qemu/sh4-r2d/linux-4.9.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.8.config
rename to board/qemu/sh4-r2d/linux-4.9.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.8.config b/board/qemu/sh4eb-r2d/linux-4.9.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.8.config
rename to board/qemu/sh4eb-r2d/linux-4.9.config
diff --git a/board/qemu/sparc-ss10/linux-4.8.config b/board/qemu/sparc-ss10/linux-4.9.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.8.config
rename to board/qemu/sparc-ss10/linux-4.9.config
diff --git a/board/qemu/sparc64-sun4u/linux-4.8.config b/board/qemu/sparc64-sun4u/linux-4.9.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.8.config
rename to board/qemu/sparc64-sun4u/linux-4.9.config
diff --git a/board/qemu/x86/linux-4.8.config b/board/qemu/x86/linux-4.8.config
deleted file mode 120000
index fca759e..0000000
--- a/board/qemu/x86/linux-4.8.config
+++ /dev/null
@@ -1 +0,0 @@
-../x86_64/linux-4.8.config
\ No newline at end of file
diff --git a/board/qemu/x86/linux-4.9.config b/board/qemu/x86/linux-4.9.config
new file mode 120000
index 0000000..44b2fa1
--- /dev/null
+++ b/board/qemu/x86/linux-4.9.config
@@ -0,0 +1 @@
+../x86_64/linux-4.9.config
\ No newline at end of file
diff --git a/board/qemu/x86_64/linux-4.8.config b/board/qemu/x86_64/linux-4.9.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.8.config
rename to board/qemu/x86_64/linux-4.9.config
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 242d3bf..23462ad 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -20,15 +20,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 118cc59..136b711 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -23,15 +23,15 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh"
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index acde354..222c69e 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.9.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 452ed5f..afeef75 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.9.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 49e4411..6cc646b 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -27,6 +27,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.22"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.45"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4-nommu.config"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index e841bac..f8dd5a0 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index c6c9098..a5ebf15 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 1d59d77..7bba7ef 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 188304e..3af8ad9 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 471d86a..6bda8cc 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index 16cc0ca..efac1f2 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index a66bdbd..066c897 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index a74c101..898477b 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index 5202e2c..a082167 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 92bacc0..7c40063 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index d3cac61..e957045 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index c68d887..dccdc16 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index c0ad304..8bbc114 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index d6b3e1f..a04a156 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,7 +1,7 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.9.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index b2527b4..4f70285 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -14,6 +14,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.9.config"
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 810f6e6..c15de3b 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index d0cd2cc..58d4dfc 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index ed10eee..0252da7 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index c8571b6..84cb329 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 11c4d26..becce23 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.9.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index e88b638..61d9ac9 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.9.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index a4c0e96..ef2d22f 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.9.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0f3b474..1d6c951 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.9.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 8284d3f..7002d5e 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 0a4c6a8..99ca604 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.9.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 020ea0c..54d844d 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,13 +16,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,8 series
+# Linux headers same as kernel, a 4.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index b2ff479..256cbee 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -26,7 +26,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.8-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-- 
2.10.2
