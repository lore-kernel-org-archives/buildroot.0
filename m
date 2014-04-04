From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Fri, 4 Apr 2014 18:37:02 +0200
Subject: [Buildroot] [PATCH] configs: add Freescale SABRE Auto board support
Message-ID: <1396629422-24577-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SABRE Board for Automotive Infotainment (SABRE Auto, a.k.a. SABRE-AI) is
Freescale's evaluation board based on the i.MX 6 ARM Cortex-A9 applications
processor.

This defconfig is an adaptation of freescale_imx6sabresd_defconfig for SABRE
Auto, and is based on Freescale "official" git repo on git.freescale.com and SW
release 3.0.35_4.1.0.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/freescale_imx6sabreauto_defconfig | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 configs/freescale_imx6sabreauto_defconfig

diff --git a/configs/freescale_imx6sabreauto_defconfig b/configs/freescale_imx6sabreauto_defconfig
new file mode 100644
index 0000000..1b99a6f
--- /dev/null
+++ b/configs/freescale_imx6sabreauto_defconfig
@@ -0,0 +1,23 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx6"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabreauto"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0"
-- 
1.9.1
