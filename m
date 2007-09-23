From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 03:03:27 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9261ek
Message-ID: <20070923100327.CE0E830076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 03:03:27 -0700 (Sun, 23 Sep 2007)
New Revision: 19961

Log:
Update SAM9261EK linux config

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-09-23 09:58:47 UTC (rev 19960)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-09-23 10:03:27 UTC (rev 19961)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.22.1
-# Tue Sep  4 16:19:01 2007
+# Sun Sep 23 06:48:01 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -51,7 +51,9 @@
 CONFIG_SYSFS_DEPRECATED=y
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
+CONFIG_INITRAMFS_SOURCE="/home/ulf/projects/Buildroot/20070922/buildroot/binaries/at91sam9261ek/rootfs.arm-20070923.initramfs_list"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
 # CONFIG_EMBEDDED is not set
@@ -171,6 +173,7 @@
 # AT91 Feature Selections
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_ATMEL_TCLIB=y
 
 #
 # Processor Type
@@ -726,13 +729,17 @@
 #
 # I2C Hardware Bus support
 #
+CONFIG_I2C_ATMELTWI=y
+CONFIG_I2C_ATMELTWI_BAUDRATE=100000
 CONFIG_I2C_AT91=y
+CONFIG_I2C_AT91_CLOCKRATE=100000
 # CONFIG_I2C_GPIO is not set
 # CONFIG_I2C_OCORES is not set
 # CONFIG_I2C_PARPORT_LIGHT is not set
 # CONFIG_I2C_SIMTEC is not set
 # CONFIG_I2C_STUB is not set
 # CONFIG_I2C_TINY_USB is not set
+# CONFIG_I2C_PCA is not set
 
 #
 # Miscellaneous I2C Chip support
@@ -822,6 +829,7 @@
 #
 # Misc devices
 #
+CONFIG_ATMEL_SSC=y
 
 #
 # Multifunction device drivers
@@ -837,6 +845,7 @@
 #
 # LED drivers
 #
+CONFIG_LEDS_GPIO=y
 
 #
 # LED Triggers
@@ -883,9 +892,11 @@
 #
 # Frame buffer hardware drivers
 #
+# CONFIG_FB_S1D15605 is not set
 # CONFIG_FB_S1D13XXX is not set
 CONFIG_FB_ATMEL=y
 # CONFIG_FB_INTSRAM is not set
+# CONFIG_FB_ATMEL_STN is not set
 # CONFIG_FB_VIRTUAL is not set
 
 #
@@ -944,6 +955,12 @@
 #
 
 #
+# SPI devices
+#
+CONFIG_SND_AT73C213=y
+CONFIG_SND_AT73C213_TARGET_BITRATE=48000
+
+#
 # USB devices
 #
 # CONFIG_SND_USB_AUDIO is not set
@@ -1120,6 +1137,7 @@
 # CONFIG_USB_GADGET_PXA2XX is not set
 # CONFIG_USB_GADGET_GOKU is not set
 # CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
 # CONFIG_USB_GADGET_OMAP is not set
 CONFIG_USB_GADGET_AT91=y
 CONFIG_USB_AT91=y
