From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 14:51:44 +0200
Subject: [Buildroot] [PATCH 1/8] configs: update at91sam9g45m10ek defconfig
In-Reply-To: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1430398311-10804-2-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use kernel (3.18) and u-boot (2015.01) from Atmel's repositories.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/at91sam9g45m10ek_defconfig | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/configs/at91sam9g45m10ek_defconfig b/configs/at91sam9g45m10ek_defconfig
index c958859df1a3..deaa193a5372 100644
--- a/configs/at91sam9g45m10ek_defconfig
+++ b/configs/at91sam9g45m10ek_defconfig
@@ -1,9 +1,18 @@
 BR2_arm=y
 BR2_arm926t=y
-BR2_PACKAGE_HOST_SAM_BA=y
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9m10g45ek"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-3.18-at91"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9m10g45ek"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9m10g45eknf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="at91sam9m10g45ek_nandflash"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g45"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.1.4
