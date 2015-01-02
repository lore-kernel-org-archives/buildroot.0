From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  2 Jan 2015 22:19:26 +0100
Subject: [Buildroot] [PATCH 1/3] package/openocd: explicitly disable
	unselected adapters
Message-ID: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some adapters are automatically enabled, but may not be built because of
missing (archecture) dependencies. So, just set the options symetrically.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openocd/openocd.mk | 58 +++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index b0bcb7e..ad1f95b 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -29,35 +29,35 @@ OPENOCD_DEPENDENCIES = \
 
 # Adapters
 OPENOCD_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_OPENOCD_FTDI),--enable-ftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_STLINK),--enable-stlink) \
-	$(if $(BR2_PACKAGE_OPENOCD_TI_ICDI),--enable-ti-icdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_ULINK),--enable-ulink) \
-	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER2),--enable-usb-blaster-2) \
-	$(if $(BR2_PACKAGE_OPENOCD_JLINK),--enable-jlink) \
-	$(if $(BR2_PACKAGE_OPENOCD_OSDBM),--enable-osbdm) \
-	$(if $(BR2_PACKAGE_OPENOCD_OPENDOUS),--enable-opendous) \
-	$(if $(BR2_PACKAGE_OPENOCD_AICE),--enable-aice) \
-	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink) \
-	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog) \
-	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink) \
-	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew) \
-	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap) \
-	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport) \
-	$(if $(BR2_PACKAGE_OPENOCD_FT2XXX),--enable-legacy-ft2232_libftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi) \
-	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb_blaster_libftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master) \
-	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000) \
-	$(if $(BR2_PACKAGE_OPENOCD_EP93XX),--enable-ep93xx) \
-	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200) \
-	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio) \
-	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012) \
-	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto_libftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag_ftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate) \
-	$(if $(BR2_PACKAGE_OPENOCD_SYSFS),--enable-sysfsgpio)
+	$(if $(BR2_PACKAGE_OPENOCD_FTDI),--enable-ftdi,--disable-ftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_STLINK),--enable-stlink,--disable-stlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_TI_ICDI),--enable-ti-icdi,--disable-ti-icdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_ULINK),--enable-ulink,--disable-ulink) \
+	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER2),--enable-usb-blaster-2,--disable-usb-blaster-2) \
+	$(if $(BR2_PACKAGE_OPENOCD_JLINK),--enable-jlink,--disable-jlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_OSDBM),--enable-osbdm,--disable-osbdm) \
+	$(if $(BR2_PACKAGE_OPENOCD_OPENDOUS),--enable-opendous,--disable-opendous) \
+	$(if $(BR2_PACKAGE_OPENOCD_AICE),--enable-aice,--disable-aice) \
+	$(if $(BR2_PACKAGE_OPENOCD_VSLLINK),--enable-vsllink,--disable-vsllink) \
+	$(if $(BR2_PACKAGE_OPENOCD_USBPROG),--enable-usbprog,--disable-usbprog) \
+	$(if $(BR2_PACKAGE_OPENOCD_RLINK),--enable-rlink,--disable-rlink) \
+	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew,--disable-armjtagew) \
+	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
+	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport,--disable-parport) \
+	$(if $(BR2_PACKAGE_OPENOCD_FT2XXX),--enable-legacy-ft2232_libftdi,--disable-legacy-ft2232_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
+	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb_blaster_libftdi,--disable-usb_blaster_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
+	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master,--disable-zy1000-master) \
+	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000,--disable-zy1000) \
+	$(if $(BR2_PACKAGE_OPENOCD_EP93XX),--enable-ep93xx,--disable-ep93xx) \
+	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
+	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
+	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012,--disable-gw16012) \
+	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto_libftdi,--disable-presto_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag_ftdi,--disable-openjtag_ftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
+	$(if $(BR2_PACKAGE_OPENOCD_SYSFS),--enable-sysfsgpio,--disable-sysfsgpio)
 
 # Enable all configuration options for host build.
 #
-- 
2.2.1
