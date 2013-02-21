From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Feb 2013 12:16:54 -0300
Subject: [Buildroot] [PATCH 3/3] configs/qemu: bump relevant configs to
	kernel version 3.8
In-Reply-To: <1361459814-15294-1-git-send-email-gustavo@zacarias.com.ar>
References: <1361459814-15294-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1361459814-15294-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problematic configurations not bumped:

arm-versatilepb - IRQ failure for symbios scsi
sh4-r2d - Qemu still doesn't emulate advanced features from the UART
sparc-ss10 - Illegal instruction

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-nuri/readme.txt                                    | 2 +-
 board/qemu/arm-versatile/readme.txt                               | 2 +-
 board/qemu/arm-vexpress/readme.txt                                | 2 +-
 .../qemu/microblazebe-mmu/{linux-3.7.config => linux-3.8.config}  | 0
 board/qemu/microblazebe-mmu/readme.txt                            | 2 +-
 .../qemu/microblazeel-mmu/{linux-3.7.config => linux-3.8.config}  | 0
 board/qemu/microblazeel-mmu/readme.txt                            | 2 +-
 board/qemu/mips-malta/{linux-3.7.config => linux-3.8.config}      | 0
 board/qemu/mips-malta/readme.txt                                  | 2 +-
 board/qemu/mips64-malta/{linux-3.7.config => linux-3.8.config}    | 0
 board/qemu/mips64-malta/readme.txt                                | 2 +-
 board/qemu/mipsel-malta/{linux-3.7.config => linux-3.8.config}    | 0
 board/qemu/mipsel-malta/readme.txt                                | 2 +-
 board/qemu/powerpc-g3beige/{linux-3.7.config => linux-3.8.config} | 0
 board/qemu/powerpc-g3beige/readme.txt                             | 2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt                           | 2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt                        | 2 +-
 board/qemu/sh4-r2d/readme.txt                                     | 2 +-
 board/qemu/sparc-ss10/readme.txt                                  | 2 +-
 board/qemu/x86/{linux-3.7.config => linux-3.8.config}             | 0
 board/qemu/x86/readme.txt                                         | 2 +-
 board/qemu/x86_64/{linux-3.7.config => linux-3.8.config}          | 0
 board/qemu/x86_64/readme.txt                                      | 2 +-
 configs/qemu_arm_nuri_defconfig                                   | 6 +++---
 configs/qemu_arm_versatile_defconfig                              | 2 +-
 configs/qemu_arm_vexpress_defconfig                               | 6 +++---
 configs/qemu_microblazebe_mmu_defconfig                           | 4 ++--
 configs/qemu_microblazeel_mmu_defconfig                           | 4 ++--
 configs/qemu_mips64_malta_defconfig                               | 8 ++++----
 configs/qemu_mips_malta_defconfig                                 | 8 ++++----
 configs/qemu_mipsel_malta_defconfig                               | 8 ++++----
 configs/qemu_ppc_g3beige_defconfig                                | 8 ++++----
 configs/qemu_ppc_mpc8544ds_defconfig                              | 6 +++---
 configs/qemu_ppc_virtex_ml507_defconfig                           | 6 +++---
 configs/qemu_sh4_r2d_defconfig                                    | 2 +-
 configs/qemu_sparc_ss10_defconfig                                 | 2 +-
 configs/qemu_x86_64_defconfig                                     | 8 ++++----
 configs/qemu_x86_defconfig                                        | 8 ++++----
 38 files changed, 58 insertions(+), 58 deletions(-)
 rename board/qemu/microblazebe-mmu/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/microblazeel-mmu/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/mips-malta/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/mips64-malta/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/powerpc-g3beige/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/x86/{linux-3.7.config => linux-3.8.config} (100%)
 rename board/qemu/x86_64/{linux-3.7.config => linux-3.8.config} (100%)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 3925ab9..dc97c20 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 51364c7..3801f48 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index c74bfcd..26657a5 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/microblazebe-mmu/linux-3.7.config b/board/qemu/microblazebe-mmu/linux-3.8.config
similarity index 100%
rename from board/qemu/microblazebe-mmu/linux-3.7.config
rename to board/qemu/microblazebe-mmu/linux-3.8.config
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index a52b9ad..36adbd3 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/microblazeel-mmu/linux-3.7.config b/board/qemu/microblazeel-mmu/linux-3.8.config
similarity index 100%
rename from board/qemu/microblazeel-mmu/linux-3.7.config
rename to board/qemu/microblazeel-mmu/linux-3.8.config
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index e61eeb6..585c35d 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/mips-malta/linux-3.7.config b/board/qemu/mips-malta/linux-3.8.config
similarity index 100%
rename from board/qemu/mips-malta/linux-3.7.config
rename to board/qemu/mips-malta/linux-3.8.config
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index d3d8446..21d44e7 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/mips64-malta/linux-3.7.config b/board/qemu/mips64-malta/linux-3.8.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.7.config
rename to board/qemu/mips64-malta/linux-3.8.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 1d6ff10..332b09e 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -8,4 +8,4 @@ enabled.
 
 This configuration is known to be flaky.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/mipsel-malta/linux-3.7.config b/board/qemu/mipsel-malta/linux-3.8.config
similarity index 100%
rename from board/qemu/mipsel-malta/linux-3.7.config
rename to board/qemu/mipsel-malta/linux-3.8.config
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 8dd4024..54a2c58 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/powerpc-g3beige/linux-3.7.config b/board/qemu/powerpc-g3beige/linux-3.8.config
similarity index 100%
rename from board/qemu/powerpc-g3beige/linux-3.7.config
rename to board/qemu/powerpc-g3beige/linux-3.8.config
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 05aa380..1efbdf0 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index d361fd9..00603fe 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index a225985..f59f9c1 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 9ae7496..5760f78 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 4290c55..3f70a03 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/x86/linux-3.7.config b/board/qemu/x86/linux-3.8.config
similarity index 100%
rename from board/qemu/x86/linux-3.7.config
rename to board/qemu/x86/linux-3.8.config
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4342556..7ada1be 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/board/qemu/x86_64/linux-3.7.config b/board/qemu/x86_64/linux-3.8.config
similarity index 100%
rename from board/qemu/x86_64/linux-3.7.config
rename to board/qemu/x86_64/linux-3.8.config
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 7d3c6c5..6c81853 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.3.0
+Tested with QEMU 1.4.0
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index a18f5a9..6fec7bf 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -14,12 +14,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 65ee198..64a3c67 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -16,7 +16,7 @@ BR2_KERNEL_HEADERS_3_7=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.9"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.7.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 7b8a7ba..61538eb 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -14,12 +14,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 6e47edf..4c0c9b3 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.8.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 8be173a..35552ae 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -19,9 +19,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.8.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 1b0b622..5b45ec7 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -10,15 +10,15 @@ BR2_PREFER_STATIC_LIB=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index f5a6e09..9dae2a8 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index a768556..8bc2fe6 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,15 +6,15 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 8cbf170..8ce8024 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,15 +6,15 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.8.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index ddaaa45..f592e1b 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,13 +6,13 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index f7f957d..b30c11a 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,8 +6,8 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -15,7 +15,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 4dfccd9..c04f6e8 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -20,7 +20,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.39"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 6b88365..9469532 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -12,6 +12,6 @@ BR2_KERNEL_HEADERS_3_7=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sparc32"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 45f0e0a..bf65e1c 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.8.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 60ceacc..41f046c 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.8.config"
-- 
1.7.12.4
