From: Mathieu Briand <mbriand@adeneo-embedded.com>
Date: Mon, 13 Feb 2012 10:43:46 +0100
Subject: [Buildroot] [PATCH] Add Freescale MX53 support
In-Reply-To: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
References: <1328273223-16093-1-git-send-email-mbriand@adeneo-embedded.com>
Message-ID: <1329126226-23552-1-git-send-email-mbriand@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot config and Linux Kernel config.
Freescale binaries (xf86 video driver and multimedia codecs) not supported yet.

Signed-off-by: Mathieu Briand <mbriand@adeneo-embedded.com>
---
 configs/mx53loco_defconfig |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 configs/mx53loco_defconfig

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
-- 
1.7.5.4
