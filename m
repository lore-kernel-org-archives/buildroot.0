Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E69CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68AAA42A48;
	Sat, 30 May 2026 14:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1t3hj1KB200p; Sat, 30 May 2026 14:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75FF242A75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152766;
	bh=f6MrNkQf2it2/FXpgKNdc7dl9HjZbLAxNoasKqPABbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=loJ6OLCRnKgqQy1S4XMvmOvWC/ag5sMxhklbsuOxF4Q1vZGbBJCn3iieeSBocTu9M
	 vkv/pHhCFyu5nZakqsDo6c/N+12NAfzSkLWX1O41bCn8I8HY6/5vSIHqNIm9HCMans
	 kCX5wXf9lXsFxElztv6zhKaZ0Aee/HUHT1YZJ066H1EeVP072RAOvuO2Dn1mJZVFnR
	 kT9pUYpYATwsl28oinMcFQEzx14s5LYwY29ZRwOdZxNi6J4WKu48xGnV43MZ1FIbGb
	 wdZF4EqMFSIGSUVBXnnhGSyP8GKTyWvmFLGEN5kyrOL/jtZhdrQDlKDwIw7tPN/aT3
	 MpBJxB9dqLhEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75FF242A75;
	Sat, 30 May 2026 14:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF351218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA6F78534A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcuzjMD7Yd5G for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233C585349
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 233C585349
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3BAE8751F; Sat, 30 May 2026 14:52:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:52:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98e6dcd05bddfa810818a8479c3a45f16da917ff
X-Git-Newrev: da1b45dd00fd28e9db3f24dbb7b10ad2e7a024e7
X-Patchwork-Hint: ignore
Message-Id: <20260530145229.F3BAE8751F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in.powerpc: add
 Power11 CPU type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da1b45dd00fd28e9db3f24dbb7b10ad2e7a024e7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

This commit adds the IBM Power11 CPU type.

This CPU is supported in gcc since v15.1.0 (see upstream commit [1]),
and in binutils since v2.35 (the gas -mpower11 option is documented
since upstream commit [2]).

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=05f0e9eec9f9beeffe024ecd6566b41200d79cff
[2] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=4199cf1e152daab0460f08cc7dbd1f727ac3e4cc

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.powerpc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index a2605ca6a9..805bc9ce68 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -149,6 +149,11 @@ config BR2_powerpc_power10
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+config BR2_powerpc_power11
+	bool "power11"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
@@ -213,6 +218,7 @@ config BR2_GCC_TARGET_CPU
 	default "power8"	if BR2_powerpc_power8
 	default "power9"	if BR2_powerpc_power9
 	default "power10"	if BR2_powerpc_power10
+	default "power11"	if BR2_powerpc_power11
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
