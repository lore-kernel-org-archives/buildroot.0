From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri, 12 Dec 2008 01:29:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081212092938.291973C2E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-12 01:29:37 -0800 (Fri, 12 Dec 2008)
New Revision: 24390

Log:
samba: make proto first to allow parallel build afterwards

This patch fixes parallel build of Samba. The trick is to make proto before
executing a full make.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-12-12 09:09:51 UTC (rev 24389)
+++ trunk/buildroot/package/samba/samba.mk	2008-12-12 09:29:37 UTC (rev 24390)
@@ -60,7 +60,8 @@
 	touch $@
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
-	$(MAKE1) -C $(SAMBA_DIR)
+	$(MAKE) -C $(SAMBA_DIR) proto
+	$(MAKE) -C $(SAMBA_DIR)
 
 SAMBA_TARGETS_ :=
 SAMBA_TARGETS_y :=
