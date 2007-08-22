From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 22 Aug 2007 02:29:50 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/bash
Message-ID: <20070822092950.5BEE8A65AD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-22 02:29:49 -0700 (Wed, 22 Aug 2007)
New Revision: 19636

Log:
Fix bad patch naming scheme

Modified:
   trunk/buildroot/package/bash/bash.mk


Changeset:
Modified: trunk/buildroot/package/bash/bash.mk
===================================================================
--- trunk/buildroot/package/bash/bash.mk	2007-08-22 09:22:32 UTC (rev 19635)
+++ trunk/buildroot/package/bash/bash.mk	2007-08-22 09:29:49 UTC (rev 19636)
@@ -19,7 +19,7 @@
 bash-unpacked: $(BASH_DIR)/.unpacked
 $(BASH_DIR)/.unpacked: $(DL_DIR)/$(BASH_SOURCE)
 	$(BASH_CAT) $(DL_DIR)/$(BASH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(BASH_DIR) package/bash/ bash??-*
+	toolchain/patch-kernel.sh $(BASH_DIR) package/bash/ bash??-\*
 	# This is broken when -lintl is added to LIBS
 	$(SED) 's,LIBS_FOR_BUILD =.*,LIBS_FOR_BUILD =,g' \
 		$(BASH_DIR)/builtins/Makefile.in
