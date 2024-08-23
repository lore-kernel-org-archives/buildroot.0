Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6CCC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35844810FC;
	Fri, 23 Aug 2024 17:41:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJHPLG70K60h; Fri, 23 Aug 2024 17:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A63C81A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A63C81A50;
	Fri, 23 Aug 2024 17:41:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C19341BF34F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF3AE81A50
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLCFTt-SQQq0 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:41:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2113810FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2113810FC
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:41:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFDA086499; Fri, 23 Aug 2024 17:41:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:41:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea6bb507b1d3841be052525936121f7e88c43fbd
X-Git-Newrev: 1e8eca5e65f906207da77db8c972693f0ea92749
X-Patchwork-Hint: ignore
Message-Id: <20240823174142.CFDA086499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: fix riscv64 C++
 compilations
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1e8eca5e65f906207da77db8c972693f0ea92749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

 http://autobuild.buildroot.org/results/63f/63f32c9d5d4097ef2b3cbba1ce665e13e9dbd430

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch b/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch
new file mode 100644
index 0000000000..3aba6eca08
--- /dev/null
+++ b/package/elf2flt/0001-riscv64-handle-R_RISCV_SET_ULEB128-R_RISCV_SUB_ULEB1.patch
@@ -0,0 +1,30 @@
+From 5b8288257c66c76cc578935276dc5b512010b6a3 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Wed, 21 Aug 2024 07:23:19 +0200
+Subject: [PATCH] riscv64: handle R_RISCV_SET_ULEB128/R_RISCV_SUB_ULEB128
+
+For C++ applications or libraries like gdbserver or gmp
+we need to handle these relocations.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/uclinux-dev/elf2flt/pull/35
+---
+ elf2flt.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/elf2flt.c b/elf2flt.c
+index 04b6b43..d5e32ab 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -840,6 +840,8 @@ output_relocs (
+ 				case R_RISCV_SET8:
+ 				case R_RISCV_SET16:
+ 				case R_RISCV_SET32:
++				case R_RISCV_SET_ULEB128:
++				case R_RISCV_SUB_ULEB128:
+ 					continue;
+ 				case R_RISCV_32:
+ 				case R_RISCV_64:
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
