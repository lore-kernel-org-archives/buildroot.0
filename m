From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:01:52 +0200
Subject: [Buildroot] [git commit] configs/imx6ulevk: Use ext4 as filesystem
	type
Message-ID: <20160508130214.63C9781780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f37ef48e82e3ba75fdc5e800c90e10e848983a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Extend the filesystem type to ext4.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/freescale/imx6ulevk/genimage.cfg | 4 ++--
 configs/freescale_imx6ulevk_defconfig  | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/freescale/imx6ulevk/genimage.cfg b/board/freescale/imx6ulevk/genimage.cfg
index 36ede1c..b58193a 100644
--- a/board/freescale/imx6ulevk/genimage.cfg
+++ b/board/freescale/imx6ulevk/genimage.cfg
@@ -4,7 +4,7 @@
 # * the microSD card must have 1 kB free space at the beginning,
 # * U-Boot is dumped as is,
 # * a FAT partition at offset 8 MB is containing zImage and dtbs,
-# * a single root filesystem partition is required (Ext2 in this case).
+# * a single root filesystem partition is required (Ext4 in this case).
 #
 
 image boot.vfat {
@@ -36,6 +36,6 @@ image sdcard.img {
 
   partition rootfs {
     partition-type = 0x83
-    image = "rootfs.ext2"
+    image = "rootfs.ext4"
   }
 }
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index b8a1f86..fbb420e 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -33,3 +33,4 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # filesystem / image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/imx6ulevk/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
