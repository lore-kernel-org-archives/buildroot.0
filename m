From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 28 Jul 2007 08:38:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/argus
Message-ID: <20070728153859.345AEA47AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-28 08:38:58 -0700 (Sat, 28 Jul 2007)
New Revision: 19291

Log:
Build argus with correct options

Modified:
   trunk/buildroot/package/argus/argus.mk


Changeset:
Modified: trunk/buildroot/package/argus/argus.mk
===================================================================
--- trunk/buildroot/package/argus/argus.mk	2007-07-28 15:37:11 UTC (rev 19290)
+++ trunk/buildroot/package/argus/argus.mk	2007-07-28 15:38:58 UTC (rev 19291)
@@ -45,7 +45,7 @@
 	touch $@
 
 $(ARGUS_DIR)/$(ARGUS_BINARY): $(ARGUS_DIR)/.configured
-	$(MAKE) -C $(ARGUS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(ARGUS_DIR)
 
 $(TARGET_DIR)/$(ARGUS_TARGET_BINARY): $(ARGUS_DIR)/$(ARGUS_BINARY)
 	cp -dpf $(ARGUS_DIR)/$(ARGUS_BINARY) $@
