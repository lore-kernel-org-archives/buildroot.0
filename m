From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Sep 2013 10:26:00 +0200
Subject: [Buildroot] [git commit] configs: add Freescale i.MX 6SoloLite EVK
	support
Message-ID: <20130929083442.513449B8AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df5f1b56e62d1d986b6d8bf5d0d987f813ee8f40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i.MX6 SoloLite EVK is Freescale's evaluation board based on
the i.MX6 SoloLite applications processor.

This defconfig is based off Freescale "official" git repo on git.freescale.com
and SW release 3.0.35_4.1.0.

[Peter: comment defconfig]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/freescale_imx6sololiteevk_defconfig |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
new file mode 100644
index 0000000..997ecbe
--- /dev/null
+++ b/configs/freescale_imx6sololiteevk_defconfig
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
+BR2_LINUX_KERNEL_DEFCONFIG="imx6s"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6sl_evk"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_3.0.35_4.1.0"
