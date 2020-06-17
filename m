From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:14 +0200
Subject: [Buildroot] [PATCH v2 06/17] board/olpc: move LIS3_SPI to XO-1.75
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-7-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's only present on ARM OLPC laptops.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/xo-1.75/linux.config | 1 +
 board/olpc/xo-1/linux.config    | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index b686950799..30e43a8860 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -12,6 +12,7 @@ CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_SENSORS_LIS3_SPI=y
 CONFIG_SERIO_OLPC_APSP=y
 CONFIG_REGULATOR_88PG86X=m
 CONFIG_VIDEO_MMP_CAMERA=y
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 0680e073cb..9f6731a5a5 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -29,7 +29,6 @@ CONFIG_MTD_NAND_CAFE=y
 CONFIG_MTD_UBI=y
 CONFIG_CS5535_MFGPT=y
 CONFIG_CS5535_CLOCK_EVENT_SRC=y
-CONFIG_SENSORS_LIS3_SPI=y
 CONFIG_MOUSE_PS2_OLPC=y
 CONFIG_SERIAL_8250_NR_UARTS=1
 CONFIG_SERIAL_8250_RUNTIME_UARTS=1
-- 
2.26.2
