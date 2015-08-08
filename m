From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:28 -0000
Subject: [Buildroot] [git commit branch/next] 1/1] package/linux-firmware:
	add iwlwifi 6000g2a firmware
Message-ID: <20150808105627.484B97FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33f09a63ea0102a30b47f10b8b68bdc3392314c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Colleen Twitty <colleen@skycatch.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    6 ++++++
 package/linux-firmware/linux-firmware.mk |    5 +++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 7265990..2e4c205 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -81,6 +81,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	  Firmware files for the Intel Wifi 5000 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A
+	bool "Intel iwlwifi 6000G2A"
+	help
+	  Firmware files for the Intel Wifi 6000G2A devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
 	bool "Intel iwlwifi 7260"
 	select BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_NEED_REV
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 87804d8..674b0dc 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -199,6 +199,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6000G2A),y)
+LINUX_FIRMWARE_FILES += iwlwifi-6000g2a-6.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
 LINUX_FIRMWARE_FILES += iwlwifi-7260-$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_REV).ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
