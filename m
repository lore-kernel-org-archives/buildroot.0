From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 21 Jun 2017 10:11:59 +0200
Subject: [Buildroot] [PATCH 1/3] board/atmel: at91sam9x5ek_mmc: add 1M
	offset for FAT partition
Message-ID: <20170621081201.7717-1-ludovic.desroches@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at91sam9x5ek_mmc board was missing in the previous patch adding 1M
offset for FAT partition to solve some boot issues with the ROM code.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
 board/atmel/at91sam9x5ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/at91sam9x5ek_mmc/genimage.cfg b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
index 46c2dc9366..b2be647d8b 100644
--- a/board/atmel/at91sam9x5ek_mmc/genimage.cfg
+++ b/board/atmel/at91sam9x5ek_mmc/genimage.cfg
@@ -24,6 +24,7 @@ image sdcard.img {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
-- 
2.12.2
