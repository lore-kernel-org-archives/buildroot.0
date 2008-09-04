From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 19:39:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080904023923.968803C7D7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 19:39:23 -0700 (Wed, 03 Sep 2008)
New Revision: 23318

Log:
Override the uninstall target rather than the clean target
Also, don't actually create the .stamp_uninstalled but remove the
.stamp_installed file instead (ala the overridden target).


Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-04 02:34:42 UTC (rev 23317)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-04 02:39:23 UTC (rev 23318)
@@ -22,8 +22,9 @@
 	touch $@
 
 # bridge has no uninstall target
-$(BUILD_DIR)/bridge-$(BRIDGE_VERSION)/.stamp_cleaned:
-	$(call MESSAGE,"Cleaning up")
+$(BUILD_DIR)/bridge-$(BRIDGE_VERSION)/.stamp_uninstalled:
+	$(call MESSAGE,"Uninstalling")
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
 		include/libbridge.h man/man8/brctl.8 sbin/brctl)
-	touch $@
+	rm -f $(@D)/.stamp_target_installed
+
