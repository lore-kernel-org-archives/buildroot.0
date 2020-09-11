From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 08:51:16 +0200
Subject: [Buildroot] [git commit] board/olpc/xo-1.75: enable drivers that
 were added in 5.8
Message-ID: <20200911064327.47EB381466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03523e60695062770785de7d5a9cc91b2b8c3855
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This notably makes sound work.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
