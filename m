From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:01:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090125230123.541D376D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:01:22 +0000 (Sun, 25 Jan 2009)
New Revision: 25026

Log:
Flush configuration cache, needed if config has changed

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-25 21:53:14 UTC (rev 25025)
+++ trunk/buildroot/Makefile	2009-01-25 23:01:22 UTC (rev 25026)
@@ -476,6 +476,9 @@
 distclean: clean
 	rm -rf sources/*
 
+flush:
+	rm -f $(PROJECT_BUILD_DIR)/tgt-config.cache
+
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 %_defconfig: $(CONFIG)/conf
@@ -519,6 +522,7 @@
 	@echo '  source                 - download all sources needed for offline-build'
 	@echo '  source-check           - check all packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
+	@echo '  flush                  - flush configuration cache'
 	@echo
 	@echo 'See docs/README and docs/buildroot.html for further details'
 	@echo
