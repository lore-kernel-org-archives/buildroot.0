From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 24 Aug 2006 19:43:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcmcia
Message-ID: <20060825024316.2C7C14896E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-24 19:43:15 -0700 (Thu, 24 Aug 2006)
New Revision: 15991

Log:
Don Reid writes:
It looks like the linux binary is just used if a system map file cannot
be found.  So I changed the make file to remove it.


Modified:
   trunk/buildroot/package/pcmcia/pcmcia.mk


Changeset:
Modified: trunk/buildroot/package/pcmcia/pcmcia.mk
===================================================================
--- trunk/buildroot/package/pcmcia/pcmcia.mk	2006-08-25 02:13:46 UTC (rev 15990)
+++ trunk/buildroot/package/pcmcia/pcmcia.mk	2006-08-25 02:43:15 UTC (rev 15991)
@@ -91,7 +91,6 @@
 	[ -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION) ] && \
 	$(BUSYBOX_DIR)/examples/depmod.pl \
 		-b $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/ \
-		-k $(LINUX_DIR)/vmlinux \
 		-F $(LINUX_DIR)/System.map \
 		> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 	touch $(PCMCIA_DIR)/.modules.dep
