From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Apr 2013 22:21:26 +0200
Subject: [Buildroot] [git commit] configs/qemu: bump relevant configs to
	kernel version 3.9.x
Message-ID: <20130429203427.DB26B9B8E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b4d0f2f1b6528c0ffd347b3946c0916aec8667b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Problematic configurations not bumped:

powerpc-g3beige: Kernel oops on boot
sh4-r2d - Qemu doesn't emulate advanced features from the console UART
sparc-ss10 - Illegal instruction

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../{linux-3.8.config => linux-3.9.config}         |    0
 .../x86/{linux-3.8.config => linux-3.9.config}     |    0
 .../x86_64/{linux-3.8.config => linux-3.9.config}  |    0
 configs/qemu_arm_nuri_defconfig                    |    6 +++---
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 configs/qemu_arm_vexpress_defconfig                |    6 +++---
 configs/qemu_microblazebe_mmu_defconfig            |    4 ++--
 configs/qemu_microblazeel_mmu_defconfig            |    4 ++--
 configs/qemu_mips64_malta_defconfig                |    8 ++++----
 configs/qemu_mips_malta_defconfig                  |    8 ++++----
 configs/qemu_mipsel_malta_defconfig                |    8 ++++----
 configs/qemu_ppc_g3beige_defconfig                 |    2 +-
 configs/qemu_ppc_mpc8544ds_defconfig               |    6 +++---
 configs/qemu_ppc_virtex_ml507_defconfig            |    6 +++---
 configs/qemu_sh4_r2d_defconfig                     |    2 +-
 configs/qemu_sparc_ss10_defconfig                  |    4 ++--
 configs/qemu_x86_64_defconfig                      |    8 ++++----
 configs/qemu_x86_defconfig                         |    8 ++++----
 23 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.8.config b/board/qemu/arm-versatile/linux-3.9.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.8.config
rename to board/qemu/arm-versatile/linux-3.9.config
diff --git a/board/qemu/microblazebe-mmu/linux-3.8.config b/board/qemu/microblazebe-mmu/linux-3.9.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.8.config
rename to board/qemu/microblazebe-mmu/linux-3.9.config
diff --git a/board/qemu/microblazeel-mmu/linux-3.8.config b/board/qemu/microblazeel-mmu/linux-3.9.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.8.config
rename to board/qemu/microblazeel-mmu/linux-3.9.config
diff --git a/board/qemu/mips-malta/linux-3.8.config b/board/qemu/mips-malta/linux-3.9.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.8.config
rename to board/qemu/mips-malta/linux-3.9.config
diff --git a/board/qemu/mips64-malta/linux-3.8.config b/board/qemu/mips64-malta/linux-3.9.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.8.config
rename to board/qemu/mips64-malta/linux-3.9.config
diff --git a/board/qemu/mipsel-malta/linux-3.8.config b/board/qemu/mipsel-malta/linux-3.9.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.8.config
rename to board/qemu/mipsel-malta/linux-3.9.config
diff --git a/board/qemu/x86/linux-3.8.config b/board/qemu/x86/linux-3.9.config
similarity index 100%
rename from board/qemu/x86/linux-3.8.config
rename to board/qemu/x86/linux-3.9.config
diff --git a/board/qemu/x86_64/linux-3.8.config b/board/qemu/x86_64/linux-3.9.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.8.config
rename to board/qemu/x86_64/linux-3.9.config
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index b2493eb..f83e53d 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -14,12 +14,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index db18d5b..dcfd0ad 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.9.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 6b2e5ab..d48c0aa 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -14,12 +14,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 5eeb31e..d79fc1d 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 2a14c07..9a25072 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.9.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index e69cb56..751ce5b 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -10,15 +10,15 @@ BR2_PREFER_STATIC_LIB=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 6134cb4..7049de6 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 81723f6..4936df1 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.9.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 10701cd..884291d 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -12,7 +12,7 @@ BR2_KERNEL_HEADERS_3_8=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.10"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 07b9ae9..0440904 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,13 +6,13 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 4fd2eb8..909448d 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index c04f6e8..469ab28 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.39"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.44"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index eb21c31..7e58a0f 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -6,8 +6,8 @@ BR2_sparc_v8=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.4 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_4=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index e22da44..0843062 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.9.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 55b0f53..9c2f050 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.8 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_8=y
+# Lock to 3.9 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_9=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.9.config"
