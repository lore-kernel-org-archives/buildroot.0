From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 25 Apr 2008 05:04:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/squashfs
Message-ID: <20080425120405.5842E3C78C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-25 05:04:04 -0700 (Fri, 25 Apr 2008)
New Revision: 21858

Log:
squashfs: set sensible permissions on squashfs image


Modified:
   trunk/buildroot/target/squashfs/squashfsroot.mk


Changeset:
Modified: trunk/buildroot/target/squashfs/squashfsroot.mk
===================================================================
--- trunk/buildroot/target/squashfs/squashfsroot.mk	2008-04-25 11:45:28 UTC (rev 21857)
+++ trunk/buildroot/target/squashfs/squashfsroot.mk	2008-04-25 12:04:04 UTC (rev 21858)
@@ -69,6 +69,7 @@
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	chmod 0644 $(SQUASHFS_TARGET)
 	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 
 squashfsroot-source: squashfs-source
