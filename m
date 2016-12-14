From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 16:15:06 +0100
Subject: [Buildroot] [git commit] mx6: udoo: Create a mx6qdl directory for
	consistency
Message-ID: <20161214151745.E8E7880170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba4fabb1ce351f05918cbfcb44eb969e7e741061
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The udoo neo files are currently placed inside udoo/neo directory.

Place the mx6qdl udoo related files inside udoo/mx6dl for consistency.

[Peter also update path in readme.txt]
Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/udoo/{ => mx6qdl}/genimage.cfg   | 0
 board/udoo/{ => mx6qdl}/linux.fragment | 0
 board/udoo/{ => mx6qdl}/post-image.sh  | 0
 board/udoo/{ => mx6qdl}/readme.txt     | 2 +-
 configs/mx6udoo_defconfig              | 4 ++--
 5 files changed, 3 insertions(+), 3 deletions(-)

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
similarity index 92%
rename from board/udoo/readme.txt
rename to board/udoo/mx6qdl/readme.txt
index acd05f6..cf1a610 100644
--- a/board/udoo/readme.txt
+++ b/board/udoo/mx6qdl/readme.txt
@@ -14,4 +14,4 @@ directory, ready to be dumped on a micro SD card:
 dd if=output/images/sdcard.img of=/dev/<your-microsd-device>
 
 For details about the medium image layout, see the definition in
-board/udoo/genimage.cfg.
+board/udoo/mx6qdl/genimage.cfg.
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
