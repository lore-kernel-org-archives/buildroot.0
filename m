From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:47:59 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add option for TI
 CC2560(A) Bluetooth module
Message-ID: <20181228104548.0515783703@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7008568db6da3dfe02c9d806140f3965b2da85ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This adds a new config option to include the firmware files for the TI
CC2560 and CC2560A Bluetooth modules. LEGO MINDSTORMS EV3 has one of
these two modules depending on when it was manufactured, so it is
useful to include both firmwares to cover all cases for this device.

Signed-off-by: David Lechner <david@lechnology.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index bb88afeec2..dcc8d4bade 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -282,6 +282,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	help
 	  Firmware files for WLAN and Bluetooth modules rs9113
 
+config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
+	bool "TI CC2560"
+	help
+	  Firmware files for Bluetooth modules CC2560 and CC2560A
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e5cd56d9a5..ee02c7a030 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -249,6 +249,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA6174
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+# CC2560(A)
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560),y)
+LINUX_FIRMWARE_FILES += \
+	ti-connectivity/TIInit_6.2.31.bts \
+	ti-connectivity/TIInit_6.6.15.bts
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
