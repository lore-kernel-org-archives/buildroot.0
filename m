From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:52:34 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for Atmel
	at91sam9rlek
Message-ID: <20150630130116.B914080489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c4842e6143f78093f57a07276ce59ab62660dc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91sam9rlek_defconfig |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
new file mode 100644
index 0000000..23f1ebd
--- /dev/null
+++ b/configs/at91sam9rlek_defconfig
@@ -0,0 +1,24 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9rlek"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9rleknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9rlek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_PACKAGE_HOST_SAM_BA=y
