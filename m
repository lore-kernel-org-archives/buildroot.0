From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/libsndfile
Message-ID: <20080906204934.682173C6ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:34 -0700 (Sat, 06 Sep 2008)
New Revision: 23347

Log:
libsndfile: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/libsndfile/libsndfile.mk


Changeset:
Modified: trunk/buildroot/package/audio/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/audio/libsndfile/libsndfile.mk	2008-09-06 20:49:31 UTC (rev 23346)
+++ trunk/buildroot/package/audio/libsndfile/libsndfile.mk	2008-09-06 20:49:34 UTC (rev 23347)
@@ -15,7 +15,7 @@
 
 $(LIBSNDFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBSNDFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/libsndfile/ \*.patch
+	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/audio/libsndfile/ \*.patch
 	$(CONFIG_UPDATE) $(LIBSNDFILE_DIR)
 	touch $@
 
