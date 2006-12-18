From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 18 Dec 2006 06:10:47 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20061218141047.8584FC8021@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-18 06:10:46 -0800 (Mon, 18 Dec 2006)
New Revision: 16991

Log:
- copy the final kernel (and System.map) to boot/


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.mk
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-18 13:48:02 UTC (rev 16990)
+++ trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-18 14:10:46 UTC (rev 16991)
@@ -100,7 +100,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
+linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(TARGET_DIR)/boot/$(LINUX26_BINLOC)
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
