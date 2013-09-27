From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 27 Sep 2013 17:44:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] configs: add Freescale i.MX 6SoloLite
	EVK support
Message-ID: <1380296697-9012-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i.MX6 SoloLite EVK is Freescale's evaluation board based on
the i.MX6 SoloLite applications processor.

This defconfig is based off Freescale "official" git repo on git.freescale.com
and SW release 3.0.35_4.1.0.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes v1 -> v2:
- Removed static device nodes support

 configs/freescale_imx6sololiteevk_defconfig |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/freescale_imx6sololiteevk_defconfig

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
new file mode 100644
index 0000000..70d29eb
--- /dev/null
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx6s"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6sl_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
-- 
1.7.10.4
