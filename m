Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3444CEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 046CB614D6;
	Fri, 13 Feb 2026 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMP3RlmkUpmp; Fri, 13 Feb 2026 19:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CA296152A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011398;
	bh=8SkNP1/HojJeMLbHieYje6fz2TMHBX8FB4/wD+9zgYw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MspIh0W0uTRqHV31R93hBJlKvf1t9ycGnpY0g5vXymsnOeh4wkgnUvTrPInN9MVuj
	 VhnjQjHAuWKxOVNBPmt+V4yYyct3/0fqP1dKyAzJ6NCj2SLO/N4QWBzuu1sG1GjDz0
	 Dq9BD/LwMvIt6pAQ7tdutWH6Gs0GneZwa72/NbOsQZRd4MPXVIgCRIHUszDzpqS1OO
	 gr7NeqS8zV5RomZ9gWxg0zsEloBC7eEYvZj1sd8aJezfP3WY57GoLq4wt70sQDGwLP
	 wU7RnbVg4WCuHfk0nN7u7rk3z4nn3dX9st85Elh/JG/VIxMUBJgb3Tb4zRBafqWrFy
	 Kd+zJf9igbNag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA296152A;
	Fri, 13 Feb 2026 19:36:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6DE283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E53ED41E3F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3uTUPhkmAtv for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C117141E38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C117141E38
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B5FAA86D67; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:47:36 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5491db829fffeb33a4a64d12b87e9eebf4b535bd
X-Git-Newrev: 8393bad67bacd82613d7340dd03754dc7ea22dea
X-Patchwork-Hint: ignore
Message-Id: <20260213193527.B5FAA86D67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/config-fragments/autobuild: reduce ARM internal toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8393bad67bacd82613d7340dd03754dc7ea22dea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building internal toolchains takes a long time, and since the
differences between the 3 internal ARM toolchains is just the libc,
and we're already testing uclibc/musl with external toolchains, it
doesn't make much sense to build 3 different ARM internal toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 61fe61af3131f7053a5f60d457f9e5fbaef08051)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 86c2120ecc..4baeb99f74 100644
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
 support/config-fragments/autobuild/br-microblazeel-full-internal.config,any
 support/config-fragments/autobuild/br-mips64-n64-full.config,x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
