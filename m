From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 26 Feb 2009 20:57:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: avahi dnsmasq
Message-ID: <20090226205730.A54E97669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-26 20:57:29 +0000 (Thu, 26 Feb 2009)
New Revision: 25467

Log:
avahi/dnsmasq: adjust dbus dep after Makefile.autotools.in conversion

Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-02-26 12:49:14 UTC (rev 25466)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-02-26 20:57:29 UTC (rev 25467)
@@ -37,7 +37,7 @@
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
 AVAHI_DISABLE_DBUS:=
-AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/bin/dbus-daemon
+AVAHI_EXTRA_DEPS+=dbus
 else
 AVAHI_DISABLE_DBUS:=--disable-dbus
 endif

Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2009-02-26 12:49:14 UTC (rev 25466)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2009-02-26 20:57:29 UTC (rev 25467)
@@ -26,7 +26,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
-DNSMASQ_DBUS:=$(TARGET_DIR)/usr/bin/dbus-daemon
+DNSMASQ_DBUS:=dbus
 else
 DNSMASQ_DBUS:=
 endif
