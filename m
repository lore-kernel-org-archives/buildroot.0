From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:52:19 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
	ITEtech it9135 firmware
Message-ID: <20140921175639.D577E9D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6465111569588826a610e81fbf28ed50f30a869
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    5 +++++
 package/linux-firmware/linux-firmware.mk |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 0c9f14e..18360b7 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -173,6 +173,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_DIB0700
 	help
 	  Firmware file for dib0700-based USB DVB tuner driver
 
+config BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135
+	bool "ITEtech it9135"
+	help
+	  Firmware files for ITEtech it9135 (Ax and Bx) DVB-T USB tuner
+
 config BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK
 	bool "Terratec H5 DRX-K"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e9bb1fa..311ece0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -201,6 +201,11 @@ LINUX_FIRMWARE_FILES += dvb-usb-dib0700-1.20.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.dib0700
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ITETECH_IT9135),y)
+LINUX_FIRMWARE_FILES += dvb-usb-it9135-01.fw dvb-usb-it9135-02.fw
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.it913x
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_H5_DRXK),y)
 LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
 # No license file; the license is in the file WHENCE
