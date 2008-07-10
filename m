From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 01:17:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gperf
Message-ID: <20080710081736.8A8BE3C75F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 01:17:35 -0700 (Thu, 10 Jul 2008)
New Revision: 22737

Log:
gperf: strip target binary

Modified:
   trunk/buildroot/package/gperf/gperf.mk


Changeset:
Modified: trunk/buildroot/package/gperf/gperf.mk
===================================================================
--- trunk/buildroot/package/gperf/gperf.mk	2008-07-10 03:27:42 UTC (rev 22736)
+++ trunk/buildroot/package/gperf/gperf.mk	2008-07-10 08:17:35 UTC (rev 22737)
@@ -20,3 +20,7 @@
 
 $(eval $(call AUTOTARGETS,package,gperf))
 
+$(GPERF_HOOK_POST_INSTALL): $(TARGET_DIR)/usr/bin/gperf
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $^
+	touch $@
+
