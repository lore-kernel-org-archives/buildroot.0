From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 11 Jul 2021 17:19:53 -0300
Subject: [Buildroot] [PATCH 2/3] configs/imx7d-sdb: Add extlinux.conf support
In-Reply-To: <20210711201954.2142662-1-festevam@gmail.com>
References: <20210711201954.2142662-1-festevam@gmail.com>
Message-ID: <20210711201954.2142662-2-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imx7d-sdb has been converted to use disto boot in U-Boot.

Add extlinux.conf support so that the board can boot correctly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf       | 4 ++++
 configs/imx7d-sdb_defconfig                                   | 2 ++
 2 files changed, 6 insertions(+)
 create mode 100644 board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..d538b5d6432f
--- /dev/null
+++ b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx7d-sabresd-buildroot
+  kernel /boot/zImage
+  devicetree /boot/imx7d-sdb.dtb
+  append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 1a3494b4af44..0c34f6e6dfea 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
@@ -26,6 +27,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 
 # Filesystem
+BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.25.1
