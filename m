From: Florian La Roche <florian.laroche@googlemail.com>
Date: Thu, 22 Oct 2020 12:31:51 +0200
Subject: [Buildroot] [PATCH 1/1] BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7610E
 as new firmware option
Message-ID: <20201022103151.57497-1-Florian.LaRoche@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Florian La Roche <Florian.LaRoche@gmail.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1f0111f957..9b999034da 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -289,6 +289,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	help
 	  MediaTek MT7601U
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7610E
+	bool "MediaTek MT7610E"
+	help
+	  MediaTek MT7610E
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT76X2E
 	bool "MediaTek MT76x2e"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e2a6ebcbf1..d9ad942903 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -286,6 +286,12 @@ LINUX_FIRMWARE_FILES += mt7601u.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
 endif
 
+# MT7610
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7610E),y)
+LINUX_FIRMWARE_FILES += mediatek/mt7610e.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+endif
+
 # MT7650
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7650),y)
 LINUX_FIRMWARE_FILES += mt7650.bin
-- 
2.28.0
