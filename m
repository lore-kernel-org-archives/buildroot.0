From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  2 Apr 2008 21:10:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080403041014.E12C93C465@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-02 21:10:14 -0700 (Wed, 02 Apr 2008)
New Revision: 21622

Log:
Unbreak the bridge-utils package..


Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-04-02 21:20:35 UTC (rev 21621)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-04-03 04:10:14 UTC (rev 21622)
@@ -51,15 +51,15 @@
 	#cp -af $(BRIDGE_BUILD_DIR)/brctl/brctld $(TARGET_DIR)/usr/sbin/
 	#$(STRIPCMD) $(TARGET_DIR)/usr/sbin/brctld
 
-bridge: $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
+bridge-utils: $(TARGET_DIR)/$(BRIDGE_TARGET_BINARY)
 
-bridge-source: $(DL_DIR)/$(BRIDGE_SOURCE)
+bridge-utils-source: $(DL_DIR)/$(BRIDGE_SOURCE)
 
-bridge-clean:
+bridge-utils-clean:
 	#$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BRIDGE_BUILD_DIR) uninstall
 	-$(MAKE) -C $(BRIDGE_BUILD_DIR) clean
 
-bridge-dirclean:
+bridge-utils-dirclean:
 	rm -rf $(BRIDGE_BUILD_DIR)
 #############################################################
 #
