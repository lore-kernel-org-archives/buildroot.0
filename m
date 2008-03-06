From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:29:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20080306182921.D5ACB1202A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:29:21 -0800 (Thu, 06 Mar 2008)
New Revision: 21239

Log:
cleanup which makefile

Modified:
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2008-03-06 18:29:06 UTC (rev 21238)
+++ trunk/buildroot/package/which/which.mk	2008-03-06 18:29:21 UTC (rev 21239)
@@ -3,7 +3,7 @@
 # which
 #
 #############################################################
-WHICH_VERSION:=2.16
+WHICH_VERSION:=2.19
 WHICH_SOURCE:=which-$(WHICH_VERSION).tar.gz
 WHICH_SITE:=http://www.xs4all.nl/~carlo17/which/
 WHICH_DIR:=$(BUILD_DIR)/which-$(WHICH_VERSION)
@@ -19,7 +19,7 @@
 $(WHICH_DIR)/.unpacked: $(DL_DIR)/$(WHICH_SOURCE)
 	$(WHICH_CAT) $(DL_DIR)/$(WHICH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(WHICH_DIR)
-	touch $(WHICH_DIR)/.unpacked
+	touch $@
 
 $(WHICH_DIR)/.configured: $(WHICH_DIR)/.unpacked
 	(cd $(WHICH_DIR); rm -rf config.cache; \
@@ -31,7 +31,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/ \
 	)
-	touch $(WHICH_DIR)/.configured
+	touch $@
 
 $(WHICH_DIR)/$(WHICH_BINARY): $(WHICH_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(WHICH_DIR)
