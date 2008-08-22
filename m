From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 07:01:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080822140156.9712E3C717@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-22 07:01:56 -0700 (Fri, 22 Aug 2008)
New Revision: 23179

Log:
Makefile.autotools.in: remove unused BR2_HAVE_INCLUDES handling

Patch by Wade Berrier.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-22 13:59:06 UTC (rev 23178)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-22 14:01:56 UTC (rev 23179)
@@ -244,9 +244,6 @@
 	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
-	$(if $(BR2_HAVE_INCLUDES),,for d in include; do \
-		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
-	done)
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
