From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:54:12 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Qualcomm AR3012 USB Bluetooth firmware
Message-ID: <20191224134526.233818E247@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9123b046bda31085d0dfe5a845886161b431c233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in           |  5 +++++
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 25 +++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 56399ed930..9d142d2c54 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -69,6 +69,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AR3011
 	help
 	  Firmware files for Atheros bluetooth chipset AR3011.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB
+	bool "Qualcomm Atheros 3012 (USB)"
+	help
+	  Firmware files for Atheros bluetooth chipset AR3012 on USB.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 89bf4bcd2d..b7c9753955 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -21,6 +21,7 @@ sha256 106bef96470001e877fcf7ba0337fa6766a317650eb47fcaeb743eeebd62c4ff LICENCE.
 sha256 8ea9f4aee5f53ad877041ff089e8c95d34d615ce19a3111e5e1ea70d990ed7ff LICENCE.xc4000
 sha256 30ec8a66503dc73f83937564ae70ca23aa03259e64727ff4195b5b6f695e782f LICENCE.xc5000
 sha256 f8822049f32fef2e90a197bd8cf259f476db75d549456bdca8567616a9c07ace LICENCE.xc5000c
+sha256 a064cbf83e10d72579d236a1e36032681adb8e442943ff75b57020a82992a5ed LICENSE.QualcommAtheros_ar3k
 sha256 337a55102138d7baa143ee4a4c6c91693e0113fece35d380b2a12109e8c23b3f LICENSE.QualcommAtheros_ath10k
 sha256 630fd46c95d3ac6544590c2265ba7348fbc930fb386261a1c04dcd9f403645b8 LICENSE.dib0700
 sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.i915
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9454877895..9d86ce57b2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -120,6 +120,31 @@ LINUX_FIRMWARE_FILES += ath3k-1.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
+# ar3012
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB),y)
+LINUX_FIRMWARE_FILES += \
+	ar3k/AthrBT_0x01020001.dfu \
+	ar3k/ramps_0x01020001_26.dfu \
+	ar3k/AthrBT_0x01020200.dfu \
+	ar3k/ramps_0x01020200_26.dfu \
+	ar3k/ramps_0x01020200_40.dfu \
+	ar3k/AthrBT_0x31010000.dfu \
+	ar3k/ramps_0x31010000_40.dfu \
+	ar3k/AthrBT_0x11020000.dfu \
+	ar3k/ramps_0x11020000_40.dfu \
+	ar3k/ramps_0x01020201_26.dfu \
+	ar3k/ramps_0x01020201_40.dfu \
+	ar3k/AthrBT_0x41020000.dfu \
+	ar3k/ramps_0x41020000_40.dfu \
+	ar3k/AthrBT_0x11020100.dfu \
+	ar3k/ramps_0x11020100_40.dfu \
+	ar3k/AthrBT_0x31010100.dfu \
+	ar3k/ramps_0x31010100_40.dfu \
+	ar3k/AthrBT_0x01020201.dfu
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENCE.atheros_firmware LICENSE.QualcommAtheros_ar3k
+endif
+
 # ar6002
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6002
