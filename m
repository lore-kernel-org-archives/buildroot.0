From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 18 Dec 2006 05:48:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20061218134802.85595485CC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-18 05:48:02 -0800 (Mon, 18 Dec 2006)
New Revision: 16990

Log:
- stripped a bit too much for kernel-headers == target-kernel. Reinstate required rules.


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.mk
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-18 13:30:05 UTC (rev 16989)
+++ trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-18 13:48:02 UTC (rev 16990)
@@ -64,13 +64,13 @@
 	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
 	touch $(LINUX26_DIR)/.patched
 
+endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
+
 $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
 	-cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $(LINUX26_DIR)/.configured
 
-endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
-
 $(LINUX26_DIR)/.depend_done:  $(LINUX26_DIR)/.configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $(LINUX26_DIR)/.depend_done
