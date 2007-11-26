From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Nov 2007 05:02:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20071126130221.D9F7030063@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-11-26 05:02:21 -0800 (Mon, 26 Nov 2007)
New Revision: 20543

Log:
Install dbus before avahi so dbus directories are available

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-11-26 12:23:13 UTC (rev 20542)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-11-26 13:02:21 UTC (rev 20543)
@@ -37,7 +37,7 @@
 
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 AVAHI_DISABLE_DBUS:=
-AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libdbus-1.so
+AVAHI_EXTRA_DEPS+=$(TARGET_DIR)/usr/bin/dbus-daemon
 else
 AVAHI_DISABLE_DBUS:=--disable-dbus
 endif
