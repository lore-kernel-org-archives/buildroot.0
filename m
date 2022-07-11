Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EF2C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7F641528;
	Mon, 11 Jul 2022 17:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7F641528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pT77ZOvz5Czn; Mon, 11 Jul 2022 17:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D122F40919;
	Mon, 11 Jul 2022 17:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D122F40919
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B55D01BF983
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B791060F56
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B791060F56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aP0lvlwO0AsS for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86C860F3C
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D86C860F3C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 06C9E837EA; Mon, 11 Jul 2022 17:15:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 19:09:58 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ec13f64b46060d6fe712a93adfefb032c2ec09fe
X-Git-Newrev: 4cb1662a9a85ba76362b1dad1528d5bf8921f9e1
X-Patchwork-Hint: ignore
Message-Id: <20220711171517.06C9E837EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate with
 correct !BR2_STATIC_LIBS handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=4cb1662a9a85ba76362b1dad1528d5bf8921f9e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This commit is simply the result of regenerating the
toolchain-external-bootlin package after gen-bootlin-toolchains was
changed in commit "support/scripts/gen-bootlin-toolchains: properly
take into account !BR2_STATIC_LIBS for glibc toolchains".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3a7a49fdb1077040e29bd06eac4f652b94d2fc83)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external-bootlin/Config.in.options                  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 4b4404620c..db81d9c7b5 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,20 +22,20 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_mips64 && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
 	default y if BR2_mips64el && BR2_mips_64r6 && BR2_MIPS_NABI32 && !BR2_MIPS_SOFT_FLOAT
-	default y if BR2_nios2
+	default y if BR2_nios2 && !BR2_STATIC_LIBS
 	default y if BR2_or1k
 	default y if BR2_powerpc && BR2_powerpc_440fp
 	default y if BR2_powerpc && BR2_powerpc_e300c3
 	default y if BR2_powerpc && BR2_powerpc_e500mc
-	default y if BR2_powerpc64 && BR2_powerpc_e5500
+	default y if BR2_powerpc64 && BR2_powerpc_e5500 && !BR2_STATIC_LIBS
 	default y if BR2_powerpc64 && BR2_powerpc_e6500
 	default y if BR2_powerpc64 && BR2_powerpc_power8
 	default y if BR2_powerpc64le && BR2_powerpc_power8
-	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D
+	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_32 && BR2_RISCV_ABI_ILP32D && !BR2_STATIC_LIBS
 	default y if BR2_riscv && BR2_riscv_g && BR2_RISCV_64 && BR2_RISCV_ABI_LP64D
 	default y if BR2_sh && BR2_sh4
 	default y if BR2_sh && BR2_sh4aeb
-	default y if BR2_sparc64 && BR2_sparc_v9
+	default y if BR2_sparc64 && BR2_sparc_v9 && !BR2_STATIC_LIBS
 	default y if BR2_sparc && BR2_sparc_v8
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2
 	default y if BR2_x86_64 && BR2_X86_CPU_HAS_MMX && BR2_X86_CPU_HAS_SSE && BR2_X86_CPU_HAS_SSE2 && BR2_X86_CPU_HAS_SSE3 && BR2_X86_CPU_HAS_SSSE3 && BR2_X86_CPU_HAS_SSE4 && BR2_X86_CPU_HAS_SSE42
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
