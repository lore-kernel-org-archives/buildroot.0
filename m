From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Fri, 8 Apr 2016 16:30:36 +0200
Subject: [Buildroot] [PATCH v3 0/4] sd card image generation for Xplained
	boards
Message-ID: <1460125841-7648-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use genimage to generate a SD card image

Changes
- v3:
  - fix conflicts when applying these patches
- v2:
  - add missing host packages to generate the FAT partition
  - cleanup post-image.sh
  - update documentation

Ludovic Desroches (4):
  configs: atmel: add sama5d2 xplained sd card image generation
  configs: atmel: add sama5d4 xplained sd card image generation
  configs: atmel: add sama5d3 xplained sd card image generation
  board/atmel: update documentation for SD card generation

 board/atmel/readme.txt                         | 66 +++++++++++---------------
 board/atmel/sama5d2_xplained_mmc/genimage.cfg  | 33 +++++++++++++
 board/atmel/sama5d2_xplained_mmc/post-image.sh | 14 ++++++
 board/atmel/sama5d3_xplained_mmc/genimage.cfg  | 33 +++++++++++++
 board/atmel/sama5d3_xplained_mmc/post-image.sh | 14 ++++++
 board/atmel/sama5d4_xplained_mmc/genimage.cfg  | 34 +++++++++++++
 board/atmel/sama5d4_xplained_mmc/post-image.sh | 14 ++++++
 configs/atmel_sama5d2_xplained_mmc_defconfig   |  6 +++
 configs/atmel_sama5d3_xplained_mmc_defconfig   |  6 +++
 configs/atmel_sama5d4_xplained_mmc_defconfig   |  6 +++
 10 files changed, 188 insertions(+), 38 deletions(-)
 create mode 100644 board/atmel/sama5d2_xplained_mmc/genimage.cfg
 create mode 100755 board/atmel/sama5d2_xplained_mmc/post-image.sh
 create mode 100644 board/atmel/sama5d3_xplained_mmc/genimage.cfg
 create mode 100755 board/atmel/sama5d3_xplained_mmc/post-image.sh
 create mode 100644 board/atmel/sama5d4_xplained_mmc/genimage.cfg
 create mode 100755 board/atmel/sama5d4_xplained_mmc/post-image.sh

-- 
2.5.0
