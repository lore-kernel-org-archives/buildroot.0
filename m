From: Fabio Estevam <fabio.estevam@nxp.com>
Date: Wed, 14 Dec 2016 13:03:21 -0200
Subject: [Buildroot] [PATCH] mx6: udoo: Create a mx6qdl directory for
	consistency
Message-ID: <1481727801-26457-1-git-send-email-fabio.estevam@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The udoo neo files are currently placed inside udoo/neo directory.

Place the mx6qdl udoo related files inside udoo/mx6dl for consistency.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 board/udoo/{ => mx6qdl}/genimage.cfg   | 0
 board/udoo/{ => mx6qdl}/linux.fragment | 0
 board/udoo/{ => mx6qdl}/post-image.sh  | 0
 board/udoo/{ => mx6qdl}/readme.txt     | 0
 configs/mx6udoo_defconfig              | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename board/udoo/{ => mx6qdl}/genimage.cfg (100%)
 rename board/udoo/{ => mx6qdl}/linux.fragment (100%)
 rename board/udoo/{ => mx6qdl}/post-image.sh (100%)
 rename board/udoo/{ => mx6qdl}/readme.txt (100%)

diff --git a/board/udoo/genimage.cfg b/board/udoo/mx6qdl/genimage.cfg
similarity index 100%
rename from board/udoo/genimage.cfg
rename to board/udoo/mx6qdl/genimage.cfg
diff --git a/board/udoo/linux.fragment b/board/udoo/mx6qdl/linux.fragment
similarity index 100%
rename from board/udoo/linux.fragment
rename to board/udoo/mx6qdl/linux.fragment
diff --git a/board/udoo/post-image.sh b/board/udoo/mx6qdl/post-image.sh
similarity index 100%
rename from board/udoo/post-image.sh
rename to board/udoo/mx6qdl/post-image.sh
diff --git a/board/udoo/readme.txt b/board/udoo/mx6qdl/readme.txt
similarity index 100%
rename from board/udoo/readme.txt
rename to board/udoo/mx6qdl/readme.txt
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 8c1b28a..394580b 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,7 +3,7 @@ BR2_cortex_a9=y
 # Linux headers same as kernel, a 4.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/udoo/mx6qdl/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
@@ -17,7 +17,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/linux.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
 # required tools to create the SD card image
-- 
2.7.4
