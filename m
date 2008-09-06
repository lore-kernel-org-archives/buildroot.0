From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libid3tag
Message-ID: <20080906204928.663A83C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:28 -0700 (Sat, 06 Sep 2008)
New Revision: 23345

Log:
libid3tag: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/libid3tag/libid3tag.mk


Changeset:
Modified: trunk/buildroot/package/audio/libid3tag/libid3tag.mk
===================================================================
--- trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-06 20:49:25 UTC (rev 23344)
+++ trunk/buildroot/package/audio/libid3tag/libid3tag.mk	2008-09-06 20:49:28 UTC (rev 23345)
@@ -17,7 +17,7 @@
 
 $(LIBID3TAG_DIR)/.unpacked: $(DL_DIR)/$(LIBID3TAG_SOURCE)
 	$(LIBID3TAG_CAT) $(DL_DIR)/$(LIBID3TAG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBID3TAG_DIR) package/libid3tag/ libid3tag-$(LIBID3TAG_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(LIBID3TAG_DIR) package/audio/libid3tag/ libid3tag-$(LIBID3TAG_VERSION)\*.patch\*
 	$(CONFIG_UPDATE) $(LIBID3TAG_DIR)
 	touch $@
 
