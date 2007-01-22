From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 00:54:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dialog
Message-ID: <20070122085414.3E0534857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 00:54:13 -0800 (Mon, 22 Jan 2007)
New Revision: 17450

Log:
- bump patch version


Modified:
   trunk/buildroot/package/dialog/dialog.mk


Changeset:
Modified: trunk/buildroot/package/dialog/dialog.mk
===================================================================
--- trunk/buildroot/package/dialog/dialog.mk	2007-01-22 08:34:44 UTC (rev 17449)
+++ trunk/buildroot/package/dialog/dialog.mk	2007-01-22 08:54:13 UTC (rev 17450)
@@ -9,7 +9,7 @@
 DIALOG_SITE:=http://ftp.debian.org/debian/pool/main/d/dialog
 DIALOG_DIR:=$(BUILD_DIR)/dialog-$(DIALOG_VERSION)
 # http://ftp.debian.org/debian/pool/main/d/dialog/dialog_1.0-20050306-1.diff.gz
-DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-1.diff.gz
+DIALOG_PATCH1:=dialog_$(DIALOG_VERSION)-2.diff.gz
 DIALOG_PATCH1_URL:=$(DIALOG_SITE)
 DIALOG_BINARY:=dialog
 DIALOG_TARGET_BINARY:=usr/bin/dialog
@@ -23,7 +23,7 @@
 $(DIALOG_DIR)/.source: $(DL_DIR)/$(DIALOG_SOURCE) $(DL_DIR)/$(DIALOG_PATCH1)
 	$(ZCAT) $(DL_DIR)/$(DIALOG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(ZCAT) $(DL_DIR)/$(DIALOG_PATCH1) | patch -p1 -d $(DIALOG_DIR)
-	touch $(DIALOG_DIR)/.source
+	touch $@
 
 $(DIALOG_DIR)/.configured: $(DIALOG_DIR)/.source
 	(cd $(DIALOG_DIR); \
@@ -36,7 +36,7 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 	);
-	touch $(DIALOG_DIR)/.configured;
+	touch $@
 
 $(DIALOG_DIR)/$(DIALOG_BINARY): $(DIALOG_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(DIALOG_DIR)
