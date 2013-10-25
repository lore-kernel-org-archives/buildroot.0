From: Abdul Hussain <hussain.abdul@outlook.com>
Date: Fri, 25 Oct 2013 22:33:18 +0530
Subject: [Buildroot] [PATCH 1/2] Initial support for I.MX6 SabreAuto board
Message-ID: <BLU0-SMTP40FAFEA0B28C550B66412BF70D0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Abdul Hussain <hussain.abdul@outlook.com>
---
 configs/imx6qsabreauto_defconfig |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/imx6qsabreauto_defconfig

diff --git a/configs/imx6qsabreauto_defconfig b/configs/imx6qsabreauto_defconfig
new file mode 100644
index 0000000..1a3647a
--- /dev/null
+++ b/configs/imx6qsabreauto_defconfig
@@ -0,0 +1,16 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx6"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.denx.de/u-boot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="77b0e2239a13fa83a745ea9b03994bf780a9738a"
-- 
1.7.9.5
