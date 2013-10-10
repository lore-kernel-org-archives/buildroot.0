From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Oct 2013 11:14:17 -0300
Subject: [Buildroot] [PATCH] configs/qemu: bump relevant config versions
Message-ID: <1381414457-15044-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-versatile/{linux-3.10.config => linux-3.11.config} | 0
 .../microblazebe-mmu/{linux-3.10.config => linux-3.11.config}     | 0
 .../microblazeel-mmu/{linux-3.10.config => linux-3.11.config}     | 0
 board/qemu/mips-malta/{linux-3.10.config => linux-3.11.config}    | 0
 board/qemu/mipsel-malta/{linux-3.10.config => linux-3.11.config}  | 0
 .../qemu/powerpc-g3beige/{linux-3.10.config => linux-3.11.config} | 0
 board/qemu/x86/{linux-3.10.config => linux-3.11.config}           | 0
 board/qemu/x86_64/{linux-3.10.config => linux-3.11.config}        | 0
 configs/qemu_arm_nuri_defconfig                                   | 4 ++--
 configs/qemu_arm_versatile_defconfig                              | 8 ++++----
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_microblazebe_mmu_defconfig                           | 4 ++--
 configs/qemu_microblazeel_mmu_defconfig                           | 4 ++--
 configs/qemu_mips64_malta_defconfig                               | 4 ++--
 configs/qemu_mips_malta_defconfig                                 | 8 ++++----
 configs/qemu_mipsel_malta_defconfig                               | 8 ++++----
 configs/qemu_ppc_g3beige_defconfig                                | 8 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig                              | 6 +++---
 configs/qemu_ppc_virtex_ml507_defconfig                           | 6 +++---
 configs/qemu_sh4_r2d_defconfig                                    | 4 ++--
 configs/qemu_sparc_ss10_defconfig                                 | 4 ++--
 configs/qemu_x86_64_defconfig                                     | 8 ++++----
 configs/qemu_x86_defconfig                                        | 8 ++++----
 23 files changed, 45 insertions(+), 45 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/microblazebe-mmu/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/mips-malta/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/powerpc-g3beige/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/x86/{linux-3.10.config => linux-3.11.config} (100%)
 rename board/qemu/x86_64/{linux-3.10.config => linux-3.11.config} (100%)

diff --git a/board/qemu/arm-versatile/linux-3.10.config b/board/qemu/arm-versatile/linux-3.11.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.10.config
rename to board/qemu/arm-versatile/linux-3.11.config
diff --git a/board/qemu/microblazebe-mmu/linux-3.10.config b/board/qemu/microblazebe-mmu/linux-3.11.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.10.config
rename to board/qemu/microblazebe-mmu/linux-3.11.config
diff --git a/board/qemu/microblazeel-mmu/linux-3.10.config b/board/qemu/microblazeel-mmu/linux-3.11.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.10.config
rename to board/qemu/microblazeel-mmu/linux-3.11.config
diff --git a/board/qemu/mips-malta/linux-3.10.config b/board/qemu/mips-malta/linux-3.11.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.10.config
rename to board/qemu/mips-malta/linux-3.11.config
diff --git a/board/qemu/mipsel-malta/linux-3.10.config b/board/qemu/mipsel-malta/linux-3.11.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.10.config
rename to board/qemu/mipsel-malta/linux-3.11.config
diff --git a/board/qemu/powerpc-g3beige/linux-3.10.config b/board/qemu/powerpc-g3beige/linux-3.11.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.10.config
rename to board/qemu/powerpc-g3beige/linux-3.11.config
diff --git a/board/qemu/x86/linux-3.10.config b/board/qemu/x86/linux-3.11.config
similarity index 100%
rename from board/qemu/x86/linux-3.10.config
rename to board/qemu/x86/linux-3.11.config
diff --git a/board/qemu/x86_64/linux-3.10.config b/board/qemu/x86_64/linux-3.11.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.10.config
rename to board/qemu/x86_64/linux-3.11.config
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index c44e8ff..20b825a 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -15,11 +15,11 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.10.15"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.15"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index ef71061..322fc18 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 3f970e9..8bd12af 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 15f36a7..adc7074 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index d313866..7920505 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 035cfa1..0fde6c6 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.3"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 34e19e4..6b952de 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,16 +6,16 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 72304f0..0b9137a 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,16 +6,16 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index e8f0ecc..513c49e 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,16 +6,16 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index a4c29b3..5396cfa 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,14 +6,14 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index e4e3a34a..62dd741 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,9 +6,9 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -16,7 +16,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 8636857..99743a1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.2.50"
+BR2_DEFAULT_KERNEL_VERSION="3.2.51"
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
@@ -21,7 +21,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.50"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.51"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index ad1b136..37c40c4 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -8,11 +8,11 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.3"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index e09b37b..520fcf1 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.11.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index d451d2a..7609cde 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.10 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.7"
+BR2_DEFAULT_KERNEL_VERSION="3.11.4"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.4"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.10.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.11.config"
-- 
1.8.1.5
