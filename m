From: Lubomir Rintel <lkundrak@v3.sk>
Date: Sun, 17 May 2020 13:53:29 +0200
Subject: [Buildroot] [PATCH 03/15] board/olpc: move BACKLIGHT_CLASS_DEVICE
 up to common config
In-Reply-To: <20200517115341.1677382-1-lkundrak@v3.sk>
References: <20200517115341.1677382-1-lkundrak@v3.sk>
Message-ID: <20200517115341.1677382-4-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both machines need it.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/linux.config         | 1 +
 board/olpc/xo-1.75/linux.config | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 75670936e5..e4f94c87c9 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -45,6 +45,7 @@ CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FB_SIMPLE=y
 CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_USB=y
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index 4a779a3b23..f8c0bff5cc 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -19,7 +19,6 @@ CONFIG_DRM_ARMADA=y
 CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
 CONFIG_DRM_ETNAVIV=m
-CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_USB_EHCI_MV=y
 CONFIG_MMC_SDHCI_PXAV3=y
 CONFIG_OLPC_XO175=y
-- 
2.26.2
