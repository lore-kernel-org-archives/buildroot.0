From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 12 Sep 2007 10:33:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20070912173311.670CFA685D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-09-12 10:33:10 -0700 (Wed, 12 Sep 2007)
New Revision: 19828

Log:
revert this bit, use usr/include


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2007-09-12 08:52:44 UTC (rev 19827)
+++ trunk/buildroot/package/dm/dm.mk	2007-09-12 17:33:10 UTC (rev 19828)
@@ -35,7 +35,7 @@
 DM_TARGET_BINARY:=$(TARGET_DIR)/usr/sbin/dmsetup
 DM_STAGING_LIBRARY:=$(STAGING_DIR)/lib/libdevmapper.so
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
-DM_TARGET_HEADER:=$(TARGET_DIR)/include/libdevmapper.h
+DM_TARGET_HEADER:=$(TARGET_DIR)/usr/include/libdevmapper.h
 
 $(DL_DIR)/$(DM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
@@ -108,8 +108,8 @@
 # Install header file
 $(DM_TARGET_HEADER): $(DM_TARGET_LIBRARY)
 	rm -f $@
-	mkdir -p $(STAGING_DIR)/include
-	$(INSTALL) -m 0644 $(STAGING_DIR)/include/libdevmapper.h $@
+	mkdir -p $(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 $(STAGING_DIR)/usr/include/libdevmapper.h $@
 
 dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) #$(DM_TARGET_HEADER)
 
