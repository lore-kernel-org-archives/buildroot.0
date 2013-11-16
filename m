From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Nov 2013 00:53:02 +0100
Subject: [Buildroot] [git commit] sheevaplug_defconfig: bump kernel version,
	lock u-boot version
Message-ID: <20131116235541.376709BCF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bf866e7b2571183be20a230d28921b549919463
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stick to 3.11.x for now, as sheevaplug has moved to DT only in 3.12+.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index 70572d7..4161766 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -13,17 +13,19 @@ BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.5.4"
+BR2_DEFAULT_KERNEL_VERSION="3.11.8"
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="sheevaplug"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
 BR2_TARGET_UBOOT_FORMAT_KWB=y
 # BR2_TARGET_UBOOT_NETWORK is not set
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.8"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_UIMAGE=y
