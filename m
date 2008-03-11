From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 11 Mar 2008 01:17:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080311081704.5050112C7CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-11 01:17:03 -0700 (Tue, 11 Mar 2008)
New Revision: 21285

Log:
busybox: remove config dependency on busybox-source

busybox-source target doesn't need to depend on the config file.
Patch by Simon Pasch.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2008-03-10 16:34:19 UTC (rev 21284)
+++ trunk/buildroot/package/busybox/busybox.mk	2008-03-11 08:17:03 UTC (rev 21285)
@@ -125,7 +125,7 @@
 
 busybox: uclibc $(TARGET_DIR)/bin/busybox
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE)
 
 busybox-unpacked: $(BUSYBOX_DIR)/.unpacked
 
