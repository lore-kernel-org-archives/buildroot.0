From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 14:47:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: iperf libgcrypt
	libgpg-error lzo
Message-ID: <20070811214731.8BF54A5E18@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 14:47:28 -0700 (Sat, 11 Aug 2007)
New Revision: 19438

Log:
Run $\(CONFIG_UPDATE\) in the unpack rules for iperf, libgcrypt,libgpg-error, lzo

Modified:
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/libgcrypt/libgcrypt.mk
   trunk/buildroot/package/libgpg-error/libgpg-error.mk
   trunk/buildroot/package/lzo/lzo.mk


Changeset:
Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2007-08-11 20:26:02 UTC (rev 19437)
+++ trunk/buildroot/package/iperf/iperf.mk	2007-08-11 21:47:28 UTC (rev 19438)
@@ -16,6 +16,7 @@
 $(IPERF_DIR)/.unpacked: $(DL_DIR)/$(IPERF_SOURCE)
 	$(IPERF_CAT) $(DL_DIR)/$(IPERF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(IPERF_DIR) package/iperf/ iperf\*.patch
+	$(CONFIG_UPDATE) $(IPERF_DIR)
 	touch $(IPERF_DIR)/.unpacked
 
 $(IPERF_DIR)/.configured: $(IPERF_DIR)/.unpacked

Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-08-11 20:26:02 UTC (rev 19437)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-08-11 21:47:28 UTC (rev 19438)
@@ -17,6 +17,7 @@
 $(LIBGCRYPT_DIR)/.source: $(DL_DIR)/$(LIBGCRYPT_SOURCE)
 	$(BZCAT) $(DL_DIR)/$(LIBGCRYPT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBGCRYPT_DIR) package/libgcrypt/ libgcrypt\*.patch
+	$(CONFIG_UPDATE) $(LIBGCRYPT_DIR)
 	touch $@
 
 $(LIBGCRYPT_DIR)/.configured: $(LIBGCRYPT_DIR)/.source

Modified: trunk/buildroot/package/libgpg-error/libgpg-error.mk
===================================================================
--- trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-08-11 20:26:02 UTC (rev 19437)
+++ trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-08-11 21:47:28 UTC (rev 19438)
@@ -17,6 +17,7 @@
 $(LIBGPG_ERROR_DIR)/.source: $(DL_DIR)/$(LIBGPG_ERROR_SOURCE)
 	$(BZCAT) $(DL_DIR)/$(LIBGPG_ERROR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBGPG_ERROR_DIR) package/libgpg-error/ libgpg-error\*.patch
+	$(CONFIG_UPDATE) $(LIBGPG_ERROR_DIR)
 	touch $(LIBGPG_ERROR_DIR)/.source
 
 $(LIBGPG_ERROR_DIR)/.configured: $(LIBGPG_ERROR_DIR)/.source

Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2007-08-11 20:26:02 UTC (rev 19437)
+++ trunk/buildroot/package/lzo/lzo.mk	2007-08-11 21:47:28 UTC (rev 19438)
@@ -22,6 +22,7 @@
 $(LZO_DIR)/.unpacked: $(DL_DIR)/$(LZO_SOURCE)
 	$(LZO_CAT) $(DL_DIR)/$(LZO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LZO_DIR) package/lzo/ lzo\*.patch
+	$(CONFIG_UPDATE) $(LZO_DIR)/acconfig
 	touch $@
 
 LZO_CONFIG_SHARED:=--disable-shared
