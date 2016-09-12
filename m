From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 18:30:17 -0300
Subject: [Buildroot] [PATCH] configs/wandboard: Remove
	BR2_LINUX_KERNEL_CUSTOM_GIT
Message-ID: <1473715817-1727-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

Now that we use a mainline kernel for wandboard, we no longer
need to select BR2_LINUX_KERNEL_CUSTOM_GIT, so remove it.

This fixes the following warning:

make wandboard_defconfig
/configs/wandboard_defconfig:19:warning: override: BR2_LINUX_KERNEL_CUSTOM_VERSION changes choice state
#
# configuration written to /home/fabio/buildroot/.config

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/wandboard_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 18d30d9..4149ecf 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -15,7 +15,6 @@ BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.7.3"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-- 
2.7.4
