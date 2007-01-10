From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue,  9 Jan 2007 22:55:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070110065527.D5074485B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-09 22:55:27 -0800 (Tue, 09 Jan 2007)
New Revision: 17219

Log:
link $(STAGING_DIR)/usr/lib to $(STAGING_DIR)/lib
to make glib2 (and packages with similar confusion) work
properly, while still being able to cross compile


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-01-10 06:54:04 UTC (rev 17218)
+++ trunk/buildroot/Makefile	2007-01-10 06:55:27 UTC (rev 17219)
@@ -101,7 +101,9 @@
 $(STAGING_DIR):
 	@mkdir -p $(STAGING_DIR)/lib
 	@mkdir -p $(STAGING_DIR)/include
+	@mkdir -p $(STAGING_DIR)/usr
 	@mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)
+	@ln -snf ../lib $(STAGING_DIR)/usr/lib
 	@ln -snf ../lib $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib
 
 $(TARGET_DIR):
