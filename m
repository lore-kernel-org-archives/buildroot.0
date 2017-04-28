From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Fri, 28 Apr 2017 14:34:34 +0000
Subject: [Buildroot] [PATCH v2] openocd: bump to 0.10.0
In-Reply-To: <1493364505-17299-1-git-send-email-christophe.priouzeau@st.com>
References: <1493364505-17299-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <1493390072-10443-1-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
Changes v1 -> v2:
  - align configuration flags (suggested by Peter Korsgaard)

 package/openocd/Config.in    |  8 --------
 package/openocd/openocd.hash |  6 +++---
 package/openocd/openocd.mk   | 15 +++++++--------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 2313671..41c2fc5 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -123,14 +123,6 @@ config BR2_PACKAGE_OPENOCD_PARPORT
 	help
 	  Enable building the pc parallel port driver
 
-config BR2_PACKAGE_OPENOCD_FT2XXX
-	bool "FT2232 based devices (DEPRECATED)"
-	select BR2_PACKAGE_LIBFTDI1
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
-	help
-	  (DEPRECATED) Enable building support for FT2232
-	  based devices using the libftdi library
-
 config BR2_PACKAGE_OPENOCD_VPI
 	bool "JTAG VPI"
 	help
diff --git a/package/openocd/openocd.hash b/package/openocd/openocd.hash
index 4ca11e2..b36c816 100644
--- a/package/openocd/openocd.hash
+++ b/package/openocd/openocd.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/openocd/files/openocd/0.9.0/
-sha1 bcf99bb21f09513065b2c9ece148ace7d16cdd0c openocd-0.9.0.tar.bz2
-md5 665cc98ae9e7297e09ec6ac7235fee49 openocd-0.9.0.tar.bz2
+# From http://sourceforge.net/projects/openocd/files/openocd/0.10.0/
+sha1 3245d43d60a1a93f8b0f6b1ce20b53e38cab7a4a  openocd-0.10.0.tar.bz2
+md5 b412bdef0481a3859c6585eb69f6f6ba  openocd-0.10.0.tar.bz2
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 911d311..63201ee 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENOCD_VERSION = 0.9.0
+OPENOCD_VERSION = 0.10.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 
@@ -45,9 +45,8 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_ARMEW),--enable-armjtagew,--disable-armjtagew) \
 	$(if $(BR2_PACKAGE_OPENOCD_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
 	$(if $(BR2_PACKAGE_OPENOCD_PARPORT),--enable-parport,--disable-parport) \
-	$(if $(BR2_PACKAGE_OPENOCD_FT2XXX),--enable-legacy-ft2232_libftdi,--disable-legacy-ft2232_libftdi) \
 	$(if $(BR2_PACKAGE_OPENOCD_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
-	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb_blaster_libftdi,--disable-usb_blaster_libftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_UBLASTER),--enable-usb-blaster,--disable-usb-blaster) \
 	$(if $(BR2_PACKAGE_OPENOCD_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
 	$(if $(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),--enable-zy1000-master,--disable-zy1000-master) \
 	$(if $(BR2_PACKAGE_OPENOCD_ZY1000),--enable-zy1000,--disable-zy1000) \
@@ -55,8 +54,8 @@ OPENOCD_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_OPENOCD_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
 	$(if $(BR2_PACKAGE_OPENOCD_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
 	$(if $(BR2_PACKAGE_OPENOCD_GW16012),--enable-gw16012,--disable-gw16012) \
-	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto_libftdi,--disable-presto_libftdi) \
-	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag_ftdi,--disable-openjtag_ftdi) \
+	$(if $(BR2_PACKAGE_OPENOCD_PRESTO),--enable-presto,--disable-presto) \
+	$(if $(BR2_PACKAGE_OPENOCD_OPENJTAG),--enable-openjtag,--disable-openjtag) \
 	$(if $(BR2_PACKAGE_OPENOCD_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
 	$(if $(BR2_PACKAGE_OPENOCD_SYSFS),--enable-sysfsgpio,--disable-sysfsgpio)
 
@@ -82,11 +81,11 @@ HOST_OPENOCD_CONF_OPTS = \
 	--enable-armjtagew \
 	--enable-parport \
 	--enable-jtag_vpi \
-	--enable-usb_blaster_libftdi \
+	--enable-usb-blaster \
 	--enable-amtjtagaccel \
 	--enable-gw16012 \
-	--enable-presto_libftdi \
-	--enable-openjtag_ftdi \
+	--enable-presto \
+	--enable-openjtag \
 	--enable-buspirate \
 	--enable-sysfsgpio \
 	--oldincludedir=$(HOST_DIR)/usr/include \
-- 
2.7.4
