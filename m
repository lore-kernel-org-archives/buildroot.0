From: Brian Beattie <beattie@beattie-home.net>
Date: Sat, 12 Jul 2008 12:20:29 -0700
Subject: [Buildroot] patch to kb9202 linux-2.6.24 kernel config
Message-ID: <1215890429.6308.43.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the default kernel config for kb9202
"target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config" to enable the
optional LCD panel supplied by KwikByte.
------------------ patch ----------------------------------
Index: target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config
===================================================================
--- target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config	(revision
22816)
+++ target/device/KwikByte/kb9202/kb9202-linux-2.6.24.config	(working
copy)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.24
-# Wed Jun 18 14:34:22 2008
+# Sat Jul 12 12:17:36 2008
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -190,7 +190,7 @@
 # AT91 Feature Selections
 #
 # CONFIG_AT91_PROGRAMMABLE_CLOCKS is not set
-CONFIG_AT91_TIMER_HZ=128
+CONFIG_AT91_TIMER_HZ=100
 CONFIG_AT91_EARLY_DBGU=y
 # CONFIG_AT91_EARLY_USART0 is not set
 # CONFIG_AT91_EARLY_USART1 is not set
@@ -237,7 +237,7 @@
 # CONFIG_HIGH_RES_TIMERS is not set
 CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
 # CONFIG_PREEMPT is not set
-CONFIG_HZ=128
+CONFIG_HZ=100
 # CONFIG_AEABI is not set
 # CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
 CONFIG_SELECT_MEMORY_MODEL=y
@@ -463,7 +463,6 @@
 # CONFIG_MTD_DOC2000 is not set
 # CONFIG_MTD_DOC2001 is not set
 # CONFIG_MTD_DOC2001PLUS is not set
-# CONFIG_MTD_AT91_DATAFLASH is not set
 CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_VERIFY_WRITE=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
@@ -678,8 +677,7 @@
 # CONFIG_R3964 is not set
 # CONFIG_RAW_DRIVER is not set
 # CONFIG_TCG_TPM is not set
-CONFIG_AT91_SPI=y
-# CONFIG_AT91_SPIDEV is not set
+# CONFIG_AT91_SPI is not set
 # CONFIG_I2C is not set
 
 #
@@ -718,9 +716,9 @@
 CONFIG_FB=y
 # CONFIG_FIRMWARE_EDID is not set
 # CONFIG_FB_DDC is not set
-CONFIG_FB_CFB_FILLRECT=m
-CONFIG_FB_CFB_COPYAREA=m
-CONFIG_FB_CFB_IMAGEBLIT=m
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
 # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
 # CONFIG_FB_SYS_FILLRECT is not set
 # CONFIG_FB_SYS_COPYAREA is not set
@@ -736,7 +734,7 @@
 #
 # Frame buffer hardware drivers
 #
-CONFIG_FB_S1D15605=m
+CONFIG_FB_S1D15605=y
 # CONFIG_FB_S1D13XXX is not set
 # CONFIG_FB_VIRTUAL is not set
 CONFIG_BACKLIGHT_LCD_SUPPORT=y

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
