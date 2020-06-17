From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:12 +0200
Subject: [Buildroot] [PATCH v2 04/17] board/olpc: move the SDHCI drivers to
 appropriate board configs
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-5-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Platform driver on XO-1.75, PCI on XO-1.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/linux.config         | 2 --
 board/olpc/xo-1.75/linux.config | 1 +
 board/olpc/xo-1/linux.config    | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index e4f94c87c9..4ba157cf0b 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -53,8 +53,6 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index f8c0bff5cc..b686950799 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -20,6 +20,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_ETNAVIV=m
 CONFIG_USB_EHCI_MV=y
+CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_PXAV3=y
 CONFIG_OLPC_XO175=y
 CONFIG_OLPC_XO175_EC=y
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 594ee9547e..8ed10ff62b 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -65,6 +65,7 @@ CONFIG_SND_AC97_POWER_SAVE=y
 CONFIG_SND_CS5535AUDIO=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_OHCI_HCD=y
+CONFIG_MMC_SDHCI_PCI=y
 CONFIG_FB_OLPC_DCON=y
 CONFIG_XO1_RFKILL=y
 CONFIG_RESET_CONTROLLER=y
-- 
2.26.2
