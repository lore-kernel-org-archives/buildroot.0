From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 17 Apr 2007 10:12:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20070417171248.B480A48611@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-17 10:12:48 -0700 (Tue, 17 Apr 2007)
New Revision: 18479

Log:
- make sure that our dest dir exists


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-04-17 17:11:42 UTC (rev 18478)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2007-04-17 17:12:48 UTC (rev 18479)
@@ -97,7 +97,7 @@
 
 
 $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26: $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY)
-	cp $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
+	$(INSTALL) -D $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
 
 cross-depmod26: $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
 
