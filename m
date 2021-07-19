From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:32:36 +0200
Subject: [Buildroot] [git commit] configs/imx7d-sdb: add extlinux.conf
 support
Message-ID: <20210719205850.876B785D7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9936af92c47cf191befecb667f4a977104baad5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imx7d-sdb has been converted to use disto boot in U-Boot.

Add extlinux.conf support so that the board can boot correctly.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf | 4 ++++
 configs/imx7d-sdb_defconfig                                         | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..d538b5d643
--- /dev/null
+++ b/board/freescale/imx7dsdb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx7d-sabresd-buildroot
+  kernel /boot/zImage
+  devicetree /boot/imx7d-sdb.dtb
+  append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 1a3494b4af..0c34f6e6df 100644
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
