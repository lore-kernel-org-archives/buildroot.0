From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 19 Feb 2012 22:54:17 +0100
Subject: [Buildroot] [git commit] defconfigs: mx53loco_defconfig: misc tweaks
Message-ID: <20120301130635.4680E90BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fdc1c3b55cbdf04502ca99986c13a0d3c80f6c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use git:// URLs for freescale git trees
- Enable hard fpu for A8
- Board uses uSD cards, so enable ext2 filesystem

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/mx53loco_defconfig |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index eab5b18..ff3948b 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -1,18 +1,23 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
+# BR2_SOFT_FLOAT is not set
+BR2_VFP_FLOAT=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
 BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
 
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
 BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
 BR2_LINUX_KERNEL_DEFCONFIG="imx5"
