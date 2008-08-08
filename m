From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  8 Aug 2008 11:15:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080808181530.772AB3C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-08 11:15:29 -0700 (Fri, 08 Aug 2008)
New Revision: 23071

Log:
dnsmasq: bump version

fixes dns spoofing vulnerability.

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-08-08 07:28:16 UTC (rev 23070)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-08-08 18:15:29 UTC (rev 23071)
@@ -5,7 +5,7 @@
 #############################################################
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-DNSMASQ_UPVER:=2.41
+DNSMASQ_UPVER:=2.45
 DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
 DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
 DNSMASQ_BINARY:=dnsmasq
@@ -21,6 +21,10 @@
 DNSMASQ_COPTS+=-DNO_TFTP
 endif
 
+ifneq ($(BR2_LARGEFILE),y)
+DNSMASQ_COPTS+=-DNO_LARGEFILE
+endif
+
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 DNSMASQ_DBUS:=$(TARGET_DIR)/usr/bin/dbus-daemon
 else
