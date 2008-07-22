From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 Jul 2008 06:59:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
Message-ID: <20080722135943.8F8033C799@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-22 06:59:42 -0700 (Tue, 22 Jul 2008)
New Revision: 22915

Log:
which: install into /usr/bin

Modified:
   trunk/buildroot/package/which/which.mk


Changeset:
Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2008-07-22 13:59:39 UTC (rev 22914)
+++ trunk/buildroot/package/which/which.mk	2008-07-22 13:59:42 UTC (rev 22915)
@@ -9,7 +9,7 @@
 WHICH_DIR:=$(BUILD_DIR)/which-$(WHICH_VERSION)
 WHICH_CAT:=$(ZCAT)
 WHICH_BINARY:=which
-WHICH_TARGET_BINARY:=bin/which
+WHICH_TARGET_BINARY:=usr/bin/which
 
 $(DL_DIR)/$(WHICH_SOURCE):
 	$(WGET) -P $(DL_DIR) $(WHICH_SITE)/$(WHICH_SOURCE)
@@ -29,7 +29,8 @@
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/ \
+		--prefix=/usr \
+		--sysconfdir=/etc \
 	)
 	touch $@
 
