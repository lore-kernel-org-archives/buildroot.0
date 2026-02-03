Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E44E83061
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D420A40312;
	Tue,  3 Feb 2026 08:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8KmdOIjZr-X; Tue,  3 Feb 2026 08:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0833A403D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106576;
	bh=qFIKqG+YurmSh5oZbNJPEMXpqnu0ZtmXo0tSSs7jvrk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HRBsMuWnd4F4FrjzUPsLCQ6noR2F2tMd/nLh2qAHhc0C5qJ26uA/YHIHTAQzmjeGm
	 gOmDPhp+5CNDPYHjRluB9I1rsr/51k24PZhmLB1TXUnnhAIof5OD3FZbWrLuVxU/7j
	 De6k1PFGXn4G7p0qwRnRio3yjxkEaWU6/N/krUB6Th0NXISXdCoeDabjH5ZjBxgJ2P
	 RSMT8+yvhEmQ+qhkKwThabFCVN7IWEQHU37f0DH2fwQkeTDT1nQ4vWgrmY0CQbTncR
	 bIsEAo+I92fEOugyAsrgDPGFu90kukUo3mof+beJ1HaW6/1bTI2zc0kbIoIf8+aL5q
	 nAfLEIJk25TeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0833A403D8;
	Tue,  3 Feb 2026 08:16:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38320F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198C981815
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYn4_T9dSlon for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00251817AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00251817AB
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E7983A23; Tue,  3 Feb 2026 08:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:15:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3aaf596b60c71fdcadad0a9709189efd466eacef
X-Git-Newrev: ceaf0a22831b1d0337d04ffa467a2433a23bfa42
X-Patchwork-Hint: ignore
Message-Id: <20260203081607.E2E7983A23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: drop
 Buildroot ARC toolchains
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ceaf0a22831b1d0337d04ffa467a2433a23bfa42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We're already testing the ARC architecture with one Bootlin toolchain,
it doesn't make sense to also test with two Buildroot internal
toolchains the ARC architecture, which is not a primary architecture
for Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-arc-full-internal.config  | 3 ---
 support/config-fragments/autobuild/br-arc-internal-glibc.config | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv        | 2 --
 3 files changed, 9 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arc-full-internal.config b/support/config-fragments/autobuild/br-arc-full-internal.config
deleted file mode 100644
index 4755c9e45b..0000000000
--- a/support/config-fragments/autobuild/br-arc-full-internal.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_arcle=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arc-internal-glibc.config b/support/config-fragments/autobuild/br-arc-internal-glibc.config
deleted file mode 100644
index b9d6857240..0000000000
--- a/support/config-fragments/autobuild/br-arc-internal-glibc.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_arcle=y
-BR2_archs38=y
-BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index a559221b99..f5c6c6672a 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -42,8 +42,6 @@ support/config-fragments/autobuild/bootlin-x86-i686-musl.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
-support/config-fragments/autobuild/br-arc-full-internal.config,any
-support/config-fragments/autobuild/br-arc-internal-glibc.config,any
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
 support/config-fragments/autobuild/br-arm-internal-full.config,any
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
