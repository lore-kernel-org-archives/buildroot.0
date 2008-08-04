From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:06:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/strace
Message-ID: <20080804190611.265323C846@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:06:10 -0700 (Mon, 04 Aug 2008)
New Revision: 23014

Log:
strace: fix LARGEFILE typo

Patch by Claus Klein.

Modified:
   trunk/buildroot/package/strace/strace.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-08-04 19:04:05 UTC (rev 23013)
+++ trunk/buildroot/package/strace/strace.mk	2008-08-04 19:06:10 UTC (rev 23014)
@@ -28,7 +28,7 @@
 
 $(STRACE_DIR)/.configured: $(STRACE_DIR)/.unpacked
 	(cd $(STRACE_DIR); rm -rf config.cache; \
-		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
+		$(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS) $(BR2_STRACE_CFLAGS)" \
