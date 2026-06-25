Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C884C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA8BE80A70;
	Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayi5c6Vx1JPa; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D565D809A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485494;
	bh=aZghcUDt9xU8vCQQhK17bC2/5iZyv946LdDXWujDtiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q5TgrZ8R2HG/XYs1T4sE3aRTVtRE1pOFLEFbsYe1qcNlj8qX4/FA2hi3mkPs6O3f3
	 K4AGsVsO8mLb868yyAbVO+imD47dc01Rzdh93LueAPG9aKNU7rA1dbu6u/u3H5/DP2
	 E0qTd+iguyTZ21k4r9p/yo/3z/t6MMAOBRZC9yAnuuF0jPRRxKjoP4vIytKcjx4Vl5
	 xYEbU/ztJ6DgMaWBMQya16dx521mMipsAsWfUZAm75RfdZQYl7hZmilmLkANAoQxUC
	 fgKSaTgMUJ5EixM0xKi582MCzCRQirrd9jC2DAwZPIbI9D4MhaVgBeIUnNxxG02ExV
	 UYkUwnffCTbhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D565D809A7;
	Fri, 26 Jun 2026 14:51:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EC3231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE21140722
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peVnVj_C5E44 for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33EB64071F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EB64071F
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28CC9864B7; Fri, 26 Jun 2026 14:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:25:12 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d5d96d16b20b8039c7bdf23d8015a145d16909e7
X-Git-Newrev: a9014f0c9628e94b8ead65e24c896ea617c7a0ff
X-Patchwork-Hint: ignore
Message-Id: <20260626145106.28CC9864B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] linux: select
 host-openssl for all architectures when building latest CIP version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9014f0c9628e94b8ead65e24c896ea617c7a0ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

This is a follow-up for buildroot commit
bba86304b0ac4ae266cfb52e54a239b0850b10ca to extend the fix to CIP
kernels.

Fixes:
aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/

Supersedes
https://patchwork.ozlabs.org/project/buildroot/patch/20251101102346.109307-1-bernd@kuhls.net/
and includes Edgar's comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7ee8e9f12a461c01ca6e26adc2293aae05cdd39e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8b17fece44..1f91979d44 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -187,9 +187,11 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
 	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
-	# version. This is mainly needed to fix autobuilder testing.
+	# version and the latest CIP version.
+	# This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
