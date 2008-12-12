From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri, 12 Dec 2008 02:34:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20081212103425.A4A9C3C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-12 02:34:25 -0800 (Fri, 12 Dec 2008)
New Revision: 24391

Log:
samba: add a comment about why make proto is done before make

This patch adds a comment why make proto is needed before make.



Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2008-12-12 09:29:37 UTC (rev 24390)
+++ trunk/buildroot/package/samba/samba.mk	2008-12-12 10:34:25 UTC (rev 24391)
@@ -60,6 +60,7 @@
 	touch $@
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
+	# make proto must be done before make to be parallel safe
 	$(MAKE) -C $(SAMBA_DIR) proto
 	$(MAKE) -C $(SAMBA_DIR)
 
