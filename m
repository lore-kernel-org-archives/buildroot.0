From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:29:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wget
Message-ID: <20080306182906.63845120250@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:29:06 -0800 (Thu, 06 Mar 2008)
New Revision: 21238

Log:
cleanup wget makefile

Modified:
   trunk/buildroot/package/wget/wget.mk


Changeset:
Modified: trunk/buildroot/package/wget/wget.mk
===================================================================
--- trunk/buildroot/package/wget/wget.mk	2008-03-06 18:28:48 UTC (rev 21237)
+++ trunk/buildroot/package/wget/wget.mk	2008-03-06 18:29:06 UTC (rev 21238)
@@ -19,7 +19,7 @@
 $(WGET_DIR)/.unpacked: $(DL_DIR)/$(WGET_SOURCE)
 	$(WGET_CAT) $(DL_DIR)/$(WGET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(WGET_DIR)
-	touch $(WGET_DIR)/.unpacked
+	touch $@
 
 $(WGET_DIR)/.configured: $(WGET_DIR)/.unpacked
 	(cd $(WGET_DIR); rm -rf config.cache; \
@@ -34,7 +34,7 @@
 		$(DISABLE_NLS) \
 		--without-ssl \
 	)
-	touch $(WGET_DIR)/.configured
+	touch $@
 
 $(WGET_DIR)/$(WGET_BINARY): $(WGET_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(WGET_DIR)
