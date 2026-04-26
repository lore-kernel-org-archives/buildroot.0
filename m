Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3E2FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 110238064F;
	Sun, 26 Apr 2026 16:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sG2UXyTcOTcJ; Sun, 26 Apr 2026 16:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03FF80666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777219205;
	bh=NUVYwRZbH4b+2y8wb8URUIyZJlCV+/PHMOZUuCsE1/U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nGfHKS3xAq7Z2TOnKB5Idoyy4vYcuJVD57naloBUtPc0MQWKctps7o0nFmP37/hJd
	 H3Lu9/q6C68VswosmwcR+PqXWdcxm8ttyG0lA7tHK5HP3a9ZUyNQJm11Bg7FjiwkUw
	 rX15gaajgPezqoewVg0FX1SiVxDUaZUT2OsJUywDQW6s3iYpLlK18B1AVMam5M316Z
	 B3nb/nrOWT8D+TWwc5Xt9E0euwxiqmAeF4Dw1rOjFJUnVIvqb7L4LW+sXzPa2LCV/P
	 zeiKD9C1LOlSmftCI+Il6HvcPjvVOEcQyb1Z2Je+KNBuva0Q7wySlOa8S7O4Xum3B2
	 UIe3seyt8YZeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D03FF80666;
	Sun, 26 Apr 2026 16:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BCB2DF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0B240524
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKXQ7m0hjrJd for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 16:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B518D404E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B518D404E9
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 16:00:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66CAA836D2; Sun, 26 Apr 2026 16:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Apr 2026 17:40:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24479bf29ab607c2477641ec60369db40761e7ca
X-Git-Newrev: 4d5ccd553ad4383bdcfdf5cbd1265419ad7d6777
X-Patchwork-Hint: ignore
Message-Id: <20260426160002.66CAA836D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mdadm: bump to version 4.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d5ccd553ad4383bdcfdf5cbd1265419ad7d6777
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop upstreamed/backported patches.

Release announcements:
4.6: https://lore.kernel.org/linux-raid/CALTww2_2pjjOSsVj-WT++m35555CjnPWokU7fut+HwUJVV-=ZQ@mail.gmail.com/
4.5: https://lore.kernel.org/linux-raid/CALTww293wnLE2+eZsZ42oyNZhS_cc2agB4GNqTz8j3xiP0ALWA@mail.gmail.com/
4.4: https://lore.kernel.org/linux-raid/20241213121438.7ed6a0fd@mtkaczyk-private-dev/

Upstream mdadm project has moved its primary development to GitHub:
https://github.com/md-raid-utilities/mdadm
Updated download site accordingly. See:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/README.md?id=3f90be087fa62c0c7ed76c2ac26752f0ac3a89e7

mdadm >= 4.5 removed fallback definitions for MD_DISK_FAILFAST
(commit f5889f9a1b8753a1472dfef9d025da2bae395239), relying on
kernel headers instead.This breaks builds with toolchains using older headers
(e.g. 4.9). So, enforce BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10.

Since mdadm 4.6, `mdadm --create` may prompt for bitmap configuration,
which breaks the runtime test.Fix the test by passing `--bitmap=none`
to keep it non-interactive.

Signed-off-by: Maxin John <maxin.john@gmail.com>
[Julien:
 - add comment in Config.in
 - add link to upstream commit for repository change in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch | 34 ------------------
 ...-limits-h-include-for-NAME_MAX-definition.patch | 32 -----------------
 package/mdadm/0003-Create.c-fix-uclibc-build.patch | 42 ----------------------
 .../mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch  | 40 ---------------------
 package/mdadm/Config.in                            |  4 +++
 package/mdadm/mdadm.hash                           |  5 +--
 package/mdadm/mdadm.mk                             |  5 ++-
 support/testing/tests/package/test_mdadm.py        |  2 +-
 8 files changed, 10 insertions(+), 154 deletions(-)

diff --git a/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch b/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
deleted file mode 100644
index 5c3d6e03b4..0000000000
--- a/package/mdadm/0001-udev-c-Do-not-require-libudev-h-if-DNO_LIBUDEV.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1750758c7ff526e3560433f6235e5cfa35cf646a Mon Sep 17 00:00:00 2001
-From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Date: Wed, 6 Mar 2024 15:50:55 +0100
-Subject: udev.c: Do not require libudev.h if DNO_LIBUDEV
-
-libudev may not be presented at all, do not require it.
-
-Reported-by: Boian Bonev <bbonev@ipacct.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=1750758c7ff526e3560433f6235e5cfa35cf646a
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- udev.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/udev.c b/udev.c
-index bc4722b0..066e6ab1 100644
---- a/udev.c
-+++ b/udev.c
-@@ -26,7 +26,10 @@
- #include	<signal.h>
- #include	<limits.h>
- #include	<syslog.h>
-+
-+#ifndef NO_LIBUDEV
- #include	<libudev.h>
-+#endif
- 
- static char *unblock_path;
- 
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch b/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
deleted file mode 100644
index ceaf7f923c..0000000000
--- a/package/mdadm/0002-util-c-add-limits-h-include-for-NAME_MAX-definition.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8bda86099089b44129ef6206764f9de47a45f0db Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 12 Mar 2024 11:01:50 +0100
-Subject: util.c: add limits.h include for NAME_MAX definition
-
-Add limits.h include for NAME_MAX definition.
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=8bda86099089b44129ef6206764f9de47a45f0db
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util.c b/util.c
-index 05ad3343..49a9c6e2 100644
---- a/util.c
-+++ b/util.c
-@@ -36,7 +36,7 @@
- #include	<ctype.h>
- #include	<dirent.h>
- #include	<dlfcn.h>
--
-+#include	<limits.h>
- 
- /*
-  * following taken from linux/blkpg.h because they aren't
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0003-Create.c-fix-uclibc-build.patch b/package/mdadm/0003-Create.c-fix-uclibc-build.patch
deleted file mode 100644
index c8399be076..0000000000
--- a/package/mdadm/0003-Create.c-fix-uclibc-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 52bead95d2957437c691891fcdc49bd6afccdd49 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 12 Apr 2024 18:45:13 +0200
-Subject: Create.c: fix uclibc build
-
-Define FALLOC_FL_ZERO_RANGE if needed as FALLOC_FL_ZERO_RANGE is only
-defined for aarch64 on uclibc-ng resulting in the following or1k build
-failure since commit 577fd10486d8d1472a6b559066f344ac30a3a391:
-
-Create.c: In function 'write_zeroes_fork':
-Create.c:155:35: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  155 |                 if (fallocate(fd, FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE,
-      |                                   ^~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/0e04bcdb591ca5642053e1f7e31384f06581e989
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=52bead95d2957437c691891fcdc49bd6afccdd49
----
- Create.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/Create.c b/Create.c
-index 4397ff49..d94253b1 100644
---- a/Create.c
-+++ b/Create.c
-@@ -32,6 +32,10 @@
- #include	<sys/signalfd.h>
- #include	<sys/wait.h>
- 
-+#ifndef FALLOC_FL_ZERO_RANGE
-+#define FALLOC_FL_ZERO_RANGE 16
-+#endif
-+
- static int round_size_and_verify(unsigned long long *size, int chunk)
- {
- 	if (*size == 0)
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch b/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
deleted file mode 100644
index 4d46d58230..0000000000
--- a/package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 893a55831e5abbcd15b171db66fa1f389fb61506 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 7 May 2024 19:32:16 +0200
-Subject: Makefile: Move -pie to LDFLAGS
-
-Move -pie from LDLIBS to LDFLAGS and make LDFLAGS configurable to allow
-the user to drop it by setting their own LDFLAGS (e.g. PIE could be
-enabled or disabled by the buildsystem such as buildroot).
-
-Suggested-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Signed-off-by: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
-
-Upstream: https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=893a55831e5abbcd15b171db66fa1f389fb61506
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7c221a89..adac7905 100644
---- a/Makefile
-+++ b/Makefile
-@@ -132,12 +132,12 @@ CFLAGS += -DUSE_PTHREADS
- MON_LDFLAGS += -pthread
- endif
- 
--LDFLAGS = -Wl,-z,now,-z,noexecstack
-+LDFLAGS ?= -pie -Wl,-z,now,-z,noexecstack
- 
- # If you want a static binary, you might uncomment these
- # LDFLAGS += -static
- # STRIP = -s
--LDLIBS = -ldl -pie
-+LDLIBS = -ldl
- 
- # To explicitly disable libudev, set -DNO_LIBUDEV in CXFLAGS
- ifeq (, $(findstring -DNO_LIBUDEV,  $(CXFLAGS)))
--- 
-cgit 1.2.3-korg
-
diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 8c6bb08adc..eb1a4675f2 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MDADM
 	bool "mdadm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10 # MD_DISK_FAILFAST
 	help
 	  Utility for managing Linux Software RAID arrays.
 
@@ -10,3 +11,6 @@ config BR2_PACKAGE_MDADM
 comment "mdadm needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
+
+comment "mdadm needs kernel headers >= 4.10"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index 84bae1aebf..90c7c0728e 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,4 +1,5 @@
-# From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256  416727ae1f1080ea6e3090cea36dd076826fc369151e36ab736557ba92196f9f  mdadm-4.3.tar.xz
+# Locally calculated
+sha256  202a7525e6f2b44395a9ef2c561082c7d6d8204e9addfe3f6268bfb141efc093  mdadm-4.6.tar.gz
+
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 421f06d695..785616f1c5 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.3
-MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
-MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
+MDADM_VERSION = 4.6
+MDADM_SITE = https://github.com/md-raid-utilities/mdadm/archive/refs/tags
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 MDADM_CPE_ID_VALID = YES
diff --git a/support/testing/tests/package/test_mdadm.py b/support/testing/tests/package/test_mdadm.py
index d5abdb0706..095d0fd8be 100644
--- a/support/testing/tests/package/test_mdadm.py
+++ b/support/testing/tests/package/test_mdadm.py
@@ -69,7 +69,7 @@ class TestMdadm(infra.basetest.BRTest):
         self.assertRunOk(cat_mdstat_cmd)
 
         # We create a raid5 array with the drives.
-        cmd = f"mdadm --create --verbose {md_dev} --level=5 "
+        cmd = f"mdadm --create --verbose {md_dev} --level=5 --bitmap=none "
         cmd += f"--raid-devices={len(storage_devs)} "
         cmd += " ".join(storage_devs)
         self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
