From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Sep 2013 10:26:12 +0200
Subject: [Buildroot] [git commit] configs: add Freescale SABRE-SD board
	support
Message-ID: <20130929083442.57A159B880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=867867bb1914ce4196d1e9f3fc64e806ea516bf1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SABRE Board for Smart Devices (SABRE-SD) is Freescale's evaluation board
based on the i.MX 6Quad ARM Cortex-A9 applications processor.

This defconfig is based off Freescale "official" git repo on git.freescale.com
and SW release 3.0.35_4.1.0.

[Peter: add comments to defconfig]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/freescale_imx6sabresd_defconfig |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/configs/freescale_imx6sabresd_defconfig b/configs/freescale_imx6sabresd_defconfig
new file mode 100644
index 0000000..b030eee
--- /dev/null
+++ b/configs/freescale_imx6sabresd_defconfig
@@ -0,0 +1,23 @@
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
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
+BR2_LINUX_KERNEL_DEFCONFIG="imx6"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabresd"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
