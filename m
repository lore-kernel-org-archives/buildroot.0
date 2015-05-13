From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 13 May 2015 21:22:53 +0200
Subject: [Buildroot] [PATCH v2 5/9] configs: add defconfig for Atmel
	sama5d4ek
In-Reply-To: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1431544977-2274-6-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/atmel_sama5d4ek_defconfig | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 configs/atmel_sama5d4ek_defconfig

diff --git a/configs/atmel_sama5d4ek_defconfig b/configs/atmel_sama5d4ek_defconfig
new file mode 100644
index 000000000000..4c45fb961704
--- /dev/null
+++ b/configs/atmel_sama5d4ek_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_EABIHF=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4ek"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2082
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4eknf_uboot_secure"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="sama5d4ek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.1.4
