From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:55:49 +0200
Subject: [Buildroot] [git commit] configs/warp7: Use mainline U-Boot
Message-ID: <20160912205559.095BF8212C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51a7293bf96ece7efebcdcc2aa9cf476d451ff94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

warp7 is well supported in mainline U-Boot 2016.09, so switch
to this version.

As the current supported kernel is based on a 4.1 kernel from NXP,
use the "warp7_secure" U-Boot target as NXP kernel needs to boot
in secure mode.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
