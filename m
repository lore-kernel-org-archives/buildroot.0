From: Dagg Stompler <daggs@gmx.com>
Date: Sun,  3 Dec 2017 14:56:18 +0200
Subject: [Buildroot] [PATCH 7/8] odoridc2: add defconfig for mainline image
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203125619.30919-7-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_mainline_defconfig | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 configs/odroidc2_mainline_defconfig

diff --git a/configs/odroidc2_mainline_defconfig b/configs/odroidc2_mainline_defconfig
new file mode 100644
index 0000000000..37f0623a70
--- /dev/null
+++ b/configs/odroidc2_mainline_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_aarch64=y
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image-mailine.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/hardkernel/odroidc2/post-build.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/hardkernel//odroidc2/odroidc2_mainline_defconfig"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-odroidc2"
+BR2_LINUX_KERNEL_IMAGE=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="odroid-c2"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MESON_TOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.15.1
