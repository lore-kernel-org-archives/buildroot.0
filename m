From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 12:59:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070606195902.B57F148580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 12:59:01 -0700 (Wed, 06 Jun 2007)
New Revision: 18762

Log:
- fix typo which led to a superfluous cp invocation


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-06-06 19:50:05 UTC (rev 18761)
+++ trunk/buildroot/target/linux26.mk	2007-06-06 19:59:01 UTC (rev 18762)
@@ -103,7 +103,7 @@
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
-$(TARGET_DIR)/boot/$(LINUX26_BINLOC): $(LINUX26_KERNEL)
+$(TARGET_DIR)/boot/$(LINUX26_FORMAT): $(LINUX26_KERNEL)
 	[ -d $(TARGET_DIR)/boot/ ] || mkdir $(TARGET_DIR)/boot
 	cp -a $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_DIR)/System.map $(TARGET_DIR)/boot/
 	touch -c $@
@@ -122,7 +122,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(TARGET_DIR)/boot/$(LINUX26_BINLOC)
+linux26: cross-depmod26 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep $(TARGET_DIR)/boot/$(LINUX26_FORMAT)
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
