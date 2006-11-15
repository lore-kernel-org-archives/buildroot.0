From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 15 Nov 2006 13:00:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20061115210007.A502B48576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-15 13:00:07 -0800 (Wed, 15 Nov 2006)
New Revision: 16533

Log:
make certain the target directory exists


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-11-15 06:52:00 UTC (rev 16532)
+++ trunk/buildroot/Makefile	2006-11-15 21:00:07 UTC (rev 16533)
@@ -103,6 +103,7 @@
 	@ln -snf ../lib $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib
 
 $(TARGET_DIR):
+	mkdir -p $(TARGET_DIR)
 	if [ -d "$(TARGET_SKELETON)" ] ; then \
 		cp -fa $(TARGET_SKELETON)/* $(TARGET_DIR)/; \
 	fi;
