From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:18:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nano
Message-ID: <20080306181859.4725412023D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:18:58 -0800 (Thu, 06 Mar 2008)
New Revision: 21214

Log:
cleanup nano makefile

Modified:
   trunk/buildroot/package/nano/nano.mk


Changeset:
Modified: trunk/buildroot/package/nano/nano.mk
===================================================================
--- trunk/buildroot/package/nano/nano.mk	2008-03-06 18:18:35 UTC (rev 21213)
+++ trunk/buildroot/package/nano/nano.mk	2008-03-06 18:18:58 UTC (rev 21214)
@@ -19,7 +19,7 @@
 $(NANO_DIR)/.unpacked: $(DL_DIR)/$(NANO_SOURCE)
 	$(NANO_CAT) $(DL_DIR)/$(NANO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(NANO_DIR)
-	touch $(NANO_DIR)/.unpacked
+	touch $@
 
 $(NANO_DIR)/.configured: $(NANO_DIR)/.unpacked
 	(cd $(NANO_DIR); rm -rf config.cache; \
@@ -33,7 +33,7 @@
 		--prefix=/ \
 		--enable-tiny \
 	)
-	touch $(NANO_DIR)/.configured
+	touch $@
 
 $(NANO_DIR)/$(NANO_BINARY): $(NANO_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NANO_DIR)
