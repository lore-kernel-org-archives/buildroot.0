Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08462C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 08:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 891D940868;
	Tue, 14 Jul 2026 08:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgOuOqFMZoyG; Tue, 14 Jul 2026 08:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDCBD408CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784018536;
	bh=4AuGzPxj3QeWeAisGs5y37ls9KVE3XSB5GFRpjnPc3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QA/IuPB5KdfAXfQAYJVAf4IiSR9fHLM7egR7Vdtgo5mW9W17yO5LCX5OF5BP4Gu3O
	 EeXq2WJKcI1ml5EvKH/kyh5JZVJ0AlHg2v3qslgHrcewgKpjy3B+Wh0lclVPxFS/do
	 dDSRyPwdZk6RZ/jfEF/HF0HVg+IAqGIZTwuosoBysCxcyJUccR0NwebwDnXEAEUJ5o
	 DkNDp2hSqs2PpKVnpfLOcHItoPc1JDW+mDsp+erAqC5C3oLmi0EXGfmUbRzzXHKZ4+
	 kbtryDkn4ERV4cVAIcc6+2kcQ9wOQ3PSDXbRykjdY5gt4A6kg0OHrYgS6HcV1R+wFD
	 dKcwND3ES6Kbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCBD408CA;
	Tue, 14 Jul 2026 08:42:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50476128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E17A40423
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E87b3ISDlaqB for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 08:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74BA04009E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74BA04009E
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C25E288798; Tue, 14 Jul 2026 08:41:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 10:38:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 781d14e63a838d7b90c4fe75f091bebf1d5d58a6
X-Git-Newrev: e227b99a3c450b62fa44d380f91f84828a90fed3
X-Patchwork-Hint: ignore
Message-Id: <20260714084138.C25E288798@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: bump version to 2.5
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
Content-Type: multipart/mixed; boundary="===============0618891472143141055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0618891472143141055==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e227b99a3c450b62fa44d380f91f84828a90fed3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-June/003710.html

Added patch 0002 to fix musl build error introduced by this bump due to
upstream commit
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/62da56c849c37a3a532fb1979e47e32d0dd88e65

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-xe_madvise-Fix-the-type-for-sighandler_t.patch | 46 ++++++++++++++++++++++
 package/igt-gpu-tools/igt-gpu-tools.hash           |  6 +--
 package/igt-gpu-tools/igt-gpu-tools.mk             |  2 +-
 3 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch b/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch
new file mode 100644
index 0000000000..7ee34b1fc8
--- /dev/null
+++ b/package/igt-gpu-tools/0002-tests-intel-xe_madvise-Fix-the-type-for-sighandler_t.patch
@@ -0,0 +1,46 @@
+From e807c4cd97c3e9bbbd89026cf9ed0b16b02ef397 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 10 Jul 2026 20:35:22 +0200
+Subject: [PATCH] tests/intel/xe_madvise: Fix the type for sighandler_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+__sighandler_t is private interface in glibc so its
+better to not use it, as an aside fixes build with musl
+
+Patch was inspired by
+https://lists.gnu.org/r/bug-time/2025-03/msg00000.html
+
+Fixes build error seen with musl-based toolchains:
+
+../tests/intel/xe_madvise.c: In function ‘test_dontneed_after_mmap’:
+../tests/intel/xe_madvise.c:400:48: error: ‘__sighandler_t’ undeclared
+ (first use in this function); did you mean ‘sighandler_t’?
+  400 |          old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+
+Upstream: https://patchwork.freedesktop.org/patch/739160/?series=170207&rev=1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ tests/intel/xe_madvise.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
+index 3d36be941..a33a08630 100644
+--- a/tests/intel/xe_madvise.c
++++ b/tests/intel/xe_madvise.c
+@@ -397,8 +397,8 @@ static void test_dontneed_after_mmap(int fd)
+ 		char *ptr = (char *)map;
+ 		int sig;
+ 
+-		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+-		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
++		old_sigsegv = signal(SIGSEGV, (sighandler_t)sigtrap);
++		old_sigbus = signal(SIGBUS, (sighandler_t)sigtrap);
+ 
+ 		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
+ 		switch (sig) {
+-- 
+2.47.3
+
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index b66d856da9..f0c6ceff2f 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-March/003676.html
-sha256  a44b7d089a27555944d4cd5da372c9339501539e3cd2735bbdb30e0d802f1cbe  igt-gpu-tools-2.4.tar.xz
-sha512  3f8e8202e3a613faf077ecb3fcc6a13840a8df94f94cb7d3a7933e51888757ea22e4154f2e0f88b896583e23bc8fd472bd286a0b50630b8b5eeb13878a1a2d9f  igt-gpu-tools-2.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-June/003710.html
+sha256  bf5ee5cc1e2b92c456d626b7986be9e2d18b4765cd06c28c1ab449200c1ce5e2  igt-gpu-tools-2.5.tar.xz
+sha512  0da8f56a76bb79186da95545be63b8fa82c93edfe9b5fe6ffe43017deb792601545bba292c516b525e1e29087e9b048751df4875d8a7a64e265bac943bf6be81  igt-gpu-tools-2.5.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index 5dcbdcaab5..cbbbc74a4c 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 2.4
+IGT_GPU_TOOLS_VERSION = 2.5
 IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
 IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT

--===============0618891472143141055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0618891472143141055==--
