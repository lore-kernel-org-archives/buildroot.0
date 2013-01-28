From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Jan 2013 20:58:18 +0100
Subject: [Buildroot] [git commit] linux-firmware: add new config option of
	iwlwifi 5000 firmware
Message-ID: <20130128200328.0E6679A851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4fc984b8728206c142b1ecfcd162d97126f2080
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |    6 ++++++
 package/linux-firmware/linux-firmware.mk |    7 +++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index bf264eb..9998f22 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -20,6 +20,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	help
 	  Firmware files for the Atheros 9271 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
+	bool "Intel iwlwifi 5000"
+	help
+	  Firmware files for the Intel Wifi 5000 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
        bool "Libertas SD 8686 v8"
        help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index db20d33..8f96452 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -92,6 +92,13 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL128X) += \
 	ti-connectivity/TIInit_7.2.31.bts 			\
 	LICENCE.ti-connectivity
 
+# iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
+# iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
+# different versions of the firmware API. For now, we only install the
+# most recent one.
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000) += \
+	iwlwifi-5000-5.ucode LICENCE.iwlwifi_firmware
+
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_XC5000) += \
 	dvb-fe-xc5000-1.6.114.fw
 
