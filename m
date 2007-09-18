From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 18 Sep 2007 06:12:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070918131225.2B148A6580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-18 06:12:25 -0700 (Tue, 18 Sep 2007)
New Revision: 19877

Log:
- forgot to put base-target's sources into the source target.
  Thanks to Ulf for pointing out this error of mine..


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-18 13:02:25 UTC (rev 19876)
+++ trunk/buildroot/Makefile	2007-09-18 13:12:25 UTC (rev 19877)
@@ -216,8 +216,7 @@
 TARGETS+=erase-fakeroots
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
-BASE_TARGETS_SOURCE:=$(patsubst %,%-source,$(BASE_TARGETS))
+TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
 TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 # all targets depend on the crosscompiler and it's prerequisites
@@ -284,7 +283,7 @@
 erase-fakeroots:
 	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
 
-source: $(BASE_TARGETS_SOURCE) $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:
 	$(MAKE) SPIDER=--spider source
