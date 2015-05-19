From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 19 May 2015 16:21:48 +0200
Subject: [Buildroot] [PATCH v3 9/9] configs: rename atmel_xplained_defconfig
In-Reply-To: <1432045308-16825-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1432045308-16825-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1432045308-16825-10-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consistency, rename atmel_xplained_defconfig to
atmel_sama5d3_xplained_mmc_defconfig as this configuration supports
booting the sama5d3 Xplained with an MMC card (as opposed to the NAND
flash).

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 board/atmel/xplained/readme.txt                                   | 8 ++++----
 ...el_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} | 0
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename configs/{atmel_xplained_defconfig => atmel_sama5d3_xplained_mmc_defconfig} (100%)

diff --git a/board/atmel/xplained/readme.txt b/board/atmel/xplained/readme.txt
index 63744dde9c7d..7919c606e8af 100644
--- a/board/atmel/xplained/readme.txt
+++ b/board/atmel/xplained/readme.txt
@@ -10,19 +10,19 @@ web site.
 Note that the default Buildroot configuration is prepared to boot from
 an SD card: the first stage bootloader, second stage bootloader,
 kernel image and root filesystem are all located on the SD card. Some
-adjustements in the bootloader configuration will be needed to boot
-from NAND flash.
+adjustments in the bootloader configuration will be needed to boot
+from NAND flash, see board/atmel/nandflash.txt
 
 Configuring and building Buildroot
 ----------------------------------
 
-  make atmel_xplained_defconfig
+  make atmel_sama5d3_xplained_mmc_defconfig
   make
 
 Preparing the SD card
 ---------------------
 
-The SD card must be partitionned with at least two partitions: one
+The SD card must be partitioned with at least two partitions: one
 FAT16 partition for the bootloaders, kernel image and Device Tree
 blob, and one ext4 partition for the root filesystem. To partition the
 SD card:
diff --git a/configs/atmel_xplained_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
similarity index 100%
rename from configs/atmel_xplained_defconfig
rename to configs/atmel_sama5d3_xplained_mmc_defconfig
-- 
2.1.4
