From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri,  7 Mar 2008 08:54:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080307165445.F0789120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-07 08:54:45 -0800 (Fri, 07 Mar 2008)
New Revision: 21275

Log:
remove .a files from lib directories after install

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-03-07 14:12:14 UTC (rev 21274)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-03-07 16:54:45 UTC (rev 21275)
@@ -231,6 +231,9 @@
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
 	find $(TARGET_DIR) -name '*.la' -delete
+	find $(TARGET_DIR)/lib -name '*.a' -delete
+	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
+
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
