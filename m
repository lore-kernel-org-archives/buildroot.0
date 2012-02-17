From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Feb 2012 14:48:50 +0100
Subject: [Buildroot] [git commit branch/next] configs: Add Freescale MX53
	support
Message-ID: <20120217210304.E470490A5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28df1bc780c17f5fb340665ff89f05c9030b8b6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Buildroot config and Linux Kernel config.
Freescale binaries (xf86 video driver and multimedia codecs) not supported yet.

Signed-off-by: Mathieu Briand <mbriand@adeneo-embedded.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/mx53loco_defconfig |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
new file mode 100644
index 0000000..eab5b18
--- /dev/null
+++ b/configs/mx53loco_defconfig
@@ -0,0 +1,18 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a8=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx53_loco"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/uboot-imx.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="rel_imx_2.6.35_11.09.01"
+BR2_LINUX_KERNEL_DEFCONFIG="imx5"
