From: Geoff Levand <geoff@infradead.org>
Date: Thu, 26 Jul 2018 22:21:25 +0000
Subject: [Buildroot] [PATCH v1 2/2] linux-firmware: Add QLogic FastLinQ 4xxxx
In-Reply-To: <cover.1532642378.git.geoff@infradead.org>
References: <cover.1532642378.git.geoff@infradead.org>
Message-ID: <62b0fd196638870d0c17da94ca0cb98b96b6dae3.1532642378.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 074bcc6c78..bb88afeec2 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -320,6 +320,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
 	  (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X
+	bool "QLogic FastLinQ 4xxxx"
+	help
+	  Firmware files for QLogic FastLinQ 4xxxx ethernet devices
+	  (qede)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
 	bool "Realtek 8169"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8e53cacba4..c9866fd1bb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -381,6 +381,13 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
+LINUX_FIRMWARE_FILES += \
+	qed/qed_init_values_zipped-8.33.11.0.bin
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
 LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8105e-1.fw \
-- 
2.14.1
