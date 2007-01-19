From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 10:00:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070119180051.95C054858C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 10:00:49 -0800 (Fri, 19 Jan 2007)
New Revision: 17384

Log:
- make distclean didn't clean dialog binaries. Closes #1039


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-01-19 17:11:05 UTC (rev 17383)
+++ trunk/buildroot/Makefile	2007-01-19 18:00:49 UTC (rev 17384)
@@ -133,6 +133,7 @@
 	rm -rf $(DL_DIR)
 endif
 	rm -rf $(BUILD_DIR) $(LINUX_KERNEL) $(IMAGE)
+	$(MAKE) -C $(CONFIG) clean
 
 sourceball:
 	rm -rf $(BUILD_DIR)
