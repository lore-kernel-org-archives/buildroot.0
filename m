From: Lubomir Rintel <lkundrak@v3.sk>
Date: Sun, 17 May 2020 13:53:33 +0200
Subject: [Buildroot] [PATCH 07/15] board/olpc: enable dependencies of
 options we use
In-Reply-To: <20200517115341.1677382-1-lkundrak@v3.sk>
References: <20200517115341.1677382-1-lkundrak@v3.sk>
Message-ID: <20200517115341.1677382-8-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A couple of config symbols were mising that things we enable depend on.
Enable them.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/linux.config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 01de870730..538f7c5949 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -32,6 +32,7 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_TABLET=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_SUPPLY=y
 CONFIG_BATTERY_OLPC=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_MEDIA_SUPPORT=y
@@ -54,14 +55,17 @@ CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
+CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
 CONFIG_RTC_CLASS=y
 CONFIG_EXT4_FS=y
 CONFIG_MSDOS_FS=y
 CONFIG_VFAT_FS=y
+CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_FONTS=y
 CONFIG_FONT_TER16x32=y
-- 
2.26.2
