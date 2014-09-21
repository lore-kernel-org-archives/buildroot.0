From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:21:50 +0200
Subject: [Buildroot] [git commit] configs/freescale_imx6dlsabresd: add
	defconfig for iMX6DL SabreSD
Message-ID: <20140921192326.553E19BEA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f009496d683a7c001bd636d5cff76e877056fdac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is very similar to freescale_imx6qsabresd_defconfig, which supports the
i.MX6Q ("Quad", quad core CPU) version of the board, except it supports the
i.MX6DL (DualLite, dual core CPU) version.

The differences are in the U-boot configuration and the device tree file.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Vincent Stehl?? <vincent.stehle@freescale.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/freescale_imx6dlsabresd_defconfig |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
new file mode 100644
index 0000000..4177e16
--- /dev/null
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -0,0 +1,27 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6dlsabresd"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
