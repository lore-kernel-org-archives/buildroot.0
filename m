From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Dec 2013 21:29:05 +0100
Subject: [Buildroot] [PATCH 3/4] package/linux-firmware: add Atheros 9170
	firmware
In-Reply-To: <cover.1388003226.git.yann.morin.1998@free.fr>
References: <cover.1388003226.git.yann.morin.1998@free.fr>
Message-ID: <581dd058da4d28ed6a253e8b8120c26da104e7d2.1388003226.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index da37b12..ab7c071 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -15,6 +15,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010
 	help
 	  Firmware files for the Atheros 7010 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170
+	bool "Atheros 9170"
+	help
+	  Firmware files for the Atheros 9170 module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271
 	bool "Atheros 9271"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index f865c73..c6a3e28 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -41,6 +41,10 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX) += \
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
 	LICENCE.atheros_firmware ar7010.fw ar7010_1_1.fw htc_7010.fw
 
+# ar9170
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9170) += \
+	LICENCE.atheros_firmware ar9170-1.fw ar9170-2.fw
+
 # ar9271
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271) += \
 	LICENCE.atheros_firmware ar9271.fw htc_9271.fw
-- 
1.8.1.2
