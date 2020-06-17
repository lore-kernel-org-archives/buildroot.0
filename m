From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 20:57:24 +0200
Subject: [Buildroot] [git commit] board/olpc: move BACKLIGHT_CLASS_DEVICE up
 to common config
Message-ID: <20200617190502.D606A83C07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a4af6d653a79c028e1dd652603417939c1cf195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both machines need it.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
