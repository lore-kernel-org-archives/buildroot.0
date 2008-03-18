From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 04:47:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Soekris
Message-ID: <20080318114731.9BD7312CFBF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 04:47:31 -0700 (Tue, 18 Mar 2008)
New Revision: 21388

Log:
Use BOARD_PATH instead of SOEKRIS_NET4801_PATH

Modified:
   trunk/buildroot/target/device/Soekris/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Soekris/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Soekris/Makefile.in	2008-03-18 11:43:00 UTC (rev 21387)
+++ trunk/buildroot/target/device/Soekris/Makefile.in	2008-03-18 11:47:31 UTC (rev 21388)
@@ -10,16 +10,17 @@
 
 endif
 
-SOEKRIS_NET4801_PATH=target/device/Soekris/net4801
+#SOEKRIS_NET4801_PATH=target/device/Soekris/net4801
+BOARD_PATH=target/device/Soekris/net4801
 
 ifeq ($(strip $(BR2_TARGET_SOEKRIS_NET4801)),y)
-UCLIBC_CONFIG_FILE:=$(SOEKRIS_NET4801_PATH)/uClibc.config
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(SOEKRIS_NET4801_PATH)/busybox.config
+UCLIBC_CONFIG_FILE:=$(BOARD_PATH)/uClibc.config
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox.config
 
 ifeq ($(strip $(BR2_PACKAGE_LINUX)),y)
 TARGETS+=linux26
 include target/device/Soekris/soekris_gpio/soekris_gpio.mk
-LINUX26_KCONFIG=$(SOEKRIS_NET4801_PATH)/linux26.config
+LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 endif
 
 endif
