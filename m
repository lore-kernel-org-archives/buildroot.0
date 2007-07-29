From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:34:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9260dfc at91sam9261e etc...
Message-ID: <20070729073413.A9BA6A6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:34:13 -0700 (Sun, 29 Jul 2007)
New Revision: 19322

Log:
Use 1.6.0 config file for AT91 targets

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-07-29 07:32:44 UTC (rev 19321)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in	2007-07-29 07:34:13 UTC (rev 19322)
@@ -1,5 +1,10 @@
 ifeq ($(strip$(BOARD_NAME)),at91rm9200df)
 LINUX_BOARD_NAME=at91rm9200ek
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
 
 
+ifeq ($(strip$(BOARD_NAME)),at91rm9200ek)
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
+endif
+

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2007-07-29 07:32:44 UTC (rev 19321)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in	2007-07-29 07:34:13 UTC (rev 19322)
@@ -1,5 +1,6 @@
 ifeq ($(strip$(BOARD_NAME)),at91sam9260dfc)
 LINUX26_BOARD_NAME=at91sam9260ek
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
 
 

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in	2007-07-29 07:32:44 UTC (rev 19321)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in	2007-07-29 07:34:13 UTC (rev 19322)
@@ -1,2 +1,3 @@
 ifeq ($(strip $(BOARD_NAME)),at91sam9261ek)
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in	2007-07-29 07:32:44 UTC (rev 19321)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in	2007-07-29 07:34:13 UTC (rev 19322)
@@ -1,2 +1,3 @@
 ifeq ($(strip $(BOARD_NAME)),at91sam9263ek)
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-1.6.0.config
 endif
