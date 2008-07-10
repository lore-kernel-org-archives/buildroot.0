From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:11:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gperf
Message-ID: <20080710101133.F05CBF800C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:11:31 -0700 (Thu, 10 Jul 2008)
New Revision: 22743

Log:
gperf: depend on stamp file rather than gperf binary

There's no make rule to create the gperf binary, only the stamp file
so use that instead.

Modified:
   trunk/buildroot/package/gperf/gperf.mk


Changeset:
Modified: trunk/buildroot/package/gperf/gperf.mk
===================================================================
--- trunk/buildroot/package/gperf/gperf.mk	2008-07-10 10:11:25 UTC (rev 22742)
+++ trunk/buildroot/package/gperf/gperf.mk	2008-07-10 10:11:31 UTC (rev 22743)
@@ -20,7 +20,7 @@
 
 $(eval $(call AUTOTARGETS,package,gperf))
 
-$(GPERF_HOOK_POST_INSTALL): $(TARGET_DIR)/usr/bin/gperf
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $^
+$(GPERF_HOOK_POST_INSTALL): $(GPERF_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
 	touch $@
 
