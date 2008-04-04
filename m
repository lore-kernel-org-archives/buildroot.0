From: hamish at uclibc.org <hamish@uclibc.org>
Date: Thu,  3 Apr 2008 17:13:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bridge-utils
Message-ID: <20080404001357.7F3823C3A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-04-03 17:13:56 -0700 (Thu, 03 Apr 2008)
New Revision: 21629

Log:
More unbreaking. These cosmetic directory renames don't seem to be working out very well..


Modified:
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-04-03 21:06:27 UTC (rev 21628)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-04-04 00:13:56 UTC (rev 21629)
@@ -15,7 +15,7 @@
 
 $(BRIDGE_BUILD_DIR)/.unpacked: $(DL_DIR)/$(BRIDGE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(BRIDGE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	patch -p1 -d $(BRIDGE_BUILD_DIR) < package/bridge/bridge.patch
+	patch -p1 -d $(BRIDGE_BUILD_DIR) < package/bridge-utils/bridge.patch
 	touch $(BRIDGE_BUILD_DIR)/.unpacked
 
 $(BRIDGE_BUILD_DIR)/.configured: $(BRIDGE_BUILD_DIR)/.unpacked
