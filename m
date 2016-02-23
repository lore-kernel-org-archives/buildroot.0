From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 01:24:33 +0100
Subject: [Buildroot] [PATCH 9/9] olimex_a20_olinuxino_*: remove old SD
	writing instructions
In-Reply-To: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
References: <1456187073-2876-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1456187073-2876-10-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all the boards have been converted to use genimage, the old
instructions on how to partition and write an SD card are useless.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 board/olimex/a20_olinuxino/readme.txt | 58 ++---------------------------------
 1 file changed, 2 insertions(+), 56 deletions(-)

diff --git a/board/olimex/a20_olinuxino/readme.txt b/board/olimex/a20_olinuxino/readme.txt
index 7cfb51b5e8bf..11d5628d44cb 100644
--- a/board/olimex/a20_olinuxino/readme.txt
+++ b/board/olimex/a20_olinuxino/readme.txt
@@ -61,8 +61,8 @@ After building, you should get a tree like this:
     `-- zImage
 
 
-How to write the SD card - boards with sdcard.img
-=================================================
+How to write the SD card
+========================
 
 The sdcard.img file is a complete bootable image ready to be written
 on the boot medium. To install it, simply copy the image to a uSD
@@ -72,59 +72,5 @@ card:
 
 Where 'sdX' is the device node of the uSD.
 
-
-How to write the SD card - other boards
-=======================================
-
-
-Prepare the SD card
--------------------
-
-Erase existing stuff, and create an unique Linux partition with `fdisk`.
-
-    # fdisk /dev/sdX
-    Command (m for help): o
-    Building a new DOS disklabel with disk identifier 0xf9e1616a.
-    Changes will remain in memory only, until you decide to write them.
-    After that, of course, the previous content won't be recoverable.
-
-    Command (m for help): n
-    Partition type:
-        p   primary (0 primary, 0 extended, 4 free)
-        e   extended
-    Select (default p): p
-    Partition number (1-4, default 1): 1
-    First sector (2048-7626751, default 2048): 2048
-    Last sector, +sectors or +size{K,M,G} (2048-7626751, default 7626751): 
-    Using default value 7626751
-
-    Command (m for help): p
-
-    Disk /dev/sdX: 3904 MB, 3904897024 bytes
-    4 heads, 16 sectors/track, 119168 cylinders, total 7626752 sectors
-    Units = sectors of 1 * 512 = 512 bytes
-    Sector size (logical/physical): 512 bytes / 512 bytes
-    I/O size (minimum/optimal): 512 bytes / 512 bytes
-    Disk identifier: 0xf9e1616a
-
-            Device Boot      Start         End      Blocks   Id  System
-    /dev/sdX1                 2048     7626751     3812352   83  Linux
-
-    Command (m for help): w
-    The partition table has been altered!
-
-    Calling ioctl() to re-read partition table.
-    Syncing disks.
-
-Copy images on the SD card
---------------------------
-
-    # dd if=output/images/rootfs.ext2 of=/dev/sdX1
-    # dd if=output/images/u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1024 seek=8
-
-
-Finish
-======
-
 Eject the SD card, insert it in the A20-OLinuXino board, and power it up.
 
-- 
1.9.1
