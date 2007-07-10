From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 10 Jul 2007 04:34:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/sstrip
Message-ID: <20070710113434.099DCA687E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-10 04:34:22 -0700 (Tue, 10 Jul 2007)
New Revision: 19058

Log:
- fix building sstrip


Modified:
   trunk/buildroot/toolchain/sstrip/sstrip.mk


Changeset:
Modified: trunk/buildroot/toolchain/sstrip/sstrip.mk
===================================================================
--- trunk/buildroot/toolchain/sstrip/sstrip.mk	2007-07-09 18:36:01 UTC (rev 19057)
+++ trunk/buildroot/toolchain/sstrip/sstrip.mk	2007-07-10 11:34:22 UTC (rev 19058)
@@ -15,11 +15,12 @@
 SSTRIP_HOST:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 
 $(SSTRIP_HOST): $(SSTRIP_SOURCE_FILE)
+	-mkdir -p $(@D) $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
+	$(HOSTCC) $(CFLAGS_FOR_BUILD) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
 	ln -snf ../../bin/$(REAL_GNU_TARGET_NAME)-sstrip \
 		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/sstrip
 	ln -snf $(REAL_GNU_TARGET_NAME)-sstrip \
 		$(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
-	$(HOSTCC) $(SSTRIP_SOURCE_FILE) -o $(SSTRIP_HOST)
 
 sstrip_host: $(SSTRIP_HOST)
 
