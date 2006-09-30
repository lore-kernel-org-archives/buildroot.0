From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 30 Sep 2006 14:08:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20060930210857.40D83485E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-30 14:08:56 -0700 (Sat, 30 Sep 2006)
New Revision: 16278

Log:
- fix bug #1042; Hardcoding system-paths is a bad idea. If some of them are not
  in PATH seen by make then most likely for a very good reason. Set your PATH accordingly if you need /bin or /usr/local/bin et al.


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-09-30 21:05:25 UTC (rev 16277)
+++ trunk/buildroot/package/Makefile.in	2006-09-30 21:08:56 UTC (rev 16278)
@@ -44,7 +44,7 @@
 # Strip off the annoying quoting
 STAGING_DIR:=$(strip $(subst ",, $(BR2_STAGING_DIR)))
 #"
-TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:/bin:/sbin:/usr/bin:/usr/sbin:$(PATH)
+TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)
 IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
