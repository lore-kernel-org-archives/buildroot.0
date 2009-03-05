From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 19:00:14 +0000 (UTC)
Subject: [Buildroot] svn commit: [25554] trunk/buildroot/package/logrotate
Message-ID: <20090305190014.4D6CB76465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 19:00:11 +0000 (Thu, 05 Mar 2009)
New Revision: 25554

Log:
logrotate: fix patch-kernel.sh invocation

Thanks to Bernhard for noticing.

Modified:
   trunk/buildroot/package/logrotate/logrotate.mk


Changeset:
Modified: trunk/buildroot/package/logrotate/logrotate.mk
===================================================================
--- trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 17:27:39 UTC (rev 25553)
+++ trunk/buildroot/package/logrotate/logrotate.mk	2009-03-05 19:00:11 UTC (rev 25554)
@@ -10,7 +10,7 @@
 
 $(LOGROTATE_DIR)/.source: $(DL_DIR)/$(LOGROTATE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LOGROTATE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ *.patch
+	toolchain/patch-kernel.sh $(LOGROTATE_DIR) package/logrotate/ logrotate\*.patch
 	touch $@
 
 $(LOGROTATE_DIR)/$(LOGROTATE_BINARY): $(LOGROTATE_DIR)/.source
