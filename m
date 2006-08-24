From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 12:35:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20060824193548.5F2FFC80FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 12:35:47 -0700 (Thu, 24 Aug 2006)
New Revision: 15979

Log:
- pickup the PATH the user has set.
  Fixes HOSTCC et al being installed in e.g. /opt where it wasn't found before.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-08-24 19:13:14 UTC (rev 15978)
+++ trunk/buildroot/package/Makefile.in	2006-08-24 19:35:47 UTC (rev 15979)
@@ -44,7 +44,7 @@
 # Strip off the annoying quoting
 STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
 #"
-TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:/bin:/sbin:/usr/bin:/usr/sbin
+TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:/bin:/sbin:/usr/bin:/usr/sbin:$(PATH)
 IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
