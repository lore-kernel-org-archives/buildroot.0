From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Thu, 15 Jul 2021 09:48:42 +0900
Subject: [Buildroot] [PATCH v2 8/9] board: Add Canaan KD233 support
In-Reply-To: <20210715004843.337268-1-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
Message-ID: <20210715004843.337268-9-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add two configuration files to support the RISC-V Canaan K210 SoC based
KD233 development board. These configurations are similar to the
configurations defined for the Sipeed boards, differing only by the
built-in device tree used.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 board/canaan/kd233/linux-dtb.config   |  2 ++
 configs/canaan_kd233_defconfig        | 23 +++++++++++++++++++++++
 configs/canaan_kd233_sdcard_defconfig | 23 +++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 board/canaan/kd233/linux-dtb.config
 create mode 100644 configs/canaan_kd233_defconfig
 create mode 100644 configs/canaan_kd233_sdcard_defconfig

diff --git a/board/canaan/kd233/linux-dtb.config b/board/canaan/kd233/linux-dtb.config
new file mode 100644
index 0000000000..d5b107124a
--- /dev/null
+++ b/board/canaan/kd233/linux-dtb.config
@@ -0,0 +1,2 @@
+CONFIG_SOC_CANAAN_K210_DTB_BUILTIN=y
+CONFIG_SOC_CANAAN_K210_DTB_SOURCE="canaan_kd233"
diff --git a/configs/canaan_kd233_defconfig b/configs/canaan_kd233_defconfig
new file mode 100644
index 0000000000..d1f6dcdc9b
--- /dev/null
+++ b/configs/canaan_kd233_defconfig
@@ -0,0 +1,23 @@
+BR2_riscv=y
+# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+BR2_KERNEL_HEADERS_5_13=y
+# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_GCC_VERSION_11_X=y
+BR2_GCC_ENABLE_LTO=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_TARGET_GENERIC_HOSTNAME=""
+BR2_INIT_NONE=y
+BR2_ROOTFS_MERGED_USR=y
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="board/canaan/k210-common/busybox-tiny-initramfs.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/configs/canaan_kd233_sdcard_defconfig b/configs/canaan_kd233_sdcard_defconfig
new file mode 100644
index 0000000000..754a996d63
--- /dev/null
+++ b/configs/canaan_kd233_sdcard_defconfig
@@ -0,0 +1,23 @@
+BR2_riscv=y
+# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
+BR2_KERNEL_HEADERS_5_13=y
+# BR2_UCLIBC_INSTALL_UTILS is not set
+BR2_GCC_VERSION_11_X=y
+BR2_GCC_ENABLE_LTO=y
+BR2_PACKAGE_HOST_ELF2FLT=y
+# BR2_USE_MMU is not set
+BR2_TARGET_GENERIC_HOSTNAME=""
+BR2_INIT_NONE=y
+BR2_ROOTFS_MERGED_USR=y
+BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
+BR2_ROOTFS_OVERLAY="board/canaan/k210-common/rootfs_overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210_sdcard"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/canaan/kd233/linux-dtb.config"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
-- 
2.31.1
