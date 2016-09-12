From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Sep 2016 17:50:48 -0300
Subject: [Buildroot] [PATCH 3/3] warp7: Use mainline U-Boot
In-Reply-To: <1473713448-32466-1-git-send-email-festevam@gmail.com>
References: <1473713448-32466-1-git-send-email-festevam@gmail.com>
Message-ID: <1473713448-32466-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabio Estevam <fabio.estevam@nxp.com>

warp7 is well supported in mainline U-Boot 2016.09, so switch
to this version.

As the current supported kernel is based on a 4.1 kernel from NXP,
use the "warp7_secure" U-Boot target as NXP kernel needs to boot
in secure mode.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 configs/warp7_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 0da34c3..95508d6 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -19,10 +19,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 
 # U-Boot
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="warp7"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Freescale/u-boot-fslc.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="7a8868eb526b7c1d5dc274bc666bfaef9585ba7c"
+BR2_TARGET_UBOOT_BOARDNAME="warp7_secure"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Filesystem
-- 
2.7.4
