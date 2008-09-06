From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 13:49:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/mpg123
Message-ID: <20080906204941.AFC6A3C708@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 13:49:40 -0700 (Sat, 06 Sep 2008)
New Revision: 23349

Log:
mpg123: fix paths (broken by r23330)

Modified:
   trunk/buildroot/package/audio/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/audio/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/audio/mpg123/mpg123.mk	2008-09-06 20:49:37 UTC (rev 23348)
+++ trunk/buildroot/package/audio/mpg123/mpg123.mk	2008-09-06 20:49:40 UTC (rev 23349)
@@ -23,7 +23,7 @@
 
 $(MPG123_DIR)/.unpacked: $(DL_DIR)/$(MPG123_SOURCE)
 	$(MPG123_CAT) $(DL_DIR)/$(MPG123_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPG123_DIR) package/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(MPG123_DIR) package/audio/mpg123/ mpg123-$(MPG123_VERSION)\*.patch
 	$(CONFIG_UPDATE) $(MPG123_DIR)/build
 	touch $@
 
