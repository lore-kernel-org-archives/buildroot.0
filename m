From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 00:29:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20080827072914.6FFD0F800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 00:29:13 -0700 (Wed, 27 Aug 2008)
New Revision: 23233

Log:
avahi: don't depend on busybox

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:09 UTC (rev 23232)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-08-27 07:29:13 UTC (rev 23233)
@@ -180,7 +180,7 @@
 		 $(TARGET_DIR)/usr/sbin/avahi-daemon
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-avahi: uclibc busybox libdaemon $(AVAHI_TARGETS)
+avahi: uclibc libdaemon $(AVAHI_TARGETS)
 
 avahi-clean:
 	-$(MAKE) -C $(AVAHI_DIR) distclean
