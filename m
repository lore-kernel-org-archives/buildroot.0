From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 12:30:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090116123009.05052774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 12:30:07 +0000 (Fri, 16 Jan 2009)
New Revision: 24873

Log:
DOWNLOAD: don't use := assignment for function implementation

:= causes the function parameters to get evaluated at definition time
instead of implementation time, which is kind of silly for a function.

Fixes make source-check / external-deps

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-16 12:07:53 UTC (rev 24872)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-16 12:30:07 UTC (rev 24873)
@@ -134,7 +134,7 @@
 
 # support make source-check/external-deps
 ifneq ($(SPIDER),)
-DOWNLOAD:=$(WGET) -P $(DL_DIR) $(1)/$(2)
+DOWNLOAD=$(WGET) -P $(DL_DIR) $(1)/$(2)
 else
 define DOWNLOAD
 	$(Q)test -e $(DL_DIR)/$(2) || \
