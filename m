From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Thu, 24 Mar 2016 15:42:43 +0100
Subject: [Buildroot] [PATCH v2 3/4] configs: atmel: add support for sama5d2
	xplained boot from sd card
In-Reply-To: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
References: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <1458830564-27350-3-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig allows to build all the components to boot from a sd card on a
SAMA5D2 Xplained board. For more details, please read the
board/atmel/readme.txt file.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---

Changes:
- v2:
  - use tag instead of branch for versions
  - use the "Same as kernel" option for the kernel headers

 configs/atmel_sama5d2_xplained_mmc_defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 configs/atmel_sama5d2_xplained_mmc_defconfig

diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
new file mode 100644
index 0000000..74fa2b5
--- /dev/null
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV4=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d2_xplained at91-sama5d2_xplained_pda4 at91-sama5d2_xplained_pda7 at91-sama5d2_xplained_pda7b"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.4"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.2"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d2_xplained_mmc"
-- 
2.5.0
