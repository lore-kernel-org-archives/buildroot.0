From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:23:48 +0200
Subject: [Buildroot] [git commit] board/atmel: at91sam9x5ek_mmc: add 1M
	offset for FAT partition
Message-ID: <20170621192418.4A50D81DC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bd24df2e92fc7bf9a8d6d76c572ab5ae14d49be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

at91sam9x5ek_mmc board was missing in the previous patch adding 1M
offset for FAT partition to solve some boot issues with the ROM code.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/atmel/at91sam9x5ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
index 46c2dc9..b2be647 100644
--- a/board/atmel/at91sam9x5ek_mmc/genimage.cfg
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -24,6 +24,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
