From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 May 2014 16:26:14 +0200
Subject: [Buildroot] [git commit] openblocks_a6_defconfig: bump to 3.14.3
	kernel
Message-ID: <20140508145518.472E89CB37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f06109a81502a6bbcbd99904b8358ea7ad52ad54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And lock kernel headers to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/openblocks_a6_defconfig |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index 98017ad..582fa30 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -11,10 +11,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 
+# Lock to 3.14 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.14.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
+
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.9.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.14.3"
 BR2_LINUX_KERNEL_DEFCONFIG="kirkwood"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-openblocks_a6"
