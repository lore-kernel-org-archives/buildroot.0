From: Lubomir Rintel <lkundrak@v3.sk>
Date: Fri, 11 Sep 2020 08:00:23 +0200
Subject: [Buildroot] [PATCH 2/2] board/olpc/xo-1.75: enable drivers that
 were added in 5.8
In-Reply-To: <20200911060023.1210248-1-lkundrak@v3.sk>
References: <20200911060023.1210248-1-lkundrak@v3.sk>
Message-ID: <20200911060023.1210248-3-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This notably makes sound work.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/xo-1.75/linux.config | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index 30e43a8860..937cc38bd5 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -15,8 +15,11 @@ CONFIG_NEON=y
 CONFIG_SENSORS_LIS3_SPI=y
 CONFIG_SERIO_OLPC_APSP=y
 CONFIG_REGULATOR_88PG86X=m
+CONFIG_MEDIA_PLATFORM_SUPPORT=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_MMP_CAMERA=y
 CONFIG_DRM_ARMADA=y
+CONFIG_DRM_CHRONTEL_CH7033=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_ETNAVIV=m
@@ -33,14 +36,20 @@ CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MTD_SPI_NOR=m
+CONFIG_SRAM=y
 CONFIG_I2C_PXA=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_SPI_SLAVE=y
 CONFIG_SND_SOC=y
+CONFIG_SND_MMP_SOC_SSPA=y
 CONFIG_SND_SOC_RT5631=y
+CONFIG_SND_AUDIO_GRAPH_CARD=y
 CONFIG_PWRSEQ_SD8787=m
 CONFIG_RTC_DRV_DS1307=y
+CONFIG_DMADEVICES=y
+CONFIG_MMP_TDMA=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ZFORCE=y
+CONFIG_COMMON_CLK_MMP2_AUDIO=y
-- 
2.26.2
