From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 00:49:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20061128084917.C786848576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 00:49:17 -0800 (Tue, 28 Nov 2006)
New Revision: 16701

Log:
- Change LC_ALL=POSIX to LC_ALL=C and remove LANG=C as suggested by vapier.


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2006-11-28 00:46:49 UTC (rev 16700)
+++ trunk/buildroot/target/ext2/ext2root.mk	2006-11-28 08:49:17 UTC (rev 16701)
@@ -86,7 +86,7 @@
 		>> $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
-	GENEXT2_REALSIZE=`LANG=C LC_ALL=POSIX du -l -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \
+	GENEXT2_REALSIZE=`LC_ALL=C du -l -s -c -k $(TARGET_DIR) | grep total | sed -e "s/total//"`; \
 	GENEXT2_ADDTOROOTSIZE=`if [ $$GENEXT2_REALSIZE -ge 20000 ] ; then echo 16384; else echo 2400; fi`; \
 	GENEXT2_SIZE=`expr $$GENEXT2_REALSIZE + $$GENEXT2_ADDTOROOTSIZE`; \
 	GENEXT2_ADDTOINODESIZE=`find $(TARGET_DIR) | wc -l`; \
