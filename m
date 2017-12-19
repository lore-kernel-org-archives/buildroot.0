From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Dec 2017 21:49:29 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: Add Atheros 10k
 (QCA998X)
Message-ID: <20171219205130.EB8DE807B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4e3441a1c61570be580724ec48132879e8c7dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add drivers for Atheros 10k (QCA998X) chipset.

Both firmware versions are imported, and unused should be pruned as
required.

[Peter: use upper case 'K' in symbol name]
Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 905b32a..339bb99 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -78,6 +78,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	help
 	  Firmware files for the Atheros 9271 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
+	bool "Atheros 10k (QCA998X)"
+	help
+	  Firmware files for the Atheros QCA988X module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	bool "Broadcom BRCM bcm43xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e999c64..2cfc5e6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -126,6 +126,14 @@ LINUX_FIRMWARE_FILES += ar9271.fw htc_9271.fw ath9k_htc/htc_9271-1.4.0.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
+# ath10k
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X),y)
+LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
+			ath10k/QCA988X/hw2.0/firmware-4.bin \
+			ath10k/QCA988X/hw2.0/firmware-5.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+endif
+
 # sd8686 v8
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8),y)
 LINUX_FIRMWARE_FILES += libertas/sd8686_v8.bin libertas/sd8686_v8_helper.bin
