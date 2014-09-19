From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:14:58 +0200
Subject: [Buildroot] [PATCH 08/14] package/linux-firmware: add option to
	isntall Abilis Systems DVB-T as102
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <7cb50472e3a1228d0738bd8dee7c9c28bab1e5fc.1411161197.git.yann.morin.1998@free.fr>
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
index a068acb..724fe49 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -173,6 +173,11 @@ endmenu
 
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
index 9febad4..94fd5b5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -196,6 +196,11 @@ LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
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
