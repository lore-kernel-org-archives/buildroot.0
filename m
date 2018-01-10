From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Jan 2018 22:38:59 +0100
Subject: [Buildroot] [PATCH v1 2/2] linux-firmware: add support for intel
 iwlwifi 9xxx
In-Reply-To: <20180110213859.8384-1-ps.report@gmx.net>
References: <20180110213859.8384-1-ps.report@gmx.net>
Message-ID: <20180110213859.8384-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 339bb99f1f..e27fc35c4b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -156,6 +156,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8265
 	  Firmware files for the Intel Wifi 8265 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX
+	bool "Intel iwlwifi 9xxx"
+	help
+	  Firmware files for the Intel Wifi 9xxx devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1a4fbc1588..394f2868c3 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -325,6 +325,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-8265-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_9XXX),y)
+LINUX_FIRMWARE_FILES += iwlwifi-9???-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += bnx2x/*
 # No license file; the license is in the file WHENCE
-- 
2.15.1
