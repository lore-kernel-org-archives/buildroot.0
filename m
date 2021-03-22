From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 22 Mar 2021 16:29:17 +0100
Subject: [Buildroot] [PATCH] board/beaglebone: remove genimage_linux41.cfg
Message-ID: <20210322152925.3218412-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5502a889dd9f065ec4694a993cfa509377da2cce
("configs/beaglebone_qt5: don't use custom post-image script") removed the use
of genimage_linux41.cfg but didn't remove the file.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 board/beaglebone/genimage_linux41.cfg | 32 ---------------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 board/beaglebone/genimage_linux41.cfg

diff --git a/board/beaglebone/genimage_linux41.cfg b/board/beaglebone/genimage_linux41.cfg
deleted file mode 100644
index ba60297dde..0000000000
--- a/board/beaglebone/genimage_linux41.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"MLO",
-			"u-boot.img",
-			"zImage",
-			"uEnv.txt",
-			"am335x-evm.dtb",
-			"am335x-evmsk.dtb",
-			"am335x-bone.dtb",
-			"am335x-boneblack.dtb",
-		}
-	}
-	size = 16M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition u-boot {
-		partition-type = 0xC
-		bootable = "true"
-                image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
-- 
2.25.1
