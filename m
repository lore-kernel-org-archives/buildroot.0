From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  1 Oct 2008 03:28:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20081001102844.936303C2BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-01 03:28:44 -0700 (Wed, 01 Oct 2008)
New Revision: 23571

Log:
avahi: add dependencies in right order

This patch puts gettext and libintl before the avahi targets, thus making sure
they exist before avahi targets are built.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-09-30 22:37:29 UTC (rev 23570)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-10-01 10:28:44 UTC (rev 23571)
@@ -180,7 +180,7 @@
 		 $(TARGET_DIR)/usr/sbin/avahi-daemon
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-avahi: uclibc libdaemon $(AVAHI_TARGETS) $(if $(BR2_ENABLE_LOCALE),gettext libintl)
+avahi: uclibc libdaemon $(if $(BR2_ENABLE_LOCALE),gettext libintl) $(AVAHI_TARGETS)
 
 avahi-clean:
 	-$(MAKE) -C $(AVAHI_DIR) distclean
