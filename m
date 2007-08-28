From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 14:09:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hostap
Message-ID: <20070828210924.69A93A65B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 14:09:23 -0700 (Tue, 28 Aug 2007)
New Revision: 19722

Log:
Use correct hostap source, deprecate package due to inclusion in linux kernel

Modified:
   trunk/buildroot/package/hostap/Config.in
   trunk/buildroot/package/hostap/hostap.mk


Changeset:
Modified: trunk/buildroot/package/hostap/Config.in
===================================================================
--- trunk/buildroot/package/hostap/Config.in	2007-08-28 21:07:32 UTC (rev 19721)
+++ trunk/buildroot/package/hostap/Config.in	2007-08-28 21:09:23 UTC (rev 19722)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOSTAP
 	bool "hostap"
 	default n
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_PCMCIA
 	help
 	  Linux driver for wireless LAN cards based on Intersil's 

Modified: trunk/buildroot/package/hostap/hostap.mk
===================================================================
--- trunk/buildroot/package/hostap/hostap.mk	2007-08-28 21:07:32 UTC (rev 19721)
+++ trunk/buildroot/package/hostap/hostap.mk	2007-08-28 21:09:23 UTC (rev 19722)
@@ -1,10 +1,15 @@
 #############################################################
 #
 # hostap
+# 
+# Note! Host AP driver was added into the main kernel tree in Linux v2.6.14. 
+# The version in the kernel tree should be used instead of this external hostap-driver package. 
+# The external releases are only for older kernel versions and all
+# the future development will be in the main kernel tree.
 #
 #############################################################
-HOSTAP_VERSION=0.5.8
-HOSTAP_SOURCE=hostapd-$(HOSTAP_VERSION).tar.gz
+HOSTAP_VERSION=0.4.9
+HOSTAP_SOURCE=hostap-driver-$(HOSTAP_VERSION).tar.gz
 HOSTAP_SITE=http://hostap.epitest.fi/releases
 HOSTAP_DIR=$(BUILD_DIR)/hostapd-$(HOSTAP_VERSION)
 
