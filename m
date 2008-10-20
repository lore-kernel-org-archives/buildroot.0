From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 20 Oct 2008 04:53:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20081020115305.D44413C7DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-20 04:53:05 -0700 (Mon, 20 Oct 2008)
New Revision: 23742

Log:
bridge-utils: don't strip if BR2_ENABLE_DEBUG is enabled

Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-10-20 11:32:25 UTC (rev 23741)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-10-20 11:53:05 UTC (rev 23742)
@@ -16,10 +16,12 @@
 
 $(eval $(call AUTOTARGETS,package,bridge))
 
+ifeq ($(BR2_ENABLE_DEBUG),)
 # bridge has no install-strip target
 $(BRIDGE_HOOK_POST_INSTALL): $(BRIDGE_TARGET_INSTALL_TARGET)
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/brctl
 	touch $@
+endif
 
 # bridge has no uninstall target
 $(BRIDGE_TARGET_UNINSTALL):
