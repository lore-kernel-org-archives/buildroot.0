From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:13:05 +0100
Subject: [Buildroot] [git commit] configs/qemu: update to the latest
	kernel/headers versions
Message-ID: <20141228211312.17C24801F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa0b16d8690e8db9b2dc30291407e7bcc082596a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Used to test the new default binutils 2.24 (all passed).
Also update the virtex readme since the dtb is in output/images as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/ppc-virtex-ml507/readme.txt  |    2 +-
 configs/qemu_aarch64_virt_defconfig     |    4 ++--
 configs/qemu_arm_nuri_defconfig         |    4 ++--
 configs/qemu_arm_versatile_defconfig    |    4 ++--
 configs/qemu_arm_vexpress_defconfig     |    4 ++--
 configs/qemu_microblazebe_mmu_defconfig |    4 ++--
 configs/qemu_microblazeel_mmu_defconfig |    4 ++--
 configs/qemu_mips64_malta_defconfig     |    4 ++--
 configs/qemu_mips64el_malta_defconfig   |    4 ++--
 configs/qemu_mips_malta_defconfig       |    4 ++--
 configs/qemu_mipsel_malta_defconfig     |    4 ++--
 configs/qemu_ppc64_pseries_defconfig    |    4 ++--
 configs/qemu_ppc_g3beige_defconfig      |    4 ++--
 configs/qemu_ppc_mpc8544ds_defconfig    |    4 ++--
 configs/qemu_ppc_virtex_ml507_defconfig |    4 ++--
 configs/qemu_sh4_r2d_defconfig          |    4 ++--
 configs/qemu_sparc_ss10_defconfig       |    4 ++--
 configs/qemu_x86_64_defconfig           |    4 ++--
 configs/qemu_x86_defconfig              |    4 ++--
 configs/qemu_xtensa_lx60_defconfig      |    4 ++--
 20 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/board/qemu/ppc-virtex-ml507/readme.txt b/board/qemu/ppc-virtex-ml507/readme.txt
index 5713970..f8bf150 100644
--- a/board/qemu/ppc-virtex-ml507/readme.txt
+++ b/board/qemu/ppc-virtex-ml507/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
- qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb virtex440-ml507.dtb
+ qemu-system-ppc -M virtex-ml507 -kernel output/images/vmlinux -m 256 -nographic -append "console=ttyS0" -dtb output/images/virtex440-ml507.dtb
 
 The login prompt will appear in the terminal that started Qemu.
 
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 4f414d4..b8aa036 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-3.18.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index 06884ff..45ca553 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -16,12 +16,12 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Lock to 3.10 headers to avoid breaking with newer kernels
 # Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.62"
+BR2_DEFAULT_KERNEL_VERSION="3.10.63"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.62"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.63"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index bc28c8e..513f068 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -12,13 +12,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.18.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 188b614..4910540 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -15,12 +15,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index dd3a009..28c9469 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.18.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index b5305d1..a1a6cb0 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.18.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 42b1e16..be85860 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.18.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 6ce9302..348b892 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -11,13 +11,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.18.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index a61b2b3..4210f9b 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.18.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 7de0b70..0318023 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.18.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 6225f65..9c6d116 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 4cbf7bf..207e347 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-3.18.config"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index acd1d5a..3d34dfc 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index b5f18b7..d96a582 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -8,7 +8,7 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Use soft float
@@ -17,7 +17,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index ed33cb9..23da9f4 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -16,13 +16,13 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.18.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 0468f44..cc5f1be 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-3.18.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 17aad2f..9bbcbdf 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.18.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 996be70..9cb5ce2 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.18.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index f260095..6ebda98 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -16,13 +16,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.18.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
