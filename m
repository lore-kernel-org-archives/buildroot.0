From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:12:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20070206181223.29C1848655@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:12:22 -0800 (Tue, 06 Feb 2007)
New Revision: 17797

Log:
When cleaning, get rid of the binary from the filesystem area too.


Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2007-02-06 18:11:59 UTC (rev 17796)
+++ trunk/buildroot/package/strace/strace.mk	2007-02-06 18:12:22 UTC (rev 17797)
@@ -66,6 +66,7 @@
 strace: uclibc $(TARGET_DIR)/usr/bin/strace 
 
 strace-clean: 
+	rm -f $(TARGET_DIR)/usr/bin/strace
 	$(MAKE) -C $(STRACE_DIR) clean
 
 strace-dirclean: 
