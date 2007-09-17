From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 05:40:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070917124042.9B1523005D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 05:40:42 -0700 (Mon, 17 Sep 2007)
New Revision: 19868

Log:
make source should include BASE_TARGETS

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-17 12:30:31 UTC (rev 19867)
+++ trunk/buildroot/Makefile	2007-09-17 12:40:42 UTC (rev 19868)
@@ -217,6 +217,7 @@
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
+BASE_TARGETS_SOURCE:=$(patsubst %,%-source,$(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 # all targets depend on the crosscompiler and it's prerequisites
@@ -283,7 +284,7 @@
 erase-fakeroots:
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
-source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: $(BASE_TARGETS_SOURCE) $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
 	$(MAKE) SPIDER=--spider source
@@ -429,3 +430,12 @@
 
 .PHONY: dummy subdirs release distclean clean config oldconfig \
 	menuconfig tags check test depend defconfig help
+
+
+dbg:
+	echo BASE_TARGETS_SOURCE=$(BASE_TARGETS_SOURCE)
+	echo BASE_TARGETS=$(BASE_TARGETS)
+	echo TARGETS_SOURCE=$(TARGETS_SOURCE)
+	echo TARGETS=$(TARGETS)
+
+bsource:	
