Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC30C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 07:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98ACA813BA;
	Mon, 19 May 2025 07:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1jid_J-6O68; Mon, 19 May 2025 07:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B584F81363
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B584F81363;
	Mon, 19 May 2025 07:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B20C193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D02E40BD4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe-3bADi-Zwn for <buildroot@buildroot.org>;
 Mon, 19 May 2025 07:08:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD25D4082E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD25D4082E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 07:08:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABDC887063; Mon, 19 May 2025 07:08:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 09:07:25 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6824cf90ae0fb88c63f8f2f8cfde0ee105eb3317
X-Git-Newrev: 6441b3e5d007e4b92954ca8567faa10fc28fccc0
X-Patchwork-Hint: ignore
Message-Id: <20250519070810.ABDC887063@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Revert "package/libcap:
 backport upstream patch to fix build on Xtensa"
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6441b3e5d007e4b92954ca8567faa10fc28fccc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This reverts commit 98aa540ffb09cc1cbb3abbf29fd054dab4e5d370.

The commit was wrongly applied. The bump was not present on the LTS
branch, so the build error did not occur there and the patch doesn't
apply.

Fixes:
  https://autobuild.buildroot.org/results/1cf/1cfb62c8eac534e748afe37f94ae2291c104d345

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../0002-Support-for-__xtensa__-architecture.patch | 65 ----------------------
 1 file changed, 65 deletions(-)

diff --git a/package/libcap/0002-Support-for-__xtensa__-architecture.patch b/package/libcap/0002-Support-for-__xtensa__-architecture.patch
deleted file mode 100644
index a81a1952aa..0000000000
--- a/package/libcap/0002-Support-for-__xtensa__-architecture.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9421f4ff93c341482d3aa4a0cd57aba1978bdd62 Mon Sep 17 00:00:00 2001
-From: "Andrew G. Morgan" <morgan@kernel.org>
-Date: Sat, 19 Apr 2025 08:00:23 -0700
-Subject: [PATCH] Support for __xtensa__ architecture.
-
-It looks like __xtensa__ defines SA_RESTORER, but my read of the
-kernel code suggests that signal handling does not require it be
-set. Specifically, if the SA_RESTORER flag is not set, the kernel
-inserts a sys_rt_sigreturn call into the stack frame.
-
-Signed-off-by: Andrew G. Morgan <morgan@kernel.org>
-Upstream: 6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- psx/psx_calls.c | 13 +++++++------
- 1 file changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/psx/psx_calls.c b/psx/psx_calls.c
-index 8195964..aff105f 100644
---- a/psx/psx_calls.c
-+++ b/psx/psx_calls.c
-@@ -49,7 +49,8 @@
-     || defined(__powerpc__) || defined(__s390__) || defined(__riscv) \
-     || defined(__alpha__) || defined(__hppa__) || defined(__sh__) \
-     || defined(__m68k__) || defined(__sparc__) || defined(__arc__) \
--    || defined(__microblaze__) || defined(__or1k__)
-+    || defined(__microblaze__) || defined(__or1k__) \
-+    || defined(__xtensa__)
- 
- #undef _NSIG
- #undef _NSIG_BPW
-@@ -69,8 +70,7 @@
- #define _NSIG_WORDS  (_NSIG / _NSIG_BPW)
- 
- #if defined(__x86_64__) || defined(__i386__) \
--    || defined(__arm__) \
--    || defined(__powerpc__) \
-+    || defined(__arm__) || defined(__powerpc__) \
-     || defined(__arc__)
- /* field used */
- #define SA_RESTORER  0x04000000
-@@ -78,8 +78,9 @@
- 
- #if defined(SA_RESTORER) \
-     || defined(__aarch64__) \
--    || defined(__m68k__) || defined(__sh__) || defined(__sparc__) \
--    || defined(__s390__) || defined(__sparc__)
-+    || defined(__m68k__) || defined(__sh__) \
-+    || defined(__s390__) || defined(__sparc__) \
-+    || defined(__xtensa__)
- /* field defined */
- #define _HAS_SA_RESTORER   void *sa_restorer;
- #else
-@@ -93,7 +94,7 @@ typedef struct {
- #define sigset_t psx_sigset_t
- 
- struct psx_sigaction {
--#if defined(__m68k__) || defined(__alpha__)
-+#if defined(__m68k__) || defined(__alpha__) || defined(__xtensa__)
-     void *sa_handler;
-     sigset_t sa_mask;
-     unsigned long sa_flags;
--- 
-2.49.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
