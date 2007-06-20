From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 06:19:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libevent
Message-ID: <20070620131941.55B2CC8057@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 06:19:40 -0700 (Wed, 20 Jun 2007)
New Revision: 18869

Log:
- use $@


Modified:
   trunk/buildroot/package/libevent/libevent.mk


Changeset:
Modified: trunk/buildroot/package/libevent/libevent.mk
===================================================================
--- trunk/buildroot/package/libevent/libevent.mk	2007-06-20 13:18:53 UTC (rev 18868)
+++ trunk/buildroot/package/libevent/libevent.mk	2007-06-20 13:19:40 UTC (rev 18869)
@@ -20,7 +20,7 @@
 $(LIBEVENT_DIR)/.unpacked: $(DL_DIR)/$(LIBEVENT_SOURCE)
 	$(LIBEVENT_CAT) $(DL_DIR)/$(LIBEVENT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBEVENT_DIR) package/libevent/ \*.patch
-	touch $(LIBEVENT_DIR)/.unpacked
+	touch $@
 
 $(LIBEVENT_DIR)/.configured: $(LIBEVENT_DIR)/.unpacked
 	(cd $(LIBEVENT_DIR); rm -rf config.cache; \
@@ -35,7 +35,7 @@
 		--disable-static \
 		--with-gnu-ld \
 	);
-	touch $(LIBEVENT_DIR)/.configured
+	touch $@
 
 $(LIBEVENT_DIR)/$(LIBEVENT_BINARY): $(LIBEVENT_DIR)/.configured
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBEVENT_DIR)
