From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Apr 2009 09:21:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [25977] trunk/buildroot/package/liberation
Message-ID: <20090406092133.E2A7277182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-06 09:21:33 +0000 (Mon, 06 Apr 2009)
New Revision: 25977

Log:
liberation: fix continous rebuild

Modified:
   trunk/buildroot/package/liberation/liberation.mk


Changeset:
Modified: trunk/buildroot/package/liberation/liberation.mk
===================================================================
--- trunk/buildroot/package/liberation/liberation.mk	2009-04-06 09:21:30 UTC (rev 25976)
+++ trunk/buildroot/package/liberation/liberation.mk	2009-04-06 09:21:33 UTC (rev 25977)
@@ -16,7 +16,7 @@
 
 $(LIBERATION_DIR)/.unpacked: $(DL_DIR)/$(LIBERATION_SOURCE)
 	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch -c $@
+	touch $@
 
 $(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
 	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
