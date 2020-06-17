From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:56:55 +0200
Subject: [Buildroot] [git commit] board/olpc: move MTD symbols up to the
 common config
Message-ID: <20200617190502.BAD0683C07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc2817cfe0e84495e791849351d60289c1091c2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XO-1 has an internal MTD device.

Also, CONFIG_MTD_SPI_NOR was set twice for XO-1.75. One copy is removed,
one remains.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olpc/linux.config         | 2 ++
 board/olpc/xo-1.75/linux.config | 3 ---
 board/olpc/xo-1/linux.config    | 2 ++
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 0ea622eeec..524b80494a 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -19,6 +19,8 @@ CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
+CONFIG_MTD=y
+CONFIG_MTD_BLOCK=y
 CONFIG_NETDEVICES=y
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index c5e0fe17e1..0ca7d16e30 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -31,9 +31,6 @@ CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MTD_SPI_NOR=m
-CONFIG_MTD=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_SPI_NOR=m
 CONFIG_I2C_PXA=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SPI=y
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 72d18ae009..594ee9547e 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -22,7 +22,9 @@ CONFIG_CMA=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_REDBOOT_PARTS=y
 CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=0
+CONFIG_MTD_ONENAND=y
 CONFIG_MTD_ONENAND_GENERIC=y
+CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_CAFE=y
 CONFIG_MTD_UBI=y
 CONFIG_CS5535_MFGPT=y
