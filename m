From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 23 Mar 2007 06:26:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070323132652.4CD36485C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-23 06:26:51 -0700 (Fri, 23 Mar 2007)
New Revision: 18214

Log:
- make sure we have a build_$arch dir for -menuconfig even when in a pristine checkout


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-03-23 13:24:56 UTC (rev 18213)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-03-23 13:26:51 UTC (rev 18214)
@@ -109,7 +109,7 @@
 
 busybox: uclibc $(TARGET_DIR)/bin/busybox
 
-busybox-menuconfig: host-sed busybox-source $(BUSYBOX_DIR)/.configured
+busybox-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 	cp -f $(BUSYBOX_DIR)/.config $(BUSYBOX_CONFIG_FILE)
 
