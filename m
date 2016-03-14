From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 22:14:56 +0100
Subject: [Buildroot] [git commit] configs/qemu: bump to the latest linux
	versions
Message-ID: <20160314211551.1A33B807A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de5906a384f826b9593c2e677bac66eda80c22f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arm_versatile kernel defconfig updated to deal with multi-platform ARM
support and driver changes.

mips(el) 32-bits is back in working order for 4.5

Results table:

Defconfig               Kernel          Qemu    Network Status
--------------------------------------------------------------
aarch64_virt            4.5             2.3.0   YES     OK
arm_versatile           4.5             2.3.0   YES     OK
arm_vexpress            4.5             2.3.0   YES     OK
microblazebe            4.5             2.3.0   YES     OK
microblazeel            4.5             2.3.0   YES     OK
mips64el_malta          4.5             2.3.0   YES     OK
mips64_malta            4.5             2.3.0   YES     OK
mipsel_malta            4.5             2.3.0   YES     OK
mips_malta              4.5             2.3.0   YES     OK
ppc_g3beige             4.5             2.3.0   YES     OK
ppc_mpc8544ds           4.5             2.3.0   YES     OK
ppc_virtex_ml507        4.5             2.3.0   NO      OK
ppc64_pseries           4.5             2.3.0   YES     OK
sh4                     4.5             2.3.0   YES     OK
sh4eb                   4.5             2.3.0   NO (1)  OK
sparc_ss10              4.5             2.3.0   YES     OK
sparc64_sun4u           4.5             2.3.0   YES     OK
sparc_sun4u             4.5             2.3.0   YES     OK
x86                     4.5             2.3.0   YES     OK
x86_64                  4.5             2.3.0   YES     OK
xtensa_lx60             4.4.5           2.3.0   YES (2) OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - xtensa ethernet broken in 4.5 so stick to 4.4.x

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/aarch64-virt/{linux-4.4.config => linux-4.5.config}    | 0
 board/qemu/arm-versatile/{linux-4.4.config => linux-4.5.config}   | 5 ++---
 .../qemu/microblazebe-mmu/{linux-4.4.config => linux-4.5.config}  | 0
 .../qemu/microblazeel-mmu/{linux-4.4.config => linux-4.5.config}  | 0
 board/qemu/mips-malta/{linux-4.3.config => linux-4.5.config}      | 0
 board/qemu/mips64-malta/{linux-4.4.config => linux-4.5.config}    | 0
 board/qemu/mips64el-malta/{linux-4.4.config => linux-4.5.config}  | 0
 board/qemu/mipsel-malta/{linux-4.3.config => linux-4.5.config}    | 0
 board/qemu/ppc-g3beige/{linux-4.4.config => linux-4.5.config}     | 0
 board/qemu/ppc-mpc8544ds/{linux-4.4.config => linux-4.5.config}   | 0
 .../qemu/ppc-virtex-ml507/{linux-4.4.config => linux-4.5.config}  | 0
 board/qemu/sh4-r2d/{linux-4.4.config => linux-4.5.config}         | 0
 board/qemu/sh4eb-r2d/{linux-4.4.config => linux-4.5.config}       | 0
 board/qemu/sparc-ss10/{linux-4.4.config => linux-4.5.config}      | 0
 board/qemu/sparc64-sun4u/{linux-4.4.config => linux-4.5.config}   | 0
 board/qemu/{x86_64/linux-4.4.config => x86/linux-4.5.config}      | 0
 board/qemu/{x86/linux-4.4.config => x86_64/linux-4.5.config}      | 0
 configs/qemu_aarch64_virt_defconfig                               | 8 ++++----
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_microblazebe_mmu_defconfig                           | 8 ++++----
 configs/qemu_microblazeel_mmu_defconfig                           | 8 ++++----
 configs/qemu_mips64_malta_defconfig                               | 8 ++++----
 configs/qemu_mips64el_malta_defconfig                             | 8 ++++----
 configs/qemu_mips_malta_defconfig                                 | 8 ++++----
 configs/qemu_mipsel_malta_defconfig                               | 8 ++++----
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
 configs/qemu_xtensa_lx60_defconfig                                | 2 +-
 37 files changed, 77 insertions(+), 78 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux-4.4.config b/board/qemu/aarch64-virt/linux-4.5.config
similarity index 100%
rename from board/qemu/aarch64-virt/linux-4.4.config
rename to board/qemu/aarch64-virt/linux-4.5.config
diff --git a/board/qemu/arm-versatile/linux-4.4.config b/board/qemu/arm-versatile/linux-4.5.config
similarity index 92%
rename from board/qemu/arm-versatile/linux-4.4.config
rename to board/qemu/arm-versatile/linux-4.5.config
index 99df3a6..b1001d8 100644
--- a/board/qemu/arm-versatile/linux-4.4.config
+++ b/board/qemu/arm-versatile/linux-4.5.config
@@ -1,12 +1,11 @@
 CONFIG_SYSVIPC=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_VERSATILE=y
-CONFIG_MACH_VERSATILE_AB=y
-CONFIG_MACH_VERSATILE_DT=y
 CONFIG_PCI=y
+CONFIG_PCI_VERSATILE=y
 CONFIG_AEABI=y
-CONFIG_USE_OF=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/board/qemu/microblazebe-mmu/linux-4.4.config b/board/qemu/microblazebe-mmu/linux-4.5.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-4.4.config
rename to board/qemu/microblazebe-mmu/linux-4.5.config
diff --git a/board/qemu/microblazeel-mmu/linux-4.4.config b/board/qemu/microblazeel-mmu/linux-4.5.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-4.4.config
rename to board/qemu/microblazeel-mmu/linux-4.5.config
diff --git a/board/qemu/mips-malta/linux-4.3.config b/board/qemu/mips-malta/linux-4.5.config
similarity index 100%
rename from board/qemu/mips-malta/linux-4.3.config
rename to board/qemu/mips-malta/linux-4.5.config
diff --git a/board/qemu/mips64-malta/linux-4.4.config b/board/qemu/mips64-malta/linux-4.5.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-4.4.config
rename to board/qemu/mips64-malta/linux-4.5.config
diff --git a/board/qemu/mips64el-malta/linux-4.4.config b/board/qemu/mips64el-malta/linux-4.5.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-4.4.config
rename to board/qemu/mips64el-malta/linux-4.5.config
diff --git a/board/qemu/mipsel-malta/linux-4.3.config b/board/qemu/mipsel-malta/linux-4.5.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-4.3.config
rename to board/qemu/mipsel-malta/linux-4.5.config
diff --git a/board/qemu/ppc-g3beige/linux-4.4.config b/board/qemu/ppc-g3beige/linux-4.5.config
similarity index 100%
rename from board/qemu/ppc-g3beige/linux-4.4.config
rename to board/qemu/ppc-g3beige/linux-4.5.config
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.4.config b/board/qemu/ppc-mpc8544ds/linux-4.5.config
similarity index 100%
rename from board/qemu/ppc-mpc8544ds/linux-4.4.config
rename to board/qemu/ppc-mpc8544ds/linux-4.5.config
diff --git a/board/qemu/ppc-virtex-ml507/linux-4.4.config b/board/qemu/ppc-virtex-ml507/linux-4.5.config
similarity index 100%
rename from board/qemu/ppc-virtex-ml507/linux-4.4.config
rename to board/qemu/ppc-virtex-ml507/linux-4.5.config
diff --git a/board/qemu/sh4-r2d/linux-4.4.config b/board/qemu/sh4-r2d/linux-4.5.config
similarity index 100%
rename from board/qemu/sh4-r2d/linux-4.4.config
rename to board/qemu/sh4-r2d/linux-4.5.config
diff --git a/board/qemu/sh4eb-r2d/linux-4.4.config b/board/qemu/sh4eb-r2d/linux-4.5.config
similarity index 100%
rename from board/qemu/sh4eb-r2d/linux-4.4.config
rename to board/qemu/sh4eb-r2d/linux-4.5.config
diff --git a/board/qemu/sparc-ss10/linux-4.4.config b/board/qemu/sparc-ss10/linux-4.5.config
similarity index 100%
rename from board/qemu/sparc-ss10/linux-4.4.config
rename to board/qemu/sparc-ss10/linux-4.5.config
diff --git a/board/qemu/sparc64-sun4u/linux-4.4.config b/board/qemu/sparc64-sun4u/linux-4.5.config
similarity index 100%
rename from board/qemu/sparc64-sun4u/linux-4.4.config
rename to board/qemu/sparc64-sun4u/linux-4.5.config
diff --git a/board/qemu/x86_64/linux-4.4.config b/board/qemu/x86/linux-4.5.config
similarity index 100%
rename from board/qemu/x86_64/linux-4.4.config
rename to board/qemu/x86/linux-4.5.config
diff --git a/board/qemu/x86/linux-4.4.config b/board/qemu/x86_64/linux-4.5.config
similarity index 100%
rename from board/qemu/x86/linux-4.4.config
rename to board/qemu/x86_64/linux-4.5.config
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index ec4c642..193f7da 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.5.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index d95c803..b62286d 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,15 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 06a42dc..77b4750 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 658e0d1..ef5d1c7 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.5.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index a3a35da..aa52096 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.5.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 5ce3fe7..fb8d26b 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index ed867e7..f4b7008 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 6676660..1d5aae7 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 36ad158..2fdacca 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.3 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.3.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 041298c..ac9409a 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 86beb43..6f85936 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 2fe6775..2fb52dd 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 0154ee8..d64fbfd 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,9 +15,9 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-virtex-ml507/linux-4.5.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="virtex440-ml507"
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index d8edf49..c7f4ec1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index cb27a73..06215c9 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index fd2cb6d..e7f17da 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.5.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index b6ae77f..08cbca3 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,13 +9,13 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.5.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 2e4f7f0..e4658a3 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.5.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 0f6d4dd..ccd0dd7 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.5 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.5.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 3774b5f..4170bba 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -22,7 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.4.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
