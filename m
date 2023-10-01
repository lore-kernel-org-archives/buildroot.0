Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A90E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 07:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCD7140545;
	Sun,  1 Oct 2023 07:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD7140545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 857VtV3_FLg9; Sun,  1 Oct 2023 07:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBEC941705;
	Sun,  1 Oct 2023 07:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBEC941705
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3DD81BF909
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 07:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E24940545
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 07:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E24940545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bwINh8ois0_j for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 07:36:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452694014E
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 07:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452694014E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3011A83D5A; Sun,  1 Oct 2023 07:36:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 09:35:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f2de3da7e1a5af4e2773ff6bb9e528159be7d3
X-Git-Newrev: ceb5b326b8cd2a8d41eff1c843c2b196a2d3f2c8
X-Patchwork-Hint: ignore
Message-Id: <20231001073647.3011A83D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20230929
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ceb5b326b8cd2a8d41eff1c843c2b196a2d3f2c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove backported patch from this release.

Upstream commit from this release [1] very likely fixes failure
undefined reference to `__stack_chk_fail'.

[1] https://github.com/linux-test-project/ltp/commit/72891ca1efb61787cc78a81ef3e379f3fea77ac1

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-configure.ac-fix-mount_attr-detection.patch | 54 ----------------------
 package/ltp-testsuite/ltp-testsuite.hash           |  4 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  2 +-
 3 files changed, 3 insertions(+), 57 deletions(-)

diff --git a/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
deleted file mode 100644
index 740d3a6d6a..0000000000
--- a/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 30353a1eb3ee8940f38d6a0e8f5f39352fd8a179 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Feb 2023 20:25:54 +0100
-Subject: [PATCH] configure.ac: fix mount_attr detection
-Upstream: https://github.com/linux-test-project/ltp/commit/30353a1eb3ee8940f38d6a0e8f5f39352fd8a179
-
-Commit b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60 tried to fix build with
-latest glibc which provides mount_attr in sys/mount.h. Unfortunately,
-the following build failure is still raised because sys/mount is now
-unconditionally included in include/lapi/fsmount.h:
-
-In file included from fsconfig01.c:9:
-../../../../include/lapi/fsmount.h:55:8: error: redefinition of 'struct mount_attr'
-   55 | struct mount_attr {
-      |        ^~~~~~~~~~
-In file included from ../../../../include/lapi/fsmount.h:14:
-/home/autobuild/autobuild/instance-4/output-1/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/sys/mount.h:210:8: note: originally defined here
-  210 | struct mount_attr
-      |        ^~~~~~~~~~
-
-Fixes: b857f8723 ("lapi/fsmount: resolve conflict in different header files")
-Fixes: http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865
-Link: https://lore.kernel.org/ltp/20230226192554.669332-1-fontaine.fabrice@gmail.com/
-Reviewed-by: Li Wang <liwang@redhat.com>
-[ pvorel: fix from b857f8723 is needed for glibc before glibc-2.37~426,
-i.e. without fix 774058d729 ("linux: Fix sys/mount.h usage with kernel headers")
-(which was backported to 2.35 and 2.34 maintenance). ]
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 114468ae3..4c8763376 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -224,10 +224,10 @@ AC_CHECK_TYPES([struct __kernel_old_timeval, struct __kernel_old_timespec, struc
- 
- AC_CHECK_TYPES([struct futex_waitv],,,[#include <linux/futex.h>])
- AC_CHECK_TYPES([struct mount_attr],,,[
--#ifdef HAVE_LINUX_MOUNT_H
--# include <linux/mount.h>
--#else
-+#ifdef HAVE_MOUNT_SETATTR
- # include <sys/mount.h>
-+#elif HAVE_LINUX_MOUNT_H
-+# include <linux/mount.h>
- #endif
- ])
- 
--- 
-2.40.0
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 59ba5d0045..2e84e978d1 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20230127/ltp-full-20230127.tar.xz.sha256
-sha256  254412a52c7238f35a247337da186f485e76fb64c6549ed849b3442fc7a417ef  ltp-full-20230127.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20230929/ltp-full-20230929.tar.xz.sha256
+sha256  eb161ff8f1966a1f3428fd4561eb20ebb9f83b7519e35cc12fc66bcfa7983b6b  ltp-full-20230929.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 78271b0730..2a8c12fc25 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20230127
+LTP_TESTSUITE_VERSION = 20230929
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
