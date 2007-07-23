From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 04:35:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus quagga
Message-ID: <20070723113527.8E565A4653@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 04:35:26 -0700 (Mon, 23 Jul 2007)
New Revision: 19219

Log:
- for autoconf'ed packages like these there is no need to pass TARGET_CONFIGURE_OPTS to make


Modified:
   trunk/buildroot/package/argus/argus.mk
   trunk/buildroot/package/quagga/quagga.mk


Changeset:
Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2007-07-23 11:34:30 UTC (rev 19218)
+++ trunk/buildroot/package/argus/argus.mk	2007-07-23 11:35:26 UTC (rev 19219)
@@ -45,7 +45,7 @@
 	touch $@
 
 $(ARGUS_DIR)/$(ARGUS_BINARY): $(ARGUS_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(ARGUS_DIR)
+	$(MAKE) -C $(ARGUS_DIR)
 
 $(TARGET_DIR)/$(ARGUS_TARGET_BINARY): $(ARGUS_DIR)/$(ARGUS_BINARY)
 	cp -dpf $(ARGUS_DIR)/$(ARGUS_BINARY) $@

Modified: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	2007-07-23 11:34:30 UTC (rev 19218)
+++ trunk/buildroot/package/quagga/quagga.mk	2007-07-23 11:35:26 UTC (rev 19219)
@@ -152,7 +152,7 @@
 	touch $@
 
 $(QUAGGA_BINARY): $(QUAGGA_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QUAGGA_DIR)
+	$(MAKE) -C $(QUAGGA_DIR)
 
 $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
