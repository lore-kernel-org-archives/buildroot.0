From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Mar 2021 09:14:04 +0200
Subject: [Buildroot] [git commit] board/beaglebone: remove
 genimage_linux41.cfg
Message-ID: <20210329064917.79B188A32C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c60df5a77f5e4541e748f541c510272150fcc0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5502a889dd9f065ec4694a993cfa509377da2cce
("configs/beaglebone_qt5: don't use custom post-image script") removed the use
of genimage_linux41.cfg but didn't remove the file.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/genimage_linux41.cfg | 32 --------------------------------
 1 file changed, 32 deletions(-)

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
