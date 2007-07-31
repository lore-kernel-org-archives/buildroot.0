From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 31 Jul 2007 11:33:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssh
Message-ID: <20070731183319.83E94A6117@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-31 11:33:19 -0700 (Tue, 31 Jul 2007)
New Revision: 19365

Log:
Use TARGET_CONFIGURE_OPTS in openssh

Modified:
   trunk/buildroot/package/openssh/openssh.mk


Changeset:
Modified: trunk/buildroot/package/openssh/openssh.mk
===================================================================
--- trunk/buildroot/package/openssh/openssh.mk	2007-07-31 18:31:58 UTC (rev 19364)
+++ trunk/buildroot/package/openssh/openssh.mk	2007-07-31 18:33:19 UTC (rev 19365)
@@ -46,7 +46,7 @@
 	touch $@
 
 $(OPENSSH_DIR)/ssh: $(OPENSSH_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(OPENSSH_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(OPENSSH_DIR)
 	-$(STRIP) --strip-unneeded $(OPENSSH_DIR)/scp
 	-$(STRIP) --strip-unneeded $(OPENSSH_DIR)/sftp
 	-$(STRIP) --strip-unneeded $(OPENSSH_DIR)/sftp-server
