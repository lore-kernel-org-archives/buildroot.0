From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Nov 2016 13:54:48 +0100
Subject: [Buildroot] [git commit] configs/atmel_sama5d4_xplained: re-add
	defconfig
Message-ID: <20161110125605.44C2781971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a23203bf40ce3ade154cdc3f1b91191ca23fdd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig was mistakenly removed by commit
78ac39cb89a6933c36508f6b10d30150ddb1ba05 due to an improper conflict
detection in "git am". This commit restores it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atmel_sama5d4_xplained_defconfig | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
new file mode 100644
index 0000000..5646723
--- /dev/null
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama5d4_xplained at91-sama5d4_xplained_hdmi at91-sama5d4_xplained_pda4 at91-sama5d4_xplained_pda7 at91-sama5d4_xplained_pda7b"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x3e000
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1000
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2082
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama5d4_xplained_nandflash"
+BR2_PACKAGE_HOST_SAM_BA=y
