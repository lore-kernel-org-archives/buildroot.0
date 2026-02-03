Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51DDE83064
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F58A8186E;
	Tue,  3 Feb 2026 08:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7XD_5WGGyFh; Tue,  3 Feb 2026 08:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E6C581846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106570;
	bh=iGlKyk8BzN+cIMRrzgjakAiVjmPqLuHSMcQXfDnd/rA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UsEuIV3UdDLyPiYOqkdHF+3qJCY6feABinxTcvSmCM6ezxMzc5gSN0Nodn2uJY8tp
	 l1gG0V/tNJBmc8RVUqFxflMs9WNnX3c0qoor6OJHcCZdNeWyXfrltgpNgVt+l3XH0S
	 9qLhQm/wdDTjIcsSc3xWz1U+m1GX0l5ttf2rYx4Ab5rJpX227sF6iYajziRQpN/LAD
	 kg2cMq1LjIBQht2uy1JLVyftIa+PfIHL64cXRxUCb0U1sx3noW8QX20zoqevMs0S+q
	 N6T8R5wtSav6QYkRALbRaRoMRsBoMK/BifQRClLV52zLxcXNH4sraaaVcvhAJA7paY
	 08pnlRyGSsDoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E6C581846;
	Tue,  3 Feb 2026 08:16:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF402F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC05B81815
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxVD68LjFPWa for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070E3817B5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070E3817B5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF6538653D; Tue,  3 Feb 2026 08:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 09:15:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ceaf0a22831b1d0337d04ffa467a2433a23bfa42
X-Git-Newrev: 61fe61af3131f7053a5f60d457f9e5fbaef08051
X-Patchwork-Hint: ignore
Message-Id: <20260203081607.EF6538653D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: reduce
 ARM internal toolchain
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

commit: https://git.buildroot.net/buildroot/commit/?id=61fe61af3131f7053a5f60d457f9e5fbaef08051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building internal toolchains takes a long time, and since the
differences between the 3 internal ARM toolchains is just the libc,
and we're already testing uclibc/musl with external toolchains, it
doesn't make much sense to build 3 different ARM internal toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/config-fragments/autobuild/br-arm-internal-full.config | 5 -----
 support/config-fragments/autobuild/br-arm-internal-musl.config | 4 ----
 support/config-fragments/autobuild/toolchain-configs.csv       | 2 --
 3 files changed, 11 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-full.config b/support/config-fragments/autobuild/br-arm-internal-full.config
deleted file mode 100644
index b5f10069c6..0000000000
--- a/support/config-fragments/autobuild/br-arm-internal-full.config
+++ /dev/null
@@ -1,5 +0,0 @@
-BR2_arm=y
-BR2_ARM_EABI=y
-BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
-BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/br-arm-internal-musl.config b/support/config-fragments/autobuild/br-arm-internal-musl.config
deleted file mode 100644
index 92788626d6..0000000000
--- a/support/config-fragments/autobuild/br-arm-internal-musl.config
+++ /dev/null
@@ -1,4 +0,0 @@
-BR2_arm=y
-BR2_cortex_a8=y
-BR2_TOOLCHAIN_BUILDROOT_MUSL=y
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f5c6c6672a..5c9fe660d3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -44,9 +44,7 @@ support/config-fragments/autobuild/bootlin-x86-64-uclibc.config,x86_64
 support/config-fragments/autobuild/bootlin-xtensa-uclibc.config,x86_64
 support/config-fragments/autobuild/br-arm-basic.config,x86_64
 support/config-fragments/autobuild/br-arm-full-nothread.config,x86_64
-support/config-fragments/autobuild/br-arm-internal-full.config,any
 support/config-fragments/autobuild/br-arm-internal-glibc.config,any
-support/config-fragments/autobuild/br-arm-internal-musl.config,any
 support/config-fragments/autobuild/br-i386-pentium4-full.config,x86_64
 support/config-fragments/autobuild/br-loongarch64-full-internal.config,any
 support/config-fragments/autobuild/br-loongarch64-internal-glibc.config,any
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
