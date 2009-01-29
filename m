From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Jan 2009 09:34:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20090129093412.2A2BA7741D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-29 09:34:11 +0000 (Thu, 29 Jan 2009)
New Revision: 25115

Log:
make flush, should always be visible

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-01-29 09:33:25 UTC (rev 25114)
+++ trunk/buildroot/Makefile	2009-01-29 09:34:11 UTC (rev 25115)
@@ -473,11 +473,12 @@
 distclean: clean
 	rm -rf sources/*
 
+
+endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
+
 flush:
 	rm -f $(PROJECT_BUILD_DIR)/tgt-config.cache
 
-endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
-
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
 	-@$(MAKE) oldconfig
