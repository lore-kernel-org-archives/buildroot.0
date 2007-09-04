From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 09:21:58 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9261ek
Message-ID: <20070904162158.6C603A69ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 09:21:57 -0700 (Tue, 04 Sep 2007)
New Revision: 19780

Log:
update sam9261 default linux config

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-09-04 16:21:22 UTC (rev 19779)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek-linux-2.6.22.1.config	2007-09-04 16:21:57 UTC (rev 19780)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.22.1
-# Fri Aug 17 02:01:16 2007
+# Tue Sep  4 16:19:01 2007
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y
@@ -171,10 +171,7 @@
 # AT91 Feature Selections
 #
 CONFIG_AT91_PROGRAMMABLE_CLOCKS=y
-CONFIG_ATMEL_TCLIB=y
-# CONFIG_AT91_FIQ is not set
 
-
 #
 # Processor Type
 #
@@ -298,7 +295,7 @@
 # CONFIG_INET_ESP is not set
 # CONFIG_INET_IPCOMP is not set
 # CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
+CONFIG_INET_TUNNEL=y
 CONFIG_INET_XFRM_MODE_TRANSPORT=y
 CONFIG_INET_XFRM_MODE_TUNNEL=y
 CONFIG_INET_XFRM_MODE_BEET=y
@@ -308,9 +305,23 @@
 CONFIG_TCP_CONG_CUBIC=y
 CONFIG_DEFAULT_TCP_CONG="cubic"
 # CONFIG_TCP_MD5SIG is not set
-# CONFIG_IPV6 is not set
+CONFIG_IPV6=y
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+# CONFIG_INET6_AH is not set
+# CONFIG_INET6_ESP is not set
+# CONFIG_INET6_IPCOMP is not set
+# CONFIG_IPV6_MIP6 is not set
 # CONFIG_INET6_XFRM_TUNNEL is not set
 # CONFIG_INET6_TUNNEL is not set
+CONFIG_INET6_XFRM_MODE_TRANSPORT=y
+CONFIG_INET6_XFRM_MODE_TUNNEL=y
+CONFIG_INET6_XFRM_MODE_BEET=y
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=y
+# CONFIG_IPV6_TUNNEL is not set
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
 # CONFIG_NETLABEL is not set
 # CONFIG_NETWORK_SECMARK is not set
 # CONFIG_NETFILTER is not set
@@ -715,16 +726,13 @@
 #
 # I2C Hardware Bus support
 #
-# CONFIG_I2C_ATMELTWI is not set
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
@@ -814,7 +822,6 @@
 #
 # Misc devices
 #
-# CONFIG_ATMEL_SSC is not set
 
 #
 # Multifunction device drivers
@@ -830,7 +837,6 @@
 #
 # LED drivers
 #
-# CONFIG_LEDS_GPIO is not set
 
 #
 # LED Triggers
@@ -877,11 +883,9 @@
 #
 # Frame buffer hardware drivers
 #
-# CONFIG_FB_S1D15605 is not set
 # CONFIG_FB_S1D13XXX is not set
 CONFIG_FB_ATMEL=y
 # CONFIG_FB_INTSRAM is not set
-# CONFIG_FB_ATMEL_STN is not set
 # CONFIG_FB_VIRTUAL is not set
 
 #
@@ -940,10 +944,6 @@
 #
 
 #
-# SPI devices
-#
-
-#
 # USB devices
 #
 # CONFIG_SND_USB_AUDIO is not set
@@ -1120,7 +1120,6 @@
 # CONFIG_USB_GADGET_PXA2XX is not set
 # CONFIG_USB_GADGET_GOKU is not set
 # CONFIG_USB_GADGET_LH7A40X is not set
-# CONFIG_USB_GADGET_ATMEL_USBA is not set
 # CONFIG_USB_GADGET_OMAP is not set
 CONFIG_USB_GADGET_AT91=y
 CONFIG_USB_AT91=y
