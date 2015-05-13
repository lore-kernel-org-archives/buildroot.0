From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 13 May 2015 21:22:52 +0200
Subject: [Buildroot] [PATCH v2 4/9] configs: add defconfig for Atmel
	sama5d3xek
In-Reply-To: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1431544977-2274-5-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This supports:
 - sama5d31ek
 - sama5d33ek
 - sama5d34ek
 - sama5d35ek
 - sama5d36ek

with or without the PDA4 or PDA7 screens.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/atmel_sama5d3xek_defconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 configs/atmel_sama5d3xek_defconfig

diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
new file mode 100644
index 000000000000..ff80851ebb12
--- /dev/null
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d31ek_pda4 sama5d31ek_pda7 sama5d31ek_revc sama5d31ek_revc_pda4 sama5d31ek_revc_pda7 sama5d33ek sama5d33ek_pda4 sama5d33ek_pda7 sama5d33ek_revc sama5d33ek_revc_pda4 sama5d33ek_revc_pda7 sama5d34ek sama5d34ek_pda4 sama5d34ek_pda7 sama5d34ek_revc sama5d34ek_revc_pda4 sama5d34ek_revc_pda7 sama5d35ek sama5d35ek_revc sama5d36ek sama5d36ek_pda4 sama5d36ek_pda7 sama5d36ek_revc sama5d36ek_revc_pda4 sama5d36ek_revc_pda7"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="sama5d3xek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.1.4
