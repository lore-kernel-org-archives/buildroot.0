Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F42FEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B74184663;
	Fri, 13 Feb 2026 19:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hfrlpt204t0R; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186B4844B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011413;
	bh=1XrCxYBwjCKuEWM92wAgzwFfEoGnmpL7LJPSYKNgK0E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E4ooR6vHjGU8YQUDV7fgw1Y/qCrf94MCszfPpCJur4AcMTECNbsUGzDYGrq7EBDJi
	 TXTyuYyPDwKjpB9Nw7ISmEb7zmmGy7gDBkO9V8JZR2vWGRi8JqtepKcWWfhJJSiPFm
	 1H9M+HV7DvEhBC5eXLLrsqGkH4bIAgKcl45Lh+T9qkSVlPby1Xc3+koWCUg/rzBQa3
	 +EOe6BCtnUaPu1ii+uIC0Pdrw4c4lCkzkX0g+/DEJ6FUQ/ekTXnuPORzDEWa1j8wNF
	 xvKH+hYTfgR6LgPZYfCUYxbkMI3FfLHrgfGLC01MIqhEe4Vnga+WhLk725uB3/nNpw
	 YEoe4picen33g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186B4844B5;
	Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1592B283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A15C984559
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OILtT6L-C6el for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3F2084537
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F2084537
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7BDB8275B; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:47:29 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8f68d58d207b7e2ac3df22f17cf7acd377573192
X-Git-Newrev: 5491db829fffeb33a4a64d12b87e9eebf4b535bd
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.A7BDB8275B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/config-fragments/autobuild: drop Buildroot ARC toolchains
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5491db829fffeb33a4a64d12b87e9eebf4b535bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

We're already testing the ARC architecture with one Bootlin toolchain,
it doesn't make sense to also test with two Buildroot internal
toolchains the ARC architecture, which is not a primary architecture
for Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ceaf0a22831b1d0337d04ffa467a2433a23bfa42)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 047b22a9fa..86c2120ecc 100644
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
