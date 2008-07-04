From: correa at uclibc.org <correa@uclibc.org>
Date: Thu,  3 Jul 2008 19:12:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pkgconfig
Message-ID: <20080704021221.E7EBB3C650@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-03 19:12:21 -0700 (Thu, 03 Jul 2008)
New Revision: 22620

Log:
Minor clean-up

Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-07-03 08:29:26 UTC (rev 22619)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2008-07-04 02:12:21 UTC (rev 22620)
@@ -19,7 +19,7 @@
 $(PKGCONFIG_DIR)/.unpacked: $(DL_DIR)/$(PKGCONFIG_SOURCE)
 	$(PKGCONFIG_CAT) $(DL_DIR)/$(PKGCONFIG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(PKGCONFIG_DIR) package/pkgconfig/ \*.patch
-	touch $(PKGCONFIG_DIR)/.unpacked
+	touch $@
 
 $(PKGCONFIG_DIR)/.configured: $(PKGCONFIG_DIR)/.unpacked
 	(cd $(PKGCONFIG_DIR); rm -rf config.cache; \
@@ -30,7 +30,7 @@
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
-	touch $(PKGCONFIG_DIR)/.configured
+	touch $@
 
 $(PKGCONFIG_DIR)/$(PKGCONFIG_BINARY): $(PKGCONFIG_DIR)/.configured
 	$(MAKE) -C $(PKGCONFIG_DIR)
