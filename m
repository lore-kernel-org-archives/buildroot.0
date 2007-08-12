From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 17:21:22 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9260dfc
Message-ID: <20070812002122.6E155A65CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 17:21:22 -0700 (Sat, 11 Aug 2007)
New Revision: 19454

Log:
Update linux cfg for at91sam9260dfc

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-08-12 00:14:58 UTC (rev 19453)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-08-12 00:21:22 UTC (rev 19454)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.22.1
-# Wed Jul 18 00:14:34 2007
+# Sun Aug 12 02:16:19 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -165,7 +165,6 @@
 # AT91SAM9260 / AT91SAM9XE Board Type
 #
 CONFIG_MACH_AT91SAM9260EK=y
-# CONFIG_MACH_CAM60 is not set
 
 #
 # AT91 Board Options
@@ -177,7 +176,6 @@
 # AT91 Feature Selections
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
-CONFIG_ATMEL_TCLIB=y
 
 #
 # Processor Type
@@ -480,6 +478,8 @@
 CONFIG_BLK_DEV_RAM_COUNT=16
 CONFIG_BLK_DEV_RAM_SIZE=15360
 CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
+# CONFIG_LZMA_INITRD is not set
+# CONFIG_LZMA_INITRAM_FS is not set
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 
@@ -713,15 +713,15 @@
 #
 # I2C Hardware Bus support
 #
+CONFIG_I2C_ATMELTWI=y
+CONFIG_I2C_ATMELTWI_BAUDRATE=100000
 CONFIG_I2C_AT91=y
-CONFIG_I2C_AT91_CLOCKRATE=100000
 # CONFIG_I2C_GPIO is not set
 # CONFIG_I2C_OCORES is not set
 # CONFIG_I2C_PARPORT_LIGHT is not set
 # CONFIG_I2C_SIMTEC is not set
 # CONFIG_I2C_STUB is not set
 # CONFIG_I2C_TINY_USB is not set
-# CONFIG_I2C_PCA is not set
 
 #
 # Miscellaneous I2C Chip support
@@ -811,6 +811,7 @@
 #
 # Misc devices
 #
+CONFIG_ATMEL_SSC=y
 
 #
 # Multifunction device drivers
@@ -826,6 +827,7 @@
 #
 # LED drivers
 #
+CONFIG_LEDS_GPIO=y
 
 #
 # LED Triggers
@@ -892,6 +894,12 @@
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
@@ -1068,6 +1076,7 @@
 # CONFIG_USB_GADGET_PXA2XX is not set
 # CONFIG_USB_GADGET_GOKU is not set
 # CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
 # CONFIG_USB_GADGET_OMAP is not set
 CONFIG_USB_GADGET_AT91=y
 CONFIG_USB_AT91=y
@@ -1216,6 +1225,7 @@
 CONFIG_JFFS2_RTIME=y
 # CONFIG_JFFS2_RUBIN is not set
 CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_HPFS_FS is not set
 # CONFIG_QNX4FS_FS is not set
@@ -1317,6 +1327,7 @@
 #
 CONFIG_DLM=y
 # CONFIG_DLM_DEBUG is not set
+# CONFIG_AUFS is not set
 
 #
 # Profiling support
