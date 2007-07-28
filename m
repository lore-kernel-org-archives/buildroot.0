From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 14:51:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070728215159.8D2FFA48EA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 14:51:58 -0700 (Sat, 28 Jul 2007)
New Revision: 19308

Log:
Use only single job to build Samba

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-07-28 18:52:47 UTC (rev 19307)
+++ trunk/buildroot/package/samba/samba.mk	2007-07-28 21:51:58 UTC (rev 19308)
@@ -49,7 +49,7 @@
 	touch $@
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
 
 SAMBA_TARGETS_ :=
 SAMBA_TARGETS_y :=
