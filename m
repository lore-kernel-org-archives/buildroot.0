From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 14 Jan 2009 23:51:33 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20090114235133.4391B7697C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-14 23:51:32 +0000 (Wed, 14 Jan 2009)
New Revision: 24849

Log:
Kismet needs dbus to build

Modified:
   trunk/buildroot/package/kismet/kismet.mk


Changeset:
Modified: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	2009-01-14 23:50:44 UTC (rev 24848)
+++ trunk/buildroot/package/kismet/kismet.mk	2009-01-14 23:51:32 UTC (rev 24849)
@@ -60,7 +60,7 @@
 	install -m 755 $(KISMET_DIR)/kismet_server $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
 	install -m 755 $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
 
-kismet: uclibc ncurses libpcap $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY)
+kismet: uclibc ncurses libpcap dbus $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY)
 
 
 kismet-clean:
