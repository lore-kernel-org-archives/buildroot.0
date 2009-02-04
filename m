From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 23:51:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microperl
Message-ID: <20090204235107.429A176273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 23:51:06 +0000 (Wed, 04 Feb 2009)
New Revision: 25242

Log:
microperl: strip target binary

Modified:
   trunk/buildroot/package/microperl/microperl.mk


Changeset:
Modified: trunk/buildroot/package/microperl/microperl.mk
===================================================================
--- trunk/buildroot/package/microperl/microperl.mk	2009-02-04 23:43:44 UTC (rev 25241)
+++ trunk/buildroot/package/microperl/microperl.mk	2009-02-04 23:51:06 UTC (rev 25242)
@@ -82,7 +82,10 @@
 	 done; \
 	)
 endif
-	cp -dpf $(MICROPERL_DIR)/microperl $(TARGET_DIR)/usr/bin/microperl
+	cp -dpf $(MICROPERL_DIR)/microperl $@
+ifneq ($(BR2_STRIP_none),y)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
+endif
 	(cd $(TARGET_DIR)/usr/bin; rm -f perl; ln -s microperl perl;)
 
 microperl: uclibc $(TARGET_DIR)/usr/bin/microperl
