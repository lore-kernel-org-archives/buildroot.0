From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 24 Jul 2007 07:10:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcmcia
Message-ID: <20070724141004.AA690A6079@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-24 07:10:03 -0700 (Tue, 24 Jul 2007)
New Revision: 19248

Log:
Use known Buildroot symbols for linux in pcmcia

Modified:
   trunk/buildroot/package/pcmcia/pcmcia.mk


Changeset:
Modified: trunk/buildroot/package/pcmcia/pcmcia.mk
===================================================================
--- trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-24 14:08:02 UTC (rev 19247)
+++ trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-24 14:10:03 UTC (rev 19248)
@@ -40,7 +40,7 @@
 	touch $(PCMCIA_DIR)/.patched
 
 $(PCMCIA_DIR)/.configured: $(PCMCIA_DIR)/.patched
-	( cd $(PCMCIA_DIR) ; ./Configure --kernel=$(LINUX_SOURCE_DIR) --noprompt \
+	( cd $(PCMCIA_DIR) ; ./Configure --kernel=$(LINUX26_DIR) --noprompt \
 		--rcdir=/etc --arch=$(ARCH) --trust --srctree --nocardbus \
 		--sysv --kcc=$(KERNEL_CROSS)gcc --ucc=$(TARGET_CC) --ld=$(TARGET_CROSS)ld \
 		--target=$(TARGET_DIR))
@@ -88,11 +88,11 @@
 
 # use busybox depmod.pl so we need the sources unpacked
 $(PCMCIA_DIR)/.modules.dep: $(BUSYBOX_DIR)/.configured $(TARGET_DIR)/lib/modules
-	[ -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION) ] && \
+	[ -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION) ] && \
 	$(BUSYBOX_DIR)/examples/depmod.pl \
-		-b $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/ \
-		-F $(LINUX_DIR)/System.map \
-		> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
+		-b $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/ \
+		-F $(LINUX26_DIR)/System.map \
+		> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 	touch $(PCMCIA_DIR)/.modules.dep
 
 pcmcia: uclibc linux26 $(TARGET_DIR)/sbin/cardmgr $(PCMCIA_DIR)/.modules.dep
