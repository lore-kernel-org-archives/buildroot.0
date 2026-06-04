Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD99CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A2660F24;
	Fri,  5 Jun 2026 12:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brMXXq2i0Czj; Fri,  5 Jun 2026 12:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAF7B60F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663265;
	bh=uhdSYtMidH0N0k5CxqsNKno0YWJtIB+F839+H5w4is0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ORfY2xPAC5MpNOp80pizvBCpO83SuHOBHs8p+lcsFBRDBKP1ht23WwuesomKK3kol
	 XDfQCT16lfm7ADteZMlBYHtO1TqyedXU2B2mZzueKU6lo5ZaRG5lK7EPTgOHyRPipz
	 DzHzl+qK1HKdOPpnNwL+GDL860xcUm2lz47uFJl1VkEq73DTAyYAB6ae5JgHQV1wGD
	 DFPfCO8zXU4WnXx0ETSlHSw2q2U4sTWYI03MXPdxB4btgfoybUoEhuzFpPqK10UklQ
	 k833H0Vdii74EZ18Yg28tZLhU9Hh/6wlZKpWhjEv5p6bGprmfSsL4/Cg9tGas9lUJk
	 pi0mgWo97iGMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAF7B60F2A;
	Fri,  5 Jun 2026 12:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5573B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 771CB81EC0
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9wQMyL-_uL3N for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC5F08203C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC5F08203C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 110AD87B39; Fri,  5 Jun 2026 12:38:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:28:27 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4f501493834fc8854ed2e7081e125e9e7d0e8d44
X-Git-Newrev: 4ef6a58ad51ade19130dd0482f17871fad81e0df
X-Patchwork-Hint: ignore
Message-Id: <20260605123840.110AD87B39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/sysrepo: fix
 build on riscv32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ef6a58ad51ade19130dd0482f17871fad81e0df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes:
  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Vincent Cruz <mooz@blockos.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53941b55b2eb3a22d8e67cfa9853e9f74306d004)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...E-use-sr_cond_futex-only-if-SYS_futex-sys.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
new file mode 100644
index 0000000000..7f79cb1e25
--- /dev/null
+++ b/package/sysrepo/0001-cmake-UPDATE-use-sr_cond_futex-only-if-SYS_futex-sys.patch
@@ -0,0 +1,33 @@
+From 6917e00fb6c99a97dacdae7040e5c4c53752b10f Mon Sep 17 00:00:00 2001
+From: Vincent Cruz <mooz@blockos.org>
+Date: Tue, 17 Feb 2026 14:14:06 +0100
+Subject: [PATCH] cmake UPDATE use sr_cond_futex only if SYS_futex syscall
+ is available
+
+Some architectures (for ex. riscv32) may not support SYS_futex system
+call, even though linux/futex.h include file is present.
+
+Upstream: https://github.com/sysrepo/sysrepo/commit/a0661b7e6a7b2f784fe3222048066c31187c6f92
+
+Signed-off-by: Vincent Cruz <mooz@blockos.org>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b36de44..e1b39c8c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -163,7 +163,8 @@ set(NACM_SRMON_DATA_PERM "600" CACHE STRING "NACM modules ietf-netconf-acm and s
+ # sr_cond implementation
+ if(NOT SR_COND_IMPL)
+     check_include_file("linux/futex.h" HAS_FUTEX)
+-    if(HAS_FUTEX)
++    check_symbol_exists(SYS_futex "sys/syscall.h" HAS_SYS_FUTEX)
++    if(HAS_FUTEX AND HAS_SYS_FUTEX)
+         set(SR_COND_IMPL "sr_cond_futex")
+     else()
+         set(SR_COND_IMPL "sr_cond_pthread")
+-- 
+2.51.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
