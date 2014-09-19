From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 19 Sep 2014 16:12:49 +0200
Subject: [Buildroot] [PATCH v4 1/4] configs/freescale_imx6qsabresd: rename
	imx6 to imx6q
In-Reply-To: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1411135972-14968-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig is specific to the SABRESD board equipped with the iMX6Q SoC.
Rename it for clarity in order to avoid confusion with the upcoming
defconfig for the iMX6DL version.

Suggested by Gary Bisson.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Vincent Stehl? <vincent.stehle@freescale.com>

---

Changes since v3:
 - rebased on current master.

This patch was added in v3.

---
 configs/freescale_imx6qsabresd_defconfig | 27 +++++++++++++++++++++++++++
 configs/freescale_imx6sabresd_defconfig  | 27 ---------------------------
 2 files changed, 27 insertions(+), 27 deletions(-)
 create mode 100644 configs/freescale_imx6qsabresd_defconfig
 delete mode 100644 configs/freescale_imx6sabresd_defconfig

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
new file mode 100644
index 0000000..16e4d0b
--- /dev/null
+++ b/configs/freescale_imx6qsabresd_defconfig
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6sabresd_defconfig
deleted file mode 100644
index 16e4d0b..0000000
--- a/configs/freescale_imx6sabresd_defconfig
+++ /dev/null
@@ -1,27 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_cortex_a9=y
-
-# system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
-
-# filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-
-# bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
-- 
1.9.1
