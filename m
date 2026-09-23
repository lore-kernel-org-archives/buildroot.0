Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EEAC98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3A281283;
	Thu, 24 Sep 2026 18:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9JCuPsopLRx; Thu, 24 Sep 2026 18:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4769481285
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276260;
	b=e2FUH8XNTqxkxamsoyPSo1AMTZ3FI+05HnaTgRAyJss9yyb7JqWzwA8i2wY8+Lw2oiFS
	 oBUUqyfghvB+4HnV60pLO65ssTd2BPyeVLgdtsmehI0lZ6gfL5oGLIwkMU3nO04qMyDoN
	 OSg9EhP6eIYN2LHLs/8dnlCvvqxQWQanYSYtoasB6wS+SghBYOF8CkTUWMKWIbELn1MyK
	 zYk8juIq7JAPF75UG8Ekqn1pgQuwibOqjCZAzI0ZXlMl7FdkGTiFqF+TSYRaBkmo/I2Yy
	 QzQMeTos98MHaGgmyOdSdz4vZ3DrGLrbLyw1ybsaD+yIsvMDhLJ3/Ukcz7Yb0JfVZbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/VFRLDuzJPEqsZ5zQ7y2xVEbvWQG1TdM1wYE8COaIsI=;
	b=i0APapUIaB1Koa1zJT1X37/yePIipqACVM8iR2TElrhodfBRx5Nw8PiDAUfWe7xWZaxE
	 4KC2SqLPguoBx8ag1kyuv2s7s0qlmm7slc3nstKeOF5yB1a/ze0hEj+oaFdk54IJHIZme
	 7n6T9QVhPBvDsR6lY9cVTZr5j9HeSq+qadAJXphq8epwV4bExgOYzWCuzjfbU8OArncl2
	 fYUH/vxjCPgRHCEG/CTPnDHyHnoPbDJFmA+lBWQzDiSYAbmfPHNSVfkZJd1AqDpjF0rDL
	 KxHrSH1ZtSw3mhn8K22qkozxF2cCnJRwqGg+BE+7z08/AHTV8+etuOhwg37vKO/2dWA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276260;
	bh=/VFRLDuzJPEqsZ5zQ7y2xVEbvWQG1TdM1wYE8COaIsI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nIS0YrK3kPcYe3AM3IRhCh9HsxHt3On1tSSqfSMYLVmUE8Z5qniBmbrOZz+C/TEIS
	 WgxhfwsitMtOnZqfoVV75tTYTCPyNUiBgx/a4wDAfSGFfIhVkUtU0JkHKJMIWVKHN5
	 GatsNJzLOPOn9vAqZGdhpFZVm97EWzw8szHCXS9zqLYoIb0GBoAxWtq7H8jQcgA99O
	 gxadjlHaT0Sa4nbO1XjngjTnyyCLGv6z9t3S2NSeMKnXagWzk2Xz6ZJNRAmdS6uJAG
	 IBkMPPcFdiSrVUjluFXk7NSn90D1r4kWeXHLfJvcY28iHBZYheiD7xRUUHWr/OKvIt
	 UWHguPWSXDEiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4769481285;
	Thu, 24 Sep 2026 18:57:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A36E332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F63B40AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CD3YP-PMjz4d for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 11F6F40AD9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=E9bWcsRlHMkf0UTSWLhIIiWCUq19iJi9MXV6sK8mT58u5mgombO3M9mTDmrCUxfjWiGP
 nVwWv7w23tCKw0ytX1WM4FRA2Hw9DV6+k7CpEb7JAQZAjZohYnhvfSuzL3C6yRUghP2Oo
 FawBX0TSANbBn7mLnFL8LMEQrqDvU/7zEOEqSC31lRiz9GoGwCRUf9NaxNOzQVHkUTuO3
 IaMfd1hJasf+NPswuWEq2Z8DOtZQhk7lSXA4FcenmXCRjrBFH6NXVOwjrA8eHGifQv1RI
 ug/IMzsIQWRWhbnHzn5a3WoyVfFyHfvp/5X6O9eZIhA9/4tygHRfobHoiJg5YrHrQfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eHRQ2rdXl7cXvEz4L+sVZ9RRm0gSqcSJWBs7rKVgl/c=;
 b=Zi6kB76GHNiXxEPOtqPQrs1L1txeOYm6Rlx1SODsAbeRF4NR/ZW8A5gneW8sWfd32o0e
 UNO80mcMmD64rzpYZBw/Dy+FrvDyOnoX46hP8ZL9RCpGcUcVoU5rBaR/B03IfhZ9TUaop
 r/WDXuPYx7Gc+yys4SV4e3iiw59toUXkFt65F/xb/i0sdpdGxJwVDGnOSmYvpYPJgj7jK
 3HUrxuhxerBb36GYMxCSinXBHjd0KwPwbxaYLyOOk+ezeteogkWV7ra8fa7xWxrOhp1nQ
 pIIRE478MdUk91o7tytC5KUzwuOWYyMZL1UppCDSXjESuvU0moOtcICoJgXj6cYvbww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11F6F40AD9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A907998383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:20:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b3f5151f10cd8201f26396cd5c389fe42782cff
X-Git-Newrev: 64db8679294b2d118c1a1c6e4ebee218922d1863
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.A907998383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qemu: host-qemu
 does not support XOP capable CPUs
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1126890553666733507=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1126890553666733507==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/64db8679294b2d118c1a1c6e4ebee218922d1863
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit 1f7efaf89f03 ("package/qemu: do not support x86_steamroller or
x86_core_avx2") excluded BR2_x86_steamroller from
BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS. This is still needed, but for a
different reason than AVX, and the exclusion is incomplete.

steamroller is bdver3, and what the Qemu TCG engine cannot emulate
there is not AVX, but the Bulldozer-specific XOP, FMA4, TBM and LWP
extensions. In Qemu 11.0.0 (the version we currently package) and
11.1.1, target/i386/cpu.c has:

  #define TCG_EXT3_FEATURES (CPUID_EXT3_LAHF_LM | CPUID_EXT3_SVM | \
            CPUID_EXT3_CR8LEG | CPUID_EXT3_ABM | CPUID_EXT3_SSE4A | \
            CPUID_EXT3_3DNOWPREFETCH | CPUID_EXT3_KERNEL_FEATURES | \
            CPUID_EXT3_CMP_LEG)

CPUID_EXT3_XOP, CPUID_EXT3_FMA4, CPUID_EXT3_TBM and CPUID_EXT3_LWP are
defined in target/i386/cpu.h, but are not part of that mask, i.e. TCG
does not implement them. Binaries using those instructions therefore
die with:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

This affects the whole Bulldozer family, not only steamroller:
bulldozer (bdver1), piledriver (bdver2) and excavator (bdver4) are
equally unsupported, but were never excluded.

Use the newly introduced BR2_X86_CPU_HAS_XOP symbol, which covers all
four variants, instead of listing BR2_x86_steamroller alone. As for
AVX512, this disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 22c0ec4fcfe58ff7a292f0a69e3357923f06b349)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/qemu/Config.in.host | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c17e723b67..63f1b3fbde 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -20,10 +20,11 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_xtensa
 	default y if BR2_x86_64
-	depends on !BR2_x86_steamroller
-	# The Qemu TCG engine does not implement the AVX512
-	# instruction set, so binaries built for such CPUs cannot be
-	# emulated.
+	# The Qemu TCG engine implements neither the XOP instruction set
+	# nor the other Bulldozer-specific extensions (FMA4, TBM, LWP),
+	# and it does not implement the AVX512 instruction set either,
+	# so binaries built for such CPUs cannot be emulated.
+	depends on !BR2_X86_CPU_HAS_XOP
 	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 

--===============1126890553666733507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1126890553666733507==--
