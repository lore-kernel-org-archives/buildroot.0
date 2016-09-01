From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu,  1 Sep 2016 16:32:58 -0300
Subject: [Buildroot] [PATCH] board/minnowboard-max: Add kernel options to
	support USB disks
Message-ID: <20160901193258.10754-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported by bug #9176 the current v4.6 kernel config
(used by Minnowboard MAX and Turbot) does not support
USB disks. Since this is a pretty essential functionality,
it's desirable to have it, so let's add the required options.

Kernel config linux-v3.8.config (currently used by the first
generation Minnowboard) doesn't need this change.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/minnowboard/linux-4.6.config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/board/minnowboard/linux-4.6.config b/board/minnowboard/linux-4.6.config
index 3bc1ffdf08b4..fba48a163c3c 100644
--- a/board/minnowboard/linux-4.6.config
+++ b/board/minnowboard/linux-4.6.config
@@ -14,6 +14,7 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
@@ -45,7 +46,9 @@ CONFIG_SND_HDA_CODEC_HDMI=y
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_USB is not set
 CONFIG_USB=y
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_STORAGE=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
-- 
2.9.3
