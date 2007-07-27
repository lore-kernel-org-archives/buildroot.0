From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 08:29:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070727152913.3CC0AA4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 08:29:12 -0700 (Fri, 27 Jul 2007)
New Revision: 19284

Log:
- explicitely list base targets for World


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-27 15:10:45 UTC (rev 19283)
+++ trunk/buildroot/Makefile	2007-07-27 15:29:12 UTC (rev 19284)
@@ -213,7 +213,7 @@
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(BINARIES_DIR) $(PROJECT_BUILD_DIR)
 $(BASE_TARGETS): dirs
-world: dependencies dirs target-host-info $(TARGETS)
+world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS)
 
 
 .PHONY: all world dirs clean dirclean distclean source target-host-info \
