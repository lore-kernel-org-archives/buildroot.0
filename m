From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Mon, 30 Mar 2015 14:50:21 +0200
Subject: [Buildroot] [PATCH v2 1/2] imx6sabresd: rename to imx6sabre
In-Reply-To: <550D9052.2000204@mind.be>
References: <550D9052.2000204@mind.be>
Message-ID: <1427719822-12367-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename imx6sabresd board folder to imx6sabre, to prepare for Sabre Auto
addition. Update doc, link and defconfigs accordingly.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Eric B?nard <eric@eukrea.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Gilles Talis <gilles.talis@gmail.com>
Cc: Gary Bisson <bisson.gary@gmail.com>

---

Changes since v1:

- Move the create-boot-sd.sh script under board/freescale and update
  imx6sabre/readme.txt accordingly.

- Remove erroneous mention of Sabre Auto from that patch and move it to
  the next patch.

- Add a "SABRE SD" section in the doc paragraph "Boot the SABRE board".

 board/freescale/{imx6sabresd => }/create-boot-sd.sh   |  0
 board/freescale/imx53loco/create-boot-sd.sh           |  2 +-
 ...e_common-boot-Linux-to-init-in-mfgtools-mode.patch |  0
 board/freescale/{imx6sabresd => imx6sabre}/readme.txt | 19 +++++++++++--------
 configs/freescale_imx6dlsabresd_defconfig             |  2 +-
 configs/freescale_imx6qsabresd_defconfig              |  2 +-
 6 files changed, 14 insertions(+), 11 deletions(-)
 rename board/freescale/{imx6sabresd => }/create-boot-sd.sh (100%)
 rename board/freescale/{imx6sabresd => imx6sabre}/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch (100%)
 rename board/freescale/{imx6sabresd => imx6sabre}/readme.txt (82%)

diff --git a/board/freescale/imx6sabresd/create-boot-sd.sh b/board/freescale/create-boot-sd.sh
similarity index 100%
rename from board/freescale/imx6sabresd/create-boot-sd.sh
rename to board/freescale/create-boot-sd.sh
diff --git a/board/freescale/imx53loco/create-boot-sd.sh b/board/freescale/imx53loco/create-boot-sd.sh
index 3083fd2..b1ce208 120000
--- a/board/freescale/imx53loco/create-boot-sd.sh
+++ b/board/freescale/imx53loco/create-boot-sd.sh
@@ -1 +1 @@
-../imx6sabresd/create-boot-sd.sh
\ No newline at end of file
+../imx6sabre/create-boot-sd.sh
\ No newline at end of file
diff --git a/board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
similarity index 100%
rename from board/freescale/imx6sabresd/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
rename to board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
diff --git a/board/freescale/imx6sabresd/readme.txt b/board/freescale/imx6sabre/readme.txt
similarity index 82%
rename from board/freescale/imx6sabresd/readme.txt
rename to board/freescale/imx6sabre/readme.txt
index 583ef40..6c1a5b5 100644
--- a/board/freescale/imx6sabresd/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -11,12 +11,12 @@ http://cache.freescale.com/files/32bit/doc/quick_start_guide/SABRESDB_IMX6_QSG.p
 Build
 =====
 
-First, configure Buildroot for your SABRESD board.
-For i.MX6Q:
+First, configure Buildroot for your SABRE board.
+For i.MX6Q SABRE SD board:
 
   make freescale_imx6qsabresd_defconfig
 
-For i.MX6DL:
+For i.MX6DL SABRE SD board:
 
   make freescale_imx6dlsabresd_defconfig
 
@@ -44,13 +44,16 @@ and copy the bootloader, kernel, DTBs and root filesystem as needed.
 
 *** WARNING! The script will destroy all the card content. Use with care! ***
 
-  ./board/freescale/imx6sabresd/create-boot-sd.sh <your-sd-device>
+  ./board/freescale/create-boot-sd.sh <your-sd-device>
 
-Boot the SABRESD board
-======================
+Boot the SABRE board
+====================
 
-To boot your newly created system (refer to the SABRESD Quick Start Guide for
-guidance):
+SABRE SD
+--------
+
+To boot your newly created system on a SABRE SD Board (refer to the SABRE SD
+Quick Start Guide for guidance):
 - insert the SD card in the SD3 slot of the board;
 - locate the BOOT dip switches (SW6), set dips 2 and 7 to ON, all others to OFF;
 - connect a Micro USB cable to Debug Port and connect using a terminal emulator
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 680031d..a13d2b9 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index f2f702e..95f29d7 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a9=y
 
 # patches
-BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabresd/patches"
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
 
 # toolchain
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.1.4
