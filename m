From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 15:13:59 +0100
Subject: [Buildroot] [git commit] board: atmel: genimage: add 1M offset for
	FAT partition
Message-ID: <20161104141406.66DC980F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07c1ae90c8890e82e62c22beaa4a72f6e081e96c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With older SoCs and some SD cards, a 1024-bytes offset is needed to allow
ROM code to read the content of the FAT partition. As it is usual to get
a 1M bytes offset for the first partition, use this value to avoid boot
issues.

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/sama5d2_xplained_mmc/genimage.cfg | 1 +
 board/atmel/sama5d3_xplained_mmc/genimage.cfg | 1 +
 board/atmel/sama5d4_xplained_mmc/genimage.cfg | 1 +
 3 files changed, 3 insertions(+)

diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
index b0ba22d..d3b7af5 100644
--- a/board/atmel/sama5d2_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
@@ -23,6 +23,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
diff --git a/board/atmel/sama5d3_xplained_mmc/genimage.cfg b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
index 32df453..277ce5f 100644
--- a/board/atmel/sama5d3_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d3_xplained_mmc/genimage.cfg
@@ -23,6 +23,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
diff --git a/board/atmel/sama5d4_xplained_mmc/genimage.cfg b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
index b23ebe4..70bb3e4 100644
--- a/board/atmel/sama5d4_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
@@ -24,6 +24,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
