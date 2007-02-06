From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  6 Feb 2007 10:35:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070206183538.1041E48688@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-06 10:35:37 -0800 (Tue, 06 Feb 2007)
New Revision: 17801

Log:
- also wipe the files installed into the target for uclibc_target-clean


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-06 18:19:38 UTC (rev 17800)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-06 18:35:37 UTC (rev 17801)
@@ -335,7 +335,8 @@
 uclibc_target: gcc uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
 uclibc_target-clean:
-	rm -rf $(TARGET_DIR)/usr/include
+	rm -rf $(TARGET_DIR)/usr/include \
+		$(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
 uclibc_target-dirclean:
 	rm -rf $(TARGET_DIR)/usr/include
