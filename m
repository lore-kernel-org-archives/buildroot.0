Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EE6EF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C18241F37;
	Fri, 13 Feb 2026 19:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwBDvmSX4qr3; Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33DAF4206A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011503;
	bh=rCJRGdjKk4htD7aBg4EMHigzIcGdBby3CfI9PQKi2sE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YffwM95nh9GHhOrMPVdNG8g+4S9umECi80ZxLexjbBUcqOnt6A4MShJfQ0fsMKFQ+
	 y4/Qkbb9gp9TivP00Necph9KQJj9MKj2YIBAN1/s15yrIIYAiCvNK8vLuSyeArSBh1
	 KPkCnskyEIGDFzMIK7cuzwoG3bo34LPrWSIsbteOvGCfMsb87r3Oq4Yskjotnh8Q1N
	 n84EZzrswuNryWyJrHn8fdfCL90IYED5VekxPA7PMec7HAD6+RCfaAaHSvuPSGrG4t
	 lq/AEjbYcf3Sq7zcp7taum2qHKVUYpeySTTKeUhcGkkQKfFP3qUickWm05eW19y7kv
	 SIO8VgBIf66fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DAF4206A;
	Fri, 13 Feb 2026 19:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C80B283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AE8E413FC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCQN9ax_Bj_R for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4195412ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4195412ED
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C94E683593; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:47:38 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 949453924238fc6fdd43ffadf4773edc3a5224fb
X-Git-Newrev: 3ffa6d7b3904ffb75a3b85d9d371f21c9ffe5294
X-Patchwork-Hint: ignore
Message-Id: <20260213193702.C94E683593@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3ffa6d7b3904ffb75a3b85d9d371f21c9ffe5294
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
