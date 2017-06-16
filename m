From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Jun 2017 16:41:43 +0200
Subject: [Buildroot] [PATCH 1/2] openblocks_a6_defconfig: bump to
	linux-4.11.5 to fix build with gcc 6
Message-ID: <20170616144144.30280-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recent change to default to gcc 6 for the internal toolchain broke this
defconfig, as the kernel doesn't contain commit cb984d101b (compiler-gcc:
integrate the various compiler-gcc[345].h files) which added during the 4.2
cycle.

Fix the build by bumping the kernel to 4.11.5.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/openblocks_a6_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/openblocks_a6_defconfig b/configs/openblocks_a6_defconfig
index c0522da8cc..fff736389f 100644
--- a/configs/openblocks_a6_defconfig
+++ b/configs/openblocks_a6_defconfig
@@ -10,13 +10,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_ROOTFS_JFFS2=y
 BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_128K=y
 
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_DEFCONFIG="mvebu_v5"
 BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
-- 
2.11.0
