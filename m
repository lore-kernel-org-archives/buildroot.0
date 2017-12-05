From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue,  5 Dec 2017 17:06:57 +0300
Subject: [Buildroot] [PATCH] linux-firmware: Add RedPine RS9113 firmware
Message-ID: <20171205140657.35940-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ad750e82ff..905b32a6a4 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -246,6 +246,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	help
 	  Realtek rtl8821ae
 
+config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
+	bool "Redpine rs9113"
+	help
+	  Firmware files for WLAN and Bluetooth modules rs9113
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d238abe9ea..a08c7a761f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -422,6 +422,12 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.qla2xxx
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113),y)
+LINUX_FIRMWARE_FILES += rsi/rs9113_wlan_qspi.rps
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES),)
 define LINUX_FIRMWARE_INSTALL_FILES
 	cd $(@D) ; \
-- 
2.11.0
