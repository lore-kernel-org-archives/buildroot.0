From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jan 2015 00:02:23 +0100
Subject: [Buildroot] [git commit] defconfigs: bump openblocks a6 kernel to
	3.18.1
Message-ID: <20150101230316.D461280464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c089bb25e2a2d7f44f2ce6e7a98e25dcd4594d0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And move to mvebu_v5_defconfig as kirkwood has been merged with mvebu since
3.17.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/openblocks_a6_defconfig |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index 582fa30..d9994f2 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -11,15 +11,16 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 
-# Lock to 3.14 headers to avoid breaking with newer kernels
+# Lock to 3.18 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.14.3"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+BR2_DEFAULT_KERNEL_VERSION="3.18.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.14.3"
-BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
+BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-openblocks_a6"
