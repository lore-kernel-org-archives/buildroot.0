From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 15 Jul 2007 15:01:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcmcia
Message-ID: <20070715220133.C9C1B30047@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-15 15:01:33 -0700 (Sun, 15 Jul 2007)
New Revision: 19103

Log:
Make package/pcmcia depend on 'linux26' (which is defined) instead of 'linux'

Modified:
   trunk/buildroot/package/pcmcia/pcmcia.mk


Changeset:
Modified: trunk/buildroot/package/pcmcia/pcmcia.mk
===================================================================
--- trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-15 21:54:11 UTC (rev 19102)
+++ trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-15 22:01:33 UTC (rev 19103)
@@ -95,7 +95,7 @@
 		> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 	touch $(PCMCIA_DIR)/.modules.dep
 
-pcmcia: uclibc linux $(TARGET_DIR)/sbin/cardmgr $(PCMCIA_DIR)/.modules.dep
+pcmcia: uclibc linux26 $(TARGET_DIR)/sbin/cardmgr $(PCMCIA_DIR)/.modules.dep
 
 pcmcia-clean:
 	rm -f $(TARGET_DIR)/sbin/cardmgr
