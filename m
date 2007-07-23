From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:33:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbset
Message-ID: <20070723123323.8DF88A69C3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:33:22 -0700 (Mon, 23 Jul 2007)
New Revision: 19228

Log:
Cleanup fbset package

Modified:
   trunk/buildroot/package/fbset/fbset.mk


Changeset:
Modified: trunk/buildroot/package/fbset/fbset.mk
===================================================================
--- trunk/buildroot/package/fbset/fbset.mk	2007-07-23 12:26:49 UTC (rev 19227)
+++ trunk/buildroot/package/fbset/fbset.mk	2007-07-23 12:33:22 UTC (rev 19228)
@@ -17,20 +17,19 @@
 $(FBSET_DIR)/.unpacked: $(DL_DIR)/$(FBSET_SOURCE)
 	$(FBSET_CAT) $(DL_DIR)/$(FBSET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(FBSET_DIR) package/fbset/ fbset-$(FBSET_VERSION)\*.patch\*
-	@touch $@
+	touch $@
 
 $(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
 	($(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+	 $(TARGET_CONFIGURE_ARGS) \
 		$(MAKE) -C $(FBSET_DIR) CC=$(TARGET_CC) \
 	);
-	@touch -c $@
+	touch -c $@
 
 $(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
 	$(INSTALL) -m 755 $(FBSET_DIR)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
-	@touch -c $@
+	touch -c $@
 
 fbset: linux26 uclibc $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
 
