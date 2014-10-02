From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 20:15:34 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
	ath6k chips
Message-ID: <20141002181554.84A9A9D759@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e33ce36702a95148065c4276588893c84615ebce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for ath6k(l) driver firmware files (AR6002, AR6003 and
AR6004).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         |   15 +++++++++++++++
 package/linux-firmware/linux-firmware.mk |   18 ++++++++++++++++++
 2 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index cd35dcc..8b71dd3 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -19,6 +19,21 @@ endmenu # Audio
 
 menu "WiFi firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002
+	bool "Atheros 6002"
+	help
+	  Firmware files for the Atheros AR6002 chip
+
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6003
+	bool "Atheros 6003"
+	help
+	  Firmware files for the Atheros AR6003 chip
+
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6004
+	bool "Atheros 6004"
+	help
+	  Firmware files for the Atheros AR6004 chip
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
 	bool "Atheros 7010"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4303985..b435199 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -59,6 +59,24 @@ LINUX_FIRMWARE_FILES += rtlwifi/rtl8821aefw.bin \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# ar6002
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002),y)
+LINUX_FIRMWARE_FILES += ath6k/AR6002
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
+# ar6003
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6003),y)
+LINUX_FIRMWARE_FILES += ath6k/AR6003
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
+# ar6004
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6004),y)
+LINUX_FIRMWARE_FILES += ath6k/AR6004
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
 LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw
