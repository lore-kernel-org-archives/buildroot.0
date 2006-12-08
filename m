From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  8 Dec 2006 04:45:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20061208124545.265CC485E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-08 04:45:45 -0800 (Fri, 08 Dec 2006)
New Revision: 16813

Log:
- Quote TARGET_PATH. Closes #1107.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-12-08 05:30:00 UTC (rev 16812)
+++ trunk/buildroot/package/Makefile.in	2006-12-08 12:45:45 UTC (rev 16813)
@@ -54,7 +54,8 @@
 STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
 #"))
 
-TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)
+# Quotes are needed for spaces et al in path components.
+TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)"
 IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
