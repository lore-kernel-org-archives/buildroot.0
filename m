From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 03:25:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070922102510.DB4E0A658A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 03:25:09 -0700 (Sat, 22 Sep 2007)
New Revision: 19936

Log:
- remove inadequate dependencies prerequisite.
  If needed, this should be done slightly different, otherwise the source target runs dependencies, which is not correct.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2007-09-22 10:20:35 UTC (rev 19935)
+++ trunk/buildroot/package/busybox/busybox.mk	2007-09-22 10:25:09 UTC (rev 19936)
@@ -28,7 +28,7 @@
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) dependencies
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
 
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
