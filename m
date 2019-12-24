From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 14:45:23 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Qualcomm AR3011 Bluetooth firmware
Message-ID: <20191224134526.163E68E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d337a58ae28c0dfe44d82c3286f7b1d14e311c77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Thomas: split from the AR3011/AR3012 commit]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f2658a97da..56399ed930 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -64,6 +64,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174A_BT
 	help
 	  Firmware files for QCA Rome 6174A bluetooth support.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AR3011
+	bool "Qualcomm Atheros 3011"
+	help
+	  Firmware files for Atheros bluetooth chipset AR3011.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5596651532..9454877895 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -114,6 +114,12 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# ar3011
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3011),y)
+LINUX_FIRMWARE_FILES += ath3k-1.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # ar6002
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_6002),y)
 LINUX_FIRMWARE_FILES += ath6k/AR6002
