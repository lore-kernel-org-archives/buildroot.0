From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 11:44:03 -0300
Subject: [Buildroot] [PATCH v2 2/7] linux-firmware: add support for intel
	iwlwifi 7265D
In-Reply-To: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
References: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1461077048-16189-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It selects 7265 non-D firmware since they share the same firmware for
old kernel versions (rev 10 D-variant is the same as rev 10 non-D).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/Config.in         | 7 +++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5a94a3c..1dfb280 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -98,6 +98,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
 	  Firmware files for the Intel Wifi 7265 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D
+	bool "Intel iwlwifi 7265D"
+	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265
+	help
+	  Firmware files for the Intel Wifi 7265D devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2770bd9..532604b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -257,6 +257,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-7265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7265D),y)
+LINUX_FIRMWARE_FILES += iwlwifi-7265D-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.10.51.0.fw \
-- 
2.7.3
