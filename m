From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20080804190801.A6EEF3C8CD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:01 -0700 (Mon, 04 Aug 2008)
New Revision: 23030

Log:
ccache: also remove target symlinks on clean

Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-08-04 19:07:58 UTC (rev 23029)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-08-04 19:08:01 UTC (rev 23030)
@@ -183,7 +183,8 @@
 ccache_target-sources: $(DL_DIR)/$(CCACHE_SOURCE)
 
 ccache_target-clean:
-	rm -f $(TARGET_DIR)/$(CCACHE_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/$(CCACHE_TARGET_BINARY) \
+	      $(addprefix $(TARGET_DIR)/bin/,cc gcc c++ g++)
 	-$(MAKE) -C $(CCACHE_DIR2) clean
 
 ccache_target-dirclean:
