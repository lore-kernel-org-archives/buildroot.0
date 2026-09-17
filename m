Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED0FC982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68BC5407B3;
	Thu, 17 Sep 2026 09:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TQuuZF1x5Az; Thu, 17 Sep 2026 09:14:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1FEAC40795
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636482;
	b=aCckCcSH7L8+G4rzvAlYSgjy9NRMR8qHPm0533lBOaolYhfie5i9O7Hw0GEMHZkMuop4
	 wi36T5q/GsilP7hBjufTCAwTdSdNtaN9qlw/J4pRUDYr0lGsgpajHyJJPEufa7XmfmQYP
	 oj2oKT1eZielsQCJzVhHFasuw/YGNdj7MmjVe+uTCHiq2LKtNM7LqkPQ7H3nQVfxwBAeg
	 VwtzzMVfbCzeqAuhiVAq3majs+H7XphMrztdtUlw5nTBGfDEXVSoqv7151uxr5nHJ1Db/
	 Nf/9wx0MsLYOrtadPMODw6F8QU5v5iwgFvMyJ14IgmQFlLxKk39NQqyw+1kLr147VYQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A0JDg0eXZycYgsm/+uuk1E+eolEHN36LKkNXarzQQMc=;
	b=JtM0vUdEs3X78Y5D1UvTyLassm5mSbVDstyk4USLGaaqgNmOQtY5s/Jl5i7+iOW7+QPM
	 hKT42AigrRyGtV78GHKr1iucKm/hX0PHwjuORTLGhJVbS1+X2tmaCeNyJ23Lz4qctcKPj
	 1UbA+TQRGKsqXOBB8/N3O5jrVJLQmFIOHdAqCwu2ItxgSL5WVcqbwqCCXpuQTPZNW4R1Q
	 Dqu4NnCv5OirSoQD0gc3cjrC8Cr4mNe6+SnA6wMTfCnCH6pP1pHAgE8vVfM0+dPE0nvk8
	 1ZNlGtLMJJZ7FlGBUfjNnDECJq8zLk8oezj1Jvlh9V+so6854XuphFmp5p2yVXW07uA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636482;
	bh=A0JDg0eXZycYgsm/+uuk1E+eolEHN36LKkNXarzQQMc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wd7QunNt8OwRcPJLbOcVDy22lQynT+5aX9ofbt6ymH1i8lYrX/EcnvKbZEgf1emBH
	 Mkw84+evp+j3XyacYiw1Nla+r90fWIqd72aZV1NiU+812aiZPLhdWz49I/YbgFSFsA
	 YqAF36YEHP5tD2pj7WVbqhKaRTPutlpXbV3pCA3NHOQwR21ooNnPC2AH/S8sNAFwYh
	 sEkTYvQM7bC/I9UJ1EjiMIwIFKF0ZQJ+w7Oyn29+04UJju21m3MiW/GpG+F2DCxI/F
	 Fj6vOv4/MPMXrlOYUeInI86o1xL/Xv5KGt8UAOI3SrhLZOF3Ek7zozGwXmtppB/W56
	 Jrt6ckHa19vdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEAC40795;
	Thu, 17 Sep 2026 09:14:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7636C465
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C68460835
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVGJTYHCwdrg for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A2980607CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636478;
 b=O5G5N0SKxQBtmtUbhQn18/tR7GZmipQvjNZI/EPByXB+i0VWVsTD0/QeGxTFyqpHPV2m
 N7t/CM1tfALbCfZ+LiGIPeQScRgplaWrrbDmWe5I27jeoh6iAiKO9hDZQDfrFJJB8zLmr
 DiEIgajU8peQUIihdV61xou/WLMIhKkjdbY+QKj93rhbs8dhnhyodvGOEnqgv4QzIiUuQ
 kEuG5sXKEzNtxu668LhFuduPVWvpRs137osF/p39lxt1Xj+JM/ktjWyZUDpydQd1rq3ee
 r6fo8O3ToQRufvEaxTXu9xi0na/RvFjI2miQ4wHsHShnG1sN/CrEafllZK7LZIHsCYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636478;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1ouQ1LEByPoynjS9/os8XKI+O886tEYB+LFUgsQUZCI=;
 b=K529812NWHISjQvfXPhA2+VZl/kNA9P0s4utb6yP7JwuYbSK94Vr4a2he2JsFFJXuLH9
 6IZLFZ6dN1RSGuqOcXYF4+T+RRhLxGDcgzCH6tLPXbUQ0QK7J9RVE+SHGBF7rurQJGDol
 Wm8/Gm1TSDzukYtvzrY1q3stgdYcoIZiVZUlwuiEUlLHzCSKvtFiPahuV6R9QeplzSobg
 yjhcXYE0qHHcmv0ZC5T3+WijMXm7DPq+0MAfSmOuctRMeIHTF7KyxYYAoYJJDtqHo9Nmv
 uWSFIhkb7aQhc7ENppuRzBSi+1Ufrys25yFasbY2VyxZOsp7NnhXXNfuFbaRh0aYC4g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2980607CE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:14:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D232B9214B; Thu, 17 Sep 2026 09:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 11:13:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f91407f0120ac4f3a8d9ea647f1bd44030654f7b
X-Git-Newrev: 22c0ec4fcfe58ff7a292f0a69e3357923f06b349
X-Patchwork-Hint: ignore
Message-Id: <20260917091331.D232B9214B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: host-qemu does not support
 XOP capable CPUs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/22c0ec4fcfe58ff7a292f0a69e3357923f06b349
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/qemu/Config.in.host | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 48979fd7ce..fbc989b003 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -22,10 +22,11 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
