From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 02:44:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/nfs-utils
	package/ruby package/t etc...
Message-ID: <20070822094425.30FA4A610C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 02:44:25 -0700 (Wed, 22 Aug 2007)
New Revision: 19638

Log:
- fix patch regex


Modified:
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/ruby/ruby.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/target/cloop/cloop.mk


Changeset:
Modified: trunk/buildroot/package/nfs-utils/nfs-utils.mk
===================================================================
--- trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-22 09:41:37 UTC (rev 19637)
+++ trunk/buildroot/package/nfs-utils/nfs-utils.mk	2007-08-22 09:44:25 UTC (rev 19638)
@@ -25,7 +25,7 @@
 
 $(NFS_UTILS_DIR)/.unpacked: $(DL_DIR)/$(NFS_UTILS_SOURCE)
 	$(NFS_UTILS_CAT) $(DL_DIR)/$(NFS_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils*.patch
+	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) package/nfs-utils/ nfs-utils\*.patch
 	toolchain/patch-kernel.sh $(NFS_UTILS_DIR) $(NFS_UTILS_DIR)/debian/ \*.patch
 	$(CONFIG_UPDATE) $(NFS_UTILS_DIR)
 	touch $@

Modified: trunk/buildroot/package/ruby/ruby.mk
===================================================================
--- trunk/buildroot/package/ruby/ruby.mk	2007-08-22 09:41:37 UTC (rev 19637)
+++ trunk/buildroot/package/ruby/ruby.mk	2007-08-22 09:44:25 UTC (rev 19638)
@@ -18,7 +18,7 @@
 
 $(RUBY_DIR)/.unpacked: $(DL_DIR)/$(RUBY_SOURCE)
 	$(RUBY_CAT) $(DL_DIR)/$(RUBY_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(RUBY_DIR) package/ruby/ ruby-*.patch
+	toolchain/patch-kernel.sh $(RUBY_DIR) package/ruby/ ruby-\*.patch
 	(cd $(RUBY_DIR); autoreconf)
 	touch $(RUBY_DIR)/.unpacked
 

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-22 09:41:37 UTC (rev 19637)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-08-22 09:44:25 UTC (rev 19638)
@@ -19,7 +19,7 @@
 
 $(TCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(TCPDUMP_SOURCE)
 	$(TCPDUMP_CAT) $(DL_DIR)/$(TCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TCPDUMP_DIR) package/tcpdump tcpdump*\.patch
+	toolchain/patch-kernel.sh $(TCPDUMP_DIR) package/tcpdump tcpdump\*.patch
 	touch $@
 
 $(TCPDUMP_DIR)/.configured: $(TCPDUMP_DIR)/.unpacked

Modified: trunk/buildroot/target/cloop/cloop.mk
===================================================================
--- trunk/buildroot/target/cloop/cloop.mk	2007-08-22 09:41:37 UTC (rev 19637)
+++ trunk/buildroot/target/cloop/cloop.mk	2007-08-22 09:44:25 UTC (rev 19638)
@@ -27,7 +27,7 @@
 	$(ZCAT) $(DL_DIR)/$(CLOOP_SOURCE) | tar -C $(BUILD_DIR) -xvf -
 	touch $@
 ###		$(ZCAT) $(DL_DIR)/$(CLOOP_PATCH1) | patch -p1 -d $(CLOOP_DIR)
-###		toolchain/patch-kernel.sh $(CLOOP_DIR) target/cloop/ cloop*.patch
+###		toolchain/patch-kernel.sh $(CLOOP_DIR) target/cloop/ cloop\*.patch
 
 $(CLOOP_DIR)/create_compressed_fs: $(CLOOP_DIR)/.unpacked
 	$(MAKE) CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DUSE_ERROR_SILENT" -C $(CLOOP_DIR) \
