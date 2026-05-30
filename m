Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4D1CD6E52
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D236F566;
	Sat, 30 May 2026 14:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQedQ7hiOdTM; Sat, 30 May 2026 14:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761826F56A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152767;
	bh=krgYQCMnr+6qXHMA3plQko1+HTGYfqDCJDtnXXeOd/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nZv1KX5O0GIpY74wFacJWLFy9gJCs2orIFDOkCBc5KuP6UfueZ4lVy25UlLUS+hhM
	 Pgc5eKxKMp0Qo9P9PWCvZs2VNMG1Za6QaUZCM2uIbUog7D9RExZmdz0xnQu4V3X3Tu
	 ugmCCwSfhLK9ynBRHdSFOJuTmXVZVD8OjYg7kQqeLaaFK12WKdv8t3a7Cmpv+QyImr
	 bJRVUsqCLnpQt1PHjr3tgROLuoxnRftIRE7I7ESVCngUsf4EEXA7tf9CsjrzdlcRXA
	 F4JRF3hBtB2pA7gOUGm2WzRappJUd82zUKME21Bbg4AZ5grBFcb9cjxiHDBLNknFc9
	 OnCI1BsU4l8yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 761826F56A;
	Sat, 30 May 2026 14:52:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D644C37F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B583240858
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxavELUo3sHB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB03D4025D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB03D4025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:52:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF2798751D; Sat, 30 May 2026 14:52:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:51:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 10088b538115d9d23136fae98ef764cfc5602104
X-Git-Newrev: 3523e1ac79c15c5199a15589692e269191abd546
X-Patchwork-Hint: ignore
Message-Id: <20260530145229.DF2798751D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/Config.in.powerpc: add
 Power10 CPU type
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3523e1ac79c15c5199a15589692e269191abd546
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

This commit adds the IBM Power10 CPU type. See [1].

This CPU is supported in gcc since v11.1.0 (see upstream commit [2]),
and in binutils since v2.35 (the gas -mpower10 option is documented
since upstream commit [3]).

[1] https://en.wikipedia.org/wiki/Power10
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d9d0c94588c8834a33eca6847b0a1401353300b
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=1424c35d071e7d49a4a219c7dee8c88ffd60ddca

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.powerpc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 3f4d348d5f..a2605ca6a9 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -144,6 +144,11 @@ config BR2_powerpc_power9
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 	select BR2_POWERPC_CPU_HAS_VSX
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+config BR2_powerpc_power10
+	bool "power10"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	select BR2_POWERPC_CPU_HAS_VSX
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
@@ -207,6 +212,7 @@ config BR2_GCC_TARGET_CPU
 	default "power7"	if BR2_powerpc_power7
 	default "power8"	if BR2_powerpc_power8
 	default "power9"	if BR2_powerpc_power9
+	default "power10"	if BR2_powerpc_power10
 
 config BR2_READELF_ARCH_NAME
 	default "PowerPC"	if BR2_powerpc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
