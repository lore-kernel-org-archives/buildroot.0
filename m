Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FE3C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BC060EFA;
	Mon,  6 Jun 2022 13:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gApAcXfIzmZ; Mon,  6 Jun 2022 13:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AB4060C03;
	Mon,  6 Jun 2022 13:16:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52BC71BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41C2883FF5
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-aUaYKRvQbu for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8956583FF1
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:16:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 54C9E86D90; Mon,  6 Jun 2022 13:04:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 15:15:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc63ec92928909d34c121817f0aa24d77412667e
X-Git-Newrev: 3a7a49fdb1077040e29bd06eac4f652b94d2fc83
X-Patchwork-Hint: ignore
Message-Id: <20220606130446.54C9E86D90@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a7a49fdb1077040e29bd06eac4f652b94d2fc83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit is simply the result of regenerating the
toolchain-external-bootlin package after gen-bootlin-toolchains was
changed in commit "support/scripts/gen-bootlin-toolchains: properly
take into account !BR2_STATIC_LIBS for glibc toolchains".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../toolchain-external-bootlin/Config.in.options               | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 53034c4f5e..06a9ddf2d2 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -22,21 +22,21 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
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
-	default y if BR2_s390x && BR2_s390x_z13
+	default y if BR2_s390x && BR2_s390x_z13 && !BR2_STATIC_LIBS
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
