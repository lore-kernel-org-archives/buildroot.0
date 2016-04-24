From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:41:27 +0200
Subject: [Buildroot] [git commit] linux-firmware: add support for intel
	iwlwifi 3168
Message-ID: <20160424214207.55A7381D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaf72952528121dd9119e690165ac1440eac8324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6939fc3..939afe8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -74,6 +74,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	  Firmware files for the Intel Wifi 3160 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168
+	bool "Intel iwlwifi 3168"
+	help
+	  Firmware files for the Intel Wifi 3168 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 87ae93b..94cdcfa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -233,6 +233,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3168),y)
+LINUX_FIRMWARE_FILES += iwlwifi-3168-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
 # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
 # different versions of the firmware API. For now, we only install the
