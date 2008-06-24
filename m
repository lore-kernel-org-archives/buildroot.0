From: correa at uclibc.org <correa@uclibc.org>
Date: Tue, 24 Jun 2008 09:02:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080624160224.379CD3C664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-06-24 09:02:22 -0700 (Tue, 24 Jun 2008)
New Revision: 22490

Log:
Fix avahi compile when libexpat is not selected

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-06-24 14:10:41 UTC (rev 22489)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-06-24 16:02:22 UTC (rev 22490)
@@ -26,12 +26,12 @@
 
 ifeq ($(strip $(BR2_PACKAGE_AVAHI_DAEMON)),y)
 AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-daemon
-AVAHI_DISABLE_EXPAT:=
+AVAHI_DISABLE_EXPAT:=--with-xml=expat
 # depend on the exact library file instead of expat so avahi isn't always
 # considered out-of-date
 AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
-AVAHI_DISABLE_EXPAT:=--disable-expat
+AVAHI_DISABLE_EXPAT:=--disable-expat --with-xml=none
 
 endif
 
