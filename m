From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 13:00:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mpfr
Message-ID: <20070116210055.7187648560@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 13:00:54 -0800 (Tue, 16 Jan 2007)
New Revision: 17330

Log:
- forgot to mkdir


Modified:
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 19:51:03 UTC (rev 17329)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 21:00:54 UTC (rev 17330)
@@ -36,6 +36,7 @@
 	touch $(MPFR_DIR)/.unpacked
 
 $(MPFR_TARGET_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
+	mkdir -p $(MPFR_TARGET_DIR)
 	(cd $(MPFR_TARGET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
