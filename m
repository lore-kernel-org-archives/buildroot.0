From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Feb 2016 18:19:13 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest linux versions
Message-ID: <1454879953-19093-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep arm_nuri on 3.10.x for the usual reasons.
Keep mips & mipsel (32 bits) on 4.3.x because 4.4.x fails to boot
properly (kernel stuck after the CPU cache info).

Results table:

Defconfig               Kernel          Qemu    Network Status
--------------------------------------------------------------
aarch64_virt            4.4.1           2.3.0   YES     OK
arm_nuri                3.10.96         2.3.0   YES(1)  OK most times(2)
arm_versatile           4.4.1           2.3.0   YES     OK
arm_vexpress            4.4.1           2.3.0   YES     OK
microblazebe            4.4.1           2.3.0   YES     OK
microblazeel            4.4.1           2.3.0   YES     OK
mips64el_malta          4.4.1           2.3.0   YES     OK
mips64_malta            4.4.1           2.3.0   YES     OK
mipsel_malta            4.3.5           2.3.0   YES     OK (4)
mips_malta              4.3.5           2.3.0   YES     OK (4)
ppc_g3beige             4.4.1           2.3.0   YES     OK
ppc_mpc8544ds           4.4.1           2.3.0   YES     OK
ppc_virtex_ml507        4.4.1           2.3.0   NO      OK
ppc64_pseries           4.4.1           2.3.0   YES     OK
sh4                     4.4.1           2.3.0   YES     OK
sh4eb                   4.4.1           2.3.0   NO(3)   OK
sparc_ss10              4.4.1           2.3.0   YES     OK
sparc64_sun4u           4.4.1           2.3.0   YES     OK
sparc_sun4u             4.4.1           2.3.0   YES     OK
x86                     4.4.1           2.3.0   YES     OK
x86_64                  4.4.1           2.3.0   YES     OK
xtensa_lx60             4.4.1           2.3.0   YES     OK

(1) - Supposed to work but broken, probably Qemu emulation issue
(2) - In like 1/3 starts it fails to work properly
(3) - Probably an endian issue with 8139 emulation/driver
(4) - Kernel stuck at cpu cache details from 4.4 - 4.4.1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/aarch64-virt/{linux-4.3.config => linux-4.4.config}    | 0
 board/qemu/arm-versatile/{linux-4.3.config => linux-4.4.config}   | 0
 .../qemu/microblazebe-mmu/{linux-4.3.config => linux-4.4.config}  | 0
 .../qemu/microblazeel-mmu/{linux-4.3.config => linux-4.4.config}  | 0
 board/qemu/mips64-malta/{linux-4.3.config => linux-4.4.config}    | 0
 board/qemu/mips64el-malta/{linux-4.3.config => linux-4.4.config}  | 0
 board/qemu/ppc-g3beige/{linux-4.3.config => linux-4.4.config}     | 0
 board/qemu/ppc-mpc8544ds/{linux-4.3.config => linux-4.4.config}   | 0
 .../qemu/ppc-virtex-ml507/{linux-4.3.config => linux-4.4.config}  | 0
 board/qemu/sh4-r2d/{linux-4.3.config => linux-4.4.config}         | 0
 board/qemu/sh4eb-r2d/{linux-4.3.config => linux-4.4.config}       | 0
 board/qemu/sparc-ss10/{linux-4.3.config => linux-4.4.config}      | 0
 board/qemu/sparc64-sun4u/{linux-4.3.config => linux-4.4.config}   | 0
 board/qemu/{x86_64/linux-4.3.config => x86/linux-4.4.config}      | 0
 board/qemu/{x86/linux-4.3.config => x86_64/linux-4.4.config}      | 0
 board/qemu/xtensa-lx60/{linux-4.3.config => linux-4.4.config}     | 0
 configs/qemu_aarch64_virt_defconfig                               | 8 ++++----
 configs/qemu_arm_nuri_defconfig                                   | 2 +-
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_microblazebe_mmu_defconfig                           | 8 ++++----
 configs/qemu_microblazeel_mmu_defconfig                           | 8 ++++----
 configs/qemu_mips64_malta_defconfig                               | 8 ++++----
 configs/qemu_mips64el_malta_defconfig                             | 8 ++++----
 configs/qemu_mips_malta_defconfig                                 | 2 +-
 configs/qemu_mipsel_malta_defconfig                               | 2 +-
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
 configs/qemu_xtensa_lx60_defconfig                                | 8 ++++----
 37 files changed, 73 insertions(+), 73 deletions(-)
 rename board/qemu/aarch64-virt/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/arm-versatile/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/mips64-malta/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/mips64el-malta/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/ppc-g3beige/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/ppc-mpc8544ds/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/ppc-virtex-ml507/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/sh4-r2d/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/sh4eb-r2d/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/sparc-ss10/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/sparc64-sun4u/{linux-4.3.config => linux-4.4.config} (100%)
 rename board/qemu/{x86_64/linux-4.3.config => x86/linux-4.4.config} (100%)
 rename board/qemu/{x86/linux-4.3.config => x86_64/linux-4.4.config} (100%)
 rename board/qemu/xtensa-lx60/{linux-4.3.config => linux-4.4.config} (100%)

diff --git a/board/qemu/aarch64-virt/linux-4.3.config b/board/qemu/aarch64-virt/linux-4.4.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.3.config
rename to board/qemu/aarch64-virt/linux-4.4.config
diff --git a/board/qemu/arm-versatile/linux-4.3.config b/board/qemu/arm-versatile/linux-4.4.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-4.3.config
rename to board/qemu/arm-versatile/linux-4.4.config
diff --git a/board/qemu/microblazebe-mmu/linux-4.3.config b/board/qemu/microblazebe-mmu/linux-4.4.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.3.config
rename to board/qemu/microblazebe-mmu/linux-4.4.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.3.config b/board/qemu/microblazeel-mmu/linux-4.4.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.3.config
rename to board/qemu/microblazeel-mmu/linux-4.4.config
diff --git a/board/qemu/mips64-malta/linux-4.3.config b/board/qemu/mips64-malta/linux-4.4.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.3.config
rename to board/qemu/mips64-malta/linux-4.4.config
diff --git a/board/qemu/mips64el-malta/linux-4.3.config b/board/qemu/mips64el-malta/linux-4.4.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.3.config
rename to board/qemu/mips64el-malta/linux-4.4.config
diff --git a/board/qemu/ppc-g3beige/linux-4.3.config b/board/qemu/ppc-g3beige/linux-4.4.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.3.config
rename to board/qemu/ppc-g3beige/linux-4.4.config
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.3.config b/board/qemu/ppc-mpc8544ds/linux-4.4.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.3.config
rename to board/qemu/ppc-mpc8544ds/linux-4.4.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.3.config b/board/qemu/ppc-virtex-ml507/linux-4.4.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.3.config
rename to board/qemu/ppc-virtex-ml507/linux-4.4.config
diff --git a/board/qemu/sh4-r2d/linux-4.3.config b/board/qemu/sh4-r2d/linux-4.4.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.3.config
rename to board/qemu/sh4-r2d/linux-4.4.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.3.config b/board/qemu/sh4eb-r2d/linux-4.4.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.3.config
rename to board/qemu/sh4eb-r2d/linux-4.4.config
diff --git a/board/qemu/sparc-ss10/linux-4.3.config b/board/qemu/sparc-ss10/linux-4.4.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.3.config
rename to board/qemu/sparc-ss10/linux-4.4.config
diff --git a/board/qemu/sparc64-sun4u/linux-4.3.config b/board/qemu/sparc64-sun4u/linux-4.4.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.3.config
rename to board/qemu/sparc64-sun4u/linux-4.4.config
diff --git a/board/qemu/x86_64/linux-4.3.config b/board/qemu/x86/linux-4.4.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.3.config
rename to board/qemu/x86/linux-4.4.config
diff --git a/board/qemu/x86/linux-4.3.config b/board/qemu/x86_64/linux-4.4.config
similarity index 100%
rename from board/qemu/x86/linux-4.3.config
rename to board/qemu/x86_64/linux-4.4.config
diff --git a/board/qemu/xtensa-lx60/linux-4.3.config b/board/qemu/xtensa-lx60/linux-4.4.config
similarity index 100%
rename from board/qemu/xtensa-lx60/linux-4.3.config
rename to board/qemu/xtensa-lx60/linux-4.4.config
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index e63cb13..ec4c642 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.4.config"
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index ef221a5..9c64f74 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -19,6 +19,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 # Stuck at 3.10.x because there's no Nuri DTS
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.92"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.96"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 1803ef0..bb64cfe 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 051c68d..06a42dc 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 16f35ff..658e0d1 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.4.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 72b0d8b..a3a35da 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.4.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index e753d05..5ce3fe7 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 1bf40c0..ed867e7 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 758ddf7..6676660 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 9ae2dda..36ad158 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -15,7 +15,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.3.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index cd28139..041298c 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index fb6fb11..86beb43 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 8ebc2a6..2fe6775 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index b05ffb0..0154ee8 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.4.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 7b9932b..d8edf49 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index 4839644..cb27a73 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index 66e7ef8..fd2cb6d 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.4.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index edc770c..b6ae77f 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.4.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 5ac67f4..2e4f7f0 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.4.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 17de5d1..0f6d4dd 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.4.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 8c21357..3774b5f 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,15 +16,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.4.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
 BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
-- 
2.4.10
