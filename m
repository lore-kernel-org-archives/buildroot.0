Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CCC43334
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 361B881494;
	Tue, 19 Jul 2022 15:47:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 361B881494
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cQua_USIxiB5; Tue, 19 Jul 2022 15:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21E328140E;
	Tue, 19 Jul 2022 15:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E328140E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FFF11BF4D7
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6721140C61
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6721140C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Zl7mnirAe-5 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0888401A2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0888401A2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9843A83D60; Tue, 19 Jul 2022 15:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:46:56 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 21a3af7d653f8e1234ef216e255cf495e6c0bb67
X-Git-Newrev: 5ad8119573af5abe25da5587d9a559f17dd10f47
X-Patchwork-Hint: ignore
Message-Id: <20220719153346.9843A83D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libabseil-cpp:
 fix musl build on mips
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ad8119573af5abe25da5587d9a559f17dd10f47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fix the following musl build failure on mips:

In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
/nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
   49 | #include <sgidefs.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4e56904624cfaf148e0f45837cd9d565ef60c260)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rnal-direct_mmap-h-fix-musl-build-on-mips.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch b/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
new file mode 100644
index 0000000000..0f77236843
--- /dev/null
+++ b/package/libabseil-cpp/0003-PR-1197-absl-base-internal-direct_mmap-h-fix-musl-build-on-mips.patch
@@ -0,0 +1,55 @@
+From 53a90f079af7ab491530d432bb318a95371ba877 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 16 Jun 2022 14:28:53 -0700
+Subject: [PATCH] PR #1197: absl/base/internal/direct_mmap.h: fix musl build on
+ mips
+
+Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1197
+
+Fix the following musl build failure on mips:
+
+```
+In file included from /nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/low_level_alloc.cc:26:
+/nvmedata/autobuild/instance-15/output-1/build/libabseil-cpp-20211102.0/absl/base/internal/direct_mmap.h:49:10: fatal error: sgidefs.h: No such file or directory
+   49 | #include <sgidefs.h>
+      |          ^~~~~~~~~~~
+```
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3fa027e602bacb22316fb5d9b233baa0b0f0e845
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Merge c9b5b5c5471213a871f7d6d1d2fc8f6899effbac into a184bab83ffcffc2aaac49a3900361158ab3890f
+
+Merging this change closes #1197
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1197 from ffontaine:master c9b5b5c5471213a871f7d6d1d2fc8f6899effbac
+PiperOrigin-RevId: 455467767
+Change-Id: I1905f7d70e914288bc1524a52adce3476a779fd8
+
+[Retrieved from:
+https://github.com/abseil/abseil-cpp/commit/53a90f079af7ab491530d432bb318a95371ba877]
+---
+ absl/base/internal/direct_mmap.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
+index a01d61220..e492bb004 100644
+--- a/absl/base/internal/direct_mmap.h
++++ b/absl/base/internal/direct_mmap.h
+@@ -41,13 +41,13 @@
+ 
+ #ifdef __mips__
+ // Include definitions of the ABI currently in use.
+-#ifdef __BIONIC__
++#if defined(__BIONIC__) || !defined(__GLIBC__)
+ // Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
+ // definitions we need.
+ #include <asm/sgidefs.h>
+ #else
+ #include <sgidefs.h>
+-#endif  // __BIONIC__
++#endif  // __BIONIC__ || !__GLIBC__
+ #endif  // __mips__
+ 
+ // SYS_mmap and SYS_munmap are not defined in Android.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
