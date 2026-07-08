Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9046C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90A3940A55;
	Fri, 10 Jul 2026 13:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gtse4-qIk6dO; Fri, 10 Jul 2026 13:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E875240A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691087;
	bh=+2OMscOIcAd1u/veuICbC41yt4jclPrmAKazspYqLMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s+ITEoDYmuTRdRJdsnIni0ShIqIc6Lrfh/gme8YOnw+6qwjhRyNE4BRy2tQlBphGr
	 8rAZ7L7eeD0VK/I5c66ZxSgvjPZwt6iaOFLg9bKK/mGSsYzc+U6iKrSrviDlUcVd6G
	 Ffq+ePFMyToeY6SGO7EadwBoTlnSA4x1CaNeuT4phyGRTYCDxaGrWvxNPpsbFUlH13
	 pddiWdMYeGeu04j1W+4kuW/qJyfaVbt5JgRpz1t8R/nRGyelC3HFKINb8+0tIpm3hT
	 IPaPb9ocKtWRSDEMuaOi6EpiMY9K81cH4Lykf1KCyWV+3kYnv+9G94ceMux5hBOkXb
	 VzfrOXenaWWpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E875240A23;
	Fri, 10 Jul 2026 13:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C195A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 596A340258
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scYUzYrbjVZK for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7203E4022E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7203E4022E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A97B8868B; Fri, 10 Jul 2026 13:44:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:47:58 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 5414b019bd5d0dd1cb949f77e19f76b2367ab7c6
X-Git-Newrev: 68895e688225e21e6d2d2a9d1af615ba82e968cc
X-Patchwork-Hint: ignore
Message-Id: <20260710134408.9A97B8868B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gcc: add missing
 15.3.0 patches
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/68895e688225e21e6d2d2a9d1af615ba82e968cc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

git am failed locally while the patch sent by Bernd looked correct [1].

Fixes: f8f6bcec0f523510a22882e4391999be81dc0e94

[1] https://lists.busybox.net/pipermail/buildroot/2026-June/805485.html

Reported-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit ad9d4c8351016c0501eabaafde56d9f719d7ce1d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...disable-split-stack-for-non-thread-builds.patch | 26 ++++++++++
 ...2-gcc-config-microblaze-fix-ira-for-GCC15.patch | 56 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/package/gcc/15.3.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/15.3.0/0001-disable-split-stack-for-non-thread-builds.patch
new file mode 100644
index 0000000000..c3b600cfb8
--- /dev/null
+++ b/package/gcc/15.3.0/0001-disable-split-stack-for-non-thread-builds.patch
@@ -0,0 +1,26 @@
+From 7d5f59e035341430e20f47420535d0e987516e55 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Mon, 25 Jul 2022 00:29:55 +0200
+Subject: [PATCH] disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+[Romain: convert to git format]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ libgcc/config/t-stack | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libgcc/config/t-stack b/libgcc/config/t-stack
+index cc0366b4cd8..f3f97e86d60 100644
+--- a/libgcc/config/t-stack
++++ b/libgcc/config/t-stack
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
+-- 
+2.50.1
+
diff --git a/package/gcc/15.3.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch b/package/gcc/15.3.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
new file mode 100644
index 0000000000..663aab7218
--- /dev/null
+++ b/package/gcc/15.3.0/0002-gcc-config-microblaze-fix-ira-for-GCC15.patch
@@ -0,0 +1,56 @@
+From d2fdbd8c4abe67eea86877dfb3b3b9d8508c165f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 6 Aug 2025 22:32:30 +0200
+Subject: [PATCH] gcc/config/microblaze: fix ira for GCC15
+
+Add new hooks for callee-save on microblaze defined by [1] and
+return 1 to restore the old behavior prior to the commit [3].
+
+Tested with qemu_microblazeel_mmu_defconfig and used to generate
+Microblaze toolchains for the Bootlin toolchains 2025.08-1 [4][5].
+
+Upstream: suggested in the bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=121432#c10
+
+[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b191e8bdecf881d11c1544c441e38f4c18392a15
+[2] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/i386/i386.cc;h=3128973ba79cccfc6761f451dcb716b9558cc4da;hb=d3ff498c478acefce35de04402f99171b4f64a1a#l20606
+[3] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3b9b8d6cfdf59337f4b7ce10ce92a98044b2657b
+[4] https://lore.kernel.org/buildroot/87sehzndtp.fsf@dell.be.48ers.dk/T/#mce7decd0b3f6a41008d5de577538a8525c91b374
+[5] https://toolchains.bootlin.com/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gcc/config/microblaze/microblaze.cc | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/gcc/config/microblaze/microblaze.cc b/gcc/config/microblaze/microblaze.cc
+index 78b9428ef3b..84ea7e8d55a 100644
+--- a/gcc/config/microblaze/microblaze.cc
++++ b/gcc/config/microblaze/microblaze.cc
+@@ -3228,6 +3228,14 @@ microblaze_secondary_reload (bool in_p ATTRIBUTE_UNUSED, rtx x ATTRIBUTE_UNUSED,
+   return NO_REGS;
+ }
+ 
++/* Implement TARGET_CALLEE_SAVE_COST.  */
++static int
++microblaze_callee_save_cost (spill_cost_type, unsigned int hard_regno, machine_mode,
++		       unsigned int, int mem_cost, const HARD_REG_SET &, bool)
++{
++  return 1;
++}
++
+ static void
+ microblaze_globalize_label (FILE * stream, const char *name)
+ {
+@@ -4066,6 +4074,9 @@ microblaze_starting_frame_offset (void)
+ #undef TARGET_SECONDARY_RELOAD
+ #define TARGET_SECONDARY_RELOAD		microblaze_secondary_reload
+ 
++#undef TARGET_CALLEE_SAVE_COST
++#define TARGET_CALLEE_SAVE_COST microblaze_callee_save_cost
++
+ #undef  TARGET_ASM_OUTPUT_MI_THUNK
+ #define TARGET_ASM_OUTPUT_MI_THUNK      microblaze_asm_output_mi_thunk
+ 
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
