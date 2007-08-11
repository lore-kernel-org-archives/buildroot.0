From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:09:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9260dfc at91sam9261e etc...
Message-ID: <20070811230935.7FE93A606F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:09:34 -0700 (Sat, 11 Aug 2007)
New Revision: 19446

Log:
Cleanup Atmel boards

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,10 +1,10 @@
-ifeq ($(strip$(BOARD_NAME)),at91rm9200df)
+ifeq ($(BOARD_NAME),at91rm9200df)
 LINUX_BOARD_NAME=at91rm9200ek
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
 
 
-ifeq ($(strip$(BOARD_NAME)),at91rm9200ek)
+ifeq ($(BOARD_NAME),at91rm9200ek)
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,6 +1,4 @@
-ifeq ($(strip$(BOARD_NAME)),at91sam9260dfc)
+ifeq ($(BOARD_NAME),at91sam9260dfc)
 LINUX26_BOARD_NAME=at91sam9260ek
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
-
-

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,3 +1,3 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9261ek)
+ifeq ($(BOARD_NAME),at91sam9261ek)
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,3 +1,3 @@
-ifeq ($(strip $(BOARD_NAME)),at91sam9263ek)
+ifeq ($(BOARD_NAME),at91sam9263ek)
 BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif

Modified: trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/atngw100/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,12 +1,12 @@
-ATNGW100_PATH=target/device/Atmel/atngw100
-
+ifeq ($(BOARD_NAME),atngw100)
 #BR2_PACKAGE_BUSYBOX_CONFIG=$(ATNGW100_PATH)/busybox.config
 #UCLIBC_CONFIG_FILE=target/device/Atmel/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(ATNGW100_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(ATNGW100_PATH)/device_table.txt
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
+TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 
 ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
 #LINUX26_FORMAT=uImage
-#LINUX26_KCONFIG=$(ATNGW100_PATH)/linux26.config
+#LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
+endif

Modified: trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in	2007-08-11 23:03:04 UTC (rev 19445)
+++ trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in	2007-08-11 23:09:34 UTC (rev 19446)
@@ -1,12 +1,12 @@
-ATSTK1002_PATH=target/device/Atmel/atstk1002
-
+ifeq ($(BOARD_NAME),atstk1002)
 #BR2_PACKAGE_BUSYBOX_CONFIG=$(ATSTK1000_PATH)/busybox.config
 #UCLIBC_CONFIG_FILE=target/device/Atmel/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(ATSTK1002_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(ATSTK1002_PATH)/device_table.txt
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
+TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 
 ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
 #LINUX26_FORMAT=uImage
-#LINUX26_KCONFIG=$(ATSTK1000_PATH)/linux26.atstk1002.config
+#LINUX26_KCONFIG=$(BOARD_PATH)/linux26.atstk1002.config
 endif
+endif
