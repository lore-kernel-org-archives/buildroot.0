From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  4 Jan 2009 05:59:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/m4
Message-ID: <20090104055956.319E4769EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-04 05:59:54 +0000 (Sun, 04 Jan 2009)
New Revision: 24681

Log:
Use target ar & ranlib when generating static archives, libm4.a was being built with the host ar and ranlib


Modified:
   trunk/buildroot/package/m4/m4.mk


Changeset:
Modified: trunk/buildroot/package/m4/m4.mk
===================================================================
--- trunk/buildroot/package/m4/m4.mk	2009-01-04 02:58:58 UTC (rev 24680)
+++ trunk/buildroot/package/m4/m4.mk	2009-01-04 05:59:54 UTC (rev 24681)
@@ -50,7 +50,7 @@
 	touch $@
 
 $(M4_DIR)/src/$(M4_BINARY): $(M4_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(M4_DIR)
+	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(M4_DIR)
 
 $(TARGET_DIR)/$(M4_TARGET_BINARY): $(M4_DIR)/src/$(M4_BINARY)
 	$(MAKE) \
