From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:09 +0200
Subject: [Buildroot] [PATCH 11/15 v2] package/linux-firmware: add option for
	Abilis Systems DVB-T as102
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <d31359d16de0b1889a32f04e8bf7ceb9cb2fa67a.1411246412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 56045a8..b8a5ab0 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -180,6 +180,11 @@ endmenu
 
 menu "DVB firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AS102
+	bool "Abilis Systems as102"
+	help
+	  Firmware file for Abilis Systems single DVB-T receiver as102
+
 config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	bool "DiBcom dib0700"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9826de5..10f8a25 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -197,6 +197,11 @@ LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.xc5000
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AS102),y)
+LINUX_FIRMWARE_FILES += as102_data1_st.hex as102_data2_st.hex
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Abilis
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_DIB0700),y)
 LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
-- 
1.9.1
