From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 00:02:23 +0100
Subject: [Buildroot] [git commit] defconfigs: bump sheevaplug kernel to
	3.18.1
Message-ID: <20150101230316.DCF2980812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=998a2aee773ccfef840c72299557f1a8ffe32b1f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/sheevaplug_defconfig |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/configs/sheevaplug_defconfig b/configs/sheevaplug_defconfig
index d036622..5422f67 100644
--- a/configs/sheevaplug_defconfig
+++ b/configs/sheevaplug_defconfig
@@ -10,11 +10,10 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 
-
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.8"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_11=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
@@ -27,6 +26,8 @@ BR2_TARGET_UBOOT_FORMAT_KWB=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.8"
-BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
-BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
+BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-sheevaplug"
