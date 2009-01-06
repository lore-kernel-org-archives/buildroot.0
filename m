From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 16:24:43 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090106162443.AFDE376BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 16:24:42 +0000 (Tue, 06 Jan 2009)
New Revision: 24706

Log:
Add CONFIGs for new commands to at91 parts

Added:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch


Changeset:
Added: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch	                        (rev 0)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-013-configs.patch	2009-01-06 16:24:42 UTC (rev 24706)
@@ -0,0 +1,130 @@
+diff -urN u-boot-2009.01-0rig//include/configs/at91cap9adk.h u-boot-2009.01/include/configs/at91cap9adk.h
+--- u-boot-2009.01-0rig//include/configs/at91cap9adk.h	2008-12-16 23:48:27.000000000 +0100
++++ u-boot-2009.01/include/configs/at91cap9adk.h	2009-01-04 00:43:58.000000000 +0100
+@@ -69,7 +69,9 @@
+ #define CONFIG_ATMEL_LCD		1
+ #define CONFIG_ATMEL_LCD_BGR555		1
+ #define CONFIG_SYS_CONSOLE_IS_IN_ENV		1
+-
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ #define CONFIG_BOOTDELAY	3
+ 
+ /*
+diff -urN u-boot-2009.01-0rig//include/configs/at91rm9200df.h u-boot-2009.01/include/configs/at91rm9200df.h
+--- u-boot-2009.01-0rig//include/configs/at91rm9200df.h	2009-01-02 17:37:43.000000000 +0100
++++ u-boot-2009.01/include/configs/at91rm9200df.h	2009-01-04 00:43:33.000000000 +0100
+@@ -123,6 +123,9 @@
+ #define CONFIG_CMD_DHCP
+ #define CONFIG_CMD_MII
+ #define CONFIG_CMD_NAND
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ #define CONFIG_CMD_AT91_SPIMUX
+ #define CONFIG_CMD_ETHINIT
+ 
+diff -urN u-boot-2009.01-0rig//include/configs/at91rm9200dk_df.h u-boot-2009.01/include/configs/at91rm9200dk_df.h
+--- u-boot-2009.01-0rig//include/configs/at91rm9200dk_df.h	2009-01-02 10:03:11.000000000 +0100
++++ u-boot-2009.01/include/configs/at91rm9200dk_df.h	2009-01-04 00:42:52.000000000 +0100
+@@ -122,7 +122,11 @@
+ #define CONFIG_CMD_DHCP
+ #define CONFIG_CMD_MII
+ #define CONFIG_CMD_NAND
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ #define CONFIG_CMD_AT91_SPIMUX
++#define CONFIG_CMD_ETHINIT
+ 
+ #define CONFIG_NAND_LEGACY
+ 
+diff -urN u-boot-2009.01-0rig//include/configs/at91rm9200dk.h u-boot-2009.01/include/configs/at91rm9200dk.h
+--- u-boot-2009.01-0rig//include/configs/at91rm9200dk.h	2009-01-02 10:03:11.000000000 +0100
++++ u-boot-2009.01/include/configs/at91rm9200dk.h	2009-01-04 00:43:15.000000000 +0100
+@@ -120,7 +120,11 @@
+ #define CONFIG_CMD_DHCP
+ #define CONFIG_CMD_MII
+ #define CONFIG_CMD_NAND
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ #define CONFIG_CMD_AT91_SPIMUX
++#define CONFIG_CMD_ETHINIT
+ 
+ #define CONFIG_NAND_LEGACY
+ 
+diff -urN u-boot-2009.01-0rig//include/configs/at91rm9200ek.h u-boot-2009.01/include/configs/at91rm9200ek.h
+--- u-boot-2009.01-0rig//include/configs/at91rm9200ek.h	2009-01-02 17:37:43.000000000 +0100
++++ u-boot-2009.01/include/configs/at91rm9200ek.h	2009-01-04 00:42:35.000000000 +0100
+@@ -121,9 +121,11 @@
+ #define CONFIG_CMD_DHCP
+ #define CONFIG_CMD_MII
+ #define CONFIG_CMD_NAND
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ #define CONFIG_CMD_AT91_SPIMUX
+ #define CONFIG_CMD_ETHINIT
+-
+ #define CONFIG_NAND_LEGACY
+ 
+ #define CONFIG_SYS_MAX_NAND_DEVICE	1	/* Max number of NAND devices		*/
+diff -urN u-boot-2009.01-0rig//include/configs/at91sam9260ek.h u-boot-2009.01/include/configs/at91sam9260ek.h
+--- u-boot-2009.01-0rig//include/configs/at91sam9260ek.h	2008-12-16 23:48:27.000000000 +0100
++++ u-boot-2009.01/include/configs/at91sam9260ek.h	2009-01-04 00:41:56.000000000 +0100
+@@ -74,10 +74,13 @@
+ #include <config_cmd_default.h>
+ #undef CONFIG_CMD_BDI
+ #undef CONFIG_CMD_IMI
+-#undef CONFIG_CMD_AUTOSCRIPT
++#define CONFIG_CMD_AUTOSCRIPT
+ #undef CONFIG_CMD_FPGA
+ #undef CONFIG_CMD_LOADS
+ #undef CONFIG_CMD_IMLS
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ 
+ #define CONFIG_CMD_PING		1
+ #define CONFIG_CMD_DHCP		1
+diff -urN u-boot-2009.01-0rig//include/configs/at91sam9261ek.h u-boot-2009.01/include/configs/at91sam9261ek.h
+--- u-boot-2009.01-0rig//include/configs/at91sam9261ek.h	2008-12-16 23:48:27.000000000 +0100
++++ u-boot-2009.01/include/configs/at91sam9261ek.h	2009-01-04 00:44:11.000000000 +0100
+@@ -68,6 +68,9 @@
+ #define CONFIG_ATMEL_LCD		1
+ #define CONFIG_ATMEL_LCD_BGR555		1
+ #define CONFIG_SYS_CONSOLE_IS_IN_ENV		1
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ 
+ #define CONFIG_BOOTDELAY	3
+ 
+diff -urN u-boot-2009.01-0rig//include/configs/at91sam9263ek.h u-boot-2009.01/include/configs/at91sam9263ek.h
+--- u-boot-2009.01-0rig//include/configs/at91sam9263ek.h	2008-12-16 23:48:27.000000000 +0100
++++ u-boot-2009.01/include/configs/at91sam9263ek.h	2009-01-04 00:44:34.000000000 +0100
+@@ -69,6 +69,9 @@
+ #define CONFIG_ATMEL_LCD		1
+ #define CONFIG_ATMEL_LCD_BGR555		1
+ #define CONFIG_SYS_CONSOLE_IS_IN_ENV		1
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ 
+ #define CONFIG_BOOTDELAY	3
+ 
+diff -urN u-boot-2009.01-0rig//include/configs/at91sam9rlek.h u-boot-2009.01/include/configs/at91sam9rlek.h
+--- u-boot-2009.01-0rig//include/configs/at91sam9rlek.h	2008-12-16 23:48:27.000000000 +0100
++++ u-boot-2009.01/include/configs/at91sam9rlek.h	2009-01-04 00:44:54.000000000 +0100
+@@ -68,6 +68,9 @@
+ #define CONFIG_ATMEL_LCD		1
+ #define CONFIG_ATMEL_LCD_RGB565		1
+ #define CONFIG_SYS_CONSOLE_IS_IN_ENV		1
++#define CONFIG_CMD_FACTORY
++#define CONFIG_CMD_LED
++#define CONFIG_COLOURED_LED
+ 
+ #define CONFIG_BOOTDELAY	3
+ 
