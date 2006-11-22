From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 13:24:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
Message-ID: <20061122212459.3EC24485FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 13:24:58 -0800 (Wed, 22 Nov 2006)
New Revision: 16637

Log:


Modified:
   trunk/buildroot/target/cpio/cpioroot.mk


Changeset:
Modified: trunk/buildroot/target/cpio/cpioroot.mk
===================================================================
--- trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 21:02:21 UTC (rev 16636)
+++ trunk/buildroot/target/cpio/cpioroot.mk	2006-11-22 21:24:58 UTC (rev 16637)
@@ -7,6 +7,7 @@
 CPIO_TARGET:=$(IMAGE).cpio
 
 cpioroot-init:
+	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
 
 cpioroot: host-fakeroot makedevs cpioroot-init
