From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 12 Apr 2013 15:02:18 +0200
Subject: [Buildroot] [git commit] nitrogen6x: get rid of ext2 rev 1 notice
	now we can create it directly instead
Message-ID: <20130412130255.85CD39B5D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7219dfa275abaf332cb3828be381436147f41f04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And update the defconfig to do so.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/boundarydevices/nitrogen6x/readme.txt |    7 -------
 configs/nitrogen6x_defconfig                |    1 +
 2 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
index 6e9b95c..a9ded49 100644
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -2,13 +2,6 @@ Buildroot for Boundary Devices Nitrogen6X:
 
 http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/
 
-Notice: U-Boot as shipped on the board has a bug reading rev 0 ext2
-file systems (which is what genext2fs generates). To convert it to rev
-1, do:
-
-tune2fs -O filetype output/images/rootfs.ext2
-e2fsck -a output/images/rootfs.ext2
-
 To install, simply extract rootfs.ext2 to first partition of a uSD card:
 
 sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 9b4d473..cdd8000 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -9,6 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r1=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
