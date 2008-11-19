From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 19 Nov 2008 02:16:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lockfile-progs
Message-ID: <20081119101640.F36C73C818@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-19 02:16:40 -0800 (Wed, 19 Nov 2008)
New Revision: 24098

Log:
lockfile-progs: fix patch-kernel invocation

Patch by Roberto A. Foglietta.

Closes #6364

Modified:
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk


Changeset:
Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-11-19 09:35:00 UTC (rev 24097)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-11-19 10:16:40 UTC (rev 24098)
@@ -17,7 +17,7 @@
 
 $(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
 	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR) package/lockfile-progs/ *.patch
+	toolchain/patch-kernel.sh $(LOCKFILE_PROGS_DIR) package/lockfile-progs/ \*.patch
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
