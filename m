From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Wed, 31 Oct 2007 05:46:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20071031124653.2558EA6038@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2007-10-31 05:46:52 -0700 (Wed, 31 Oct 2007)
New Revision: 20349

Log:
Had an issue noted in bug #1557, attached patch.


Modified:
   trunk/buildroot/package/kismet/kismet.mk


Changeset:
Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2007-10-31 06:52:26 UTC (rev 20348)
+++ trunk/buildroot/package/kismet/kismet.mk	2007-10-31 12:46:52 UTC (rev 20349)
@@ -47,15 +47,16 @@
 	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
 		-C $(KISMET_DIR)
 
-$(TARGET_DIR)/$(KISMET_TARGET_BINARY): $(KISMET_DIR)/$(KISMET_BINARY)
+$(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY): $(KISMET_DIR)/$(KISMET_BINARY)
 	install -m 755 $(KISMET_DIR)/kismet $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
 	install -m 755 $(KISMET_DIR)/kismet_client $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
 	install -m 755 $(KISMET_DIR)/kismet_drone $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
 	install -m 755 $(KISMET_DIR)/kismet_server $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
 	install -m 755 $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
 
-kismet: uclibc ncurses libpcap $(TARGET_DIR)/$(KISMET_TARGET_BINARY)
+kismet: uclibc ncurses libpcap $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY)
 
+
 kismet-clean:
 	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
 	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
