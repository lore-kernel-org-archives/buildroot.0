From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 15:57:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91sam9260dfc at91sam9260pf at91sam9261 etc...
Message-ID: <20070819225726.0ABDDA611A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 15:57:25 -0700 (Sun, 19 Aug 2007)
New Revision: 19581

Log:
Update linux-2.6.22.1 config for sam9261ek, sam9260pf and sam9260dfc

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf-linux-2.6.22.1.config
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-08-19 22:43:50 UTC (rev 19580)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc-linux-2.6.22.1.config	2007-08-19 22:57:25 UTC (rev 19581)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.22.1
-# Sun Aug 12 02:16:19 2007
+# Sun Aug 19 01:11:28 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -51,7 +51,9 @@
 CONFIG_SYSFS_DEPRECATED=y
 # CONFIG_RELAY is not set
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE=""
+CONFIG_INITRAMFS_SOURCE="/home/ulf/projects/Buildroot/20070817/buildroot-arm/binaries/at91sam9261ek/rootfs.arm.initramfs_list"
+CONFIG_INITRAMFS_ROOT_UID=0
+CONFIG_INITRAMFS_ROOT_GID=0
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_SYSCTL=y
 # CONFIG_EMBEDDED is not set
@@ -165,6 +167,7 @@
 # AT91SAM9260 / AT91SAM9XE Board Type
 #
 CONFIG_MACH_AT91SAM9260EK=y
+# CONFIG_MACH_CAM60 is not set
 
 #
 # AT91 Board Options
@@ -176,6 +179,8 @@
 # AT91 Feature Selections
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_ATMEL_TCLIB=y
+# CONFIG_AT91_FIQ is not set
 
 #
 # Processor Type
@@ -478,8 +483,6 @@
 CONFIG_BLK_DEV_RAM_COUNT=16
 CONFIG_BLK_DEV_RAM_SIZE=15360
 CONFIG_BLK_DEV_RAM_BLOCKSIZE=1024
-# CONFIG_LZMA_INITRD is not set
-# CONFIG_LZMA_INITRAM_FS is not set
 # CONFIG_CDROM_PKTCDVD is not set
 # CONFIG_ATA_OVER_ETH is not set
 
@@ -716,12 +719,14 @@
 CONFIG_I2C_ATMELTWI=y
 CONFIG_I2C_ATMELTWI_BAUDRATE=100000
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
@@ -1152,6 +1157,7 @@
 #
 # on-CPU RTC drivers
 #
+CONFIG_RTC_DRV_AT91SAM926X=y
 
 #
 # File systems
@@ -1225,7 +1231,6 @@
 CONFIG_JFFS2_RTIME=y
 # CONFIG_JFFS2_RUBIN is not set
 CONFIG_CRAMFS=y
-# CONFIG_SQUASHFS is not set
 # CONFIG_VXFS_FS is not set
 # CONFIG_HPFS_FS is not set
 # CONFIG_QNX4FS_FS is not set
@@ -1327,7 +1332,6 @@
 #
 CONFIG_DLM=y
 # CONFIG_DLM_DEBUG is not set
-# CONFIG_AUFS is not set
 
 #
 # Profiling support

Modified: trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf-linux-2.6.22.1.config	2007-08-19 22:43:50 UTC (rev 19580)
+++ trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf-linux-2.6.22.1.config	2007-08-19 22:57:25 UTC (rev 19581)
@@ -176,6 +176,8 @@
 # AT91 Feature Selections
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
+CONFIG_ATMEL_TCLIB=y
+# CONFIG_AT91_FIQ is not set
 
 #
 # Processor Type

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-08-19 22:43:50 UTC (rev 19580)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-08-19 22:57:25 UTC (rev 19581)
@@ -172,7 +172,9 @@
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
 CONFIG_ATMEL_TCLIB=y
+# CONFIG_AT91_FIQ is not set
 
+
 #
 # Processor Type
 #
