From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:52:19 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
	Abilis Systems DVB-T as102
Message-ID: <20140921175639.C4E749D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=855bfbf98296a68b48984096c818b472ff9bb8a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 6c9b04b..0c9f14e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -163,6 +163,11 @@ endmenu
 
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
index f42709c..e9bb1fa 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -191,6 +191,11 @@ LINUX_FIRMWARE_FILES += dvb-fe-xc5000-1.6.114.fw
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
