From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 07:28:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080331142838.8386C3C4EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 07:28:38 -0700 (Mon, 31 Mar 2008)
New Revision: 21594

Log:
avahi: depend on dbus-daemon in staging_dir

Depend on dbus-daemon in staging_dir instead of in target_dir as
fakeroot updates the timestamp on the target_dir version every time,
so the avahi makefile thinks it always needs to recompile avahi.


Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-03-31 09:51:59 UTC (rev 21593)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-03-31 14:28:38 UTC (rev 21594)
@@ -37,7 +37,7 @@
 
 ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
 AVAHI_DISABLE_DBUS:=
-AVAHI_EXTRA_DEPS+=$(TARGET_DIR)/usr/bin/dbus-daemon
+AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/bin/dbus-daemon
 else
 AVAHI_DISABLE_DBUS:=--disable-dbus
 endif
