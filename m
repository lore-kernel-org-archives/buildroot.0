From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:36 +0000 (UTC)
Subject: [Buildroot] svn commit: [25682] trunk/buildroot/package/automake
Message-ID: <20090316154836.400EE7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:35 +0000 (Mon, 16 Mar 2009)
New Revision: 25682

Log:
automake: minor cleanup

Modified:
   trunk/buildroot/package/automake/automake.mk


Changeset:
Modified: trunk/buildroot/package/automake/automake.mk
===================================================================
--- trunk/buildroot/package/automake/automake.mk	2009-03-16 15:48:29 UTC (rev 25681)
+++ trunk/buildroot/package/automake/automake.mk	2009-03-16 15:48:35 UTC (rev 25682)
@@ -104,8 +104,8 @@
 #############################################################
 
 $(AUTOMAKE_HOST_DIR)/.configured: $(AUTOMAKE_SRC_DIR)/.unpacked $(AUTOCONF)
-	mkdir -p $(AUTOMAKE_HOST_DIR)
-	(cd $(AUTOMAKE_HOST_DIR); rm -rf config.cache; \
+	mkdir -p $(@D)
+	(cd $(@D); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" \
@@ -116,7 +116,7 @@
 	touch $@
 
 $(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY): $(AUTOMAKE_HOST_DIR)/.configured
-	$(MAKE) -C $(AUTOMAKE_HOST_DIR)
+	$(MAKE) -C $(@D)
 	touch -c $@
 
 $(AUTOMAKE): $(AUTOMAKE_HOST_DIR)/$(AUTOMAKE_BINARY)
