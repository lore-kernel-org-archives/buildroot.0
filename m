From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:33:08 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 intel iwlwifi 22260
Message-ID: <20200907212449.CD0D888094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f76bfdbddae7b331be0787285d77246e83ae5851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index eba58014b6..fbf374fa85 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -128,6 +128,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 	help
 	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
+	bool "Intel iwlwifi 22260"
+	help
+	  Firmware files for the Intel Wifi 22260 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index cbad8d592a..2af8d09f40 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -371,6 +371,11 @@ LINUX_FIRMWARE_FILES += wil6210.*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260),y)
+LINUX_FIRMWARE_FILES += iwlwifi-cc-a0-*.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
