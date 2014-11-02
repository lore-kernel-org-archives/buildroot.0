From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Nov 2014 21:46:41 +0100
Subject: [Buildroot] [git commit] linux-firmware: add option for realtek
	8169 gigabit nic firmware
Message-ID: <20141102210450.17D59B2DF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99e149d7078c441a782ebbe72e268c2ecbbaed96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by E.G. minnowboard max.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |   19 +++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 8b71dd3..9e1eb91 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -208,6 +208,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	help
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169
+	bool "Realtek 8169"
+	help
+	  Firmware files for Realtek 8169 gigabit ethernet cards
+
 endmenu
 
 menu "DVB firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index b435199..5b8d214 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -221,6 +221,25 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169),y)
+LINUX_FIRMWARE_FILES += \
+	rtl_nic/rtl8168d-1.fw \
+	rtl_nic/rtl8168d-2.fw \
+	rtl_nic/rtl8168e-1.fw \
+	rtl_nic/rtl8168e-2.fw \
+	rtl_nic/rtl8168e-3.fw \
+	rtl_nic/rtl8168f-1.fw \
+	rtl_nic/rtl8168f-2.fw \
+	rtl_nic/rtl8105e-1.fw \
+	rtl_nic/rtl8402-1.fw \
+	rtl_nic/rtl8411-1.fw \
+	rtl_nic/rtl8411-2.fw \
+	rtl_nic/rtl8106e-1.fw \
+	rtl_nic/rtl8106e-2.fw \
+	rtl_nic/rtl8168g-2.fw \
+	rtl_nic/rtl8168g-3.fw
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_XCx000),y)
 LINUX_FIRMWARE_FILES += dvb-fe-xc4000-1.4.1.fw \
 			dvb-fe-xc5000-1.6.114.fw \
