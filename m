Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CDFCDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3ABC81364;
	Fri, 13 Oct 2023 06:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3ABC81364
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGjOYyNi2Bbp; Fri, 13 Oct 2023 06:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E35F982661;
	Fri, 13 Oct 2023 06:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E35F982661
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2061BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBD7C4173C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD7C4173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXJvn4vGQKRO for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF4E1418AB
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4E1418AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCEED8468E; Fri, 13 Oct 2023 06:22:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:07:01 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 5a594e2cf854cfa747fd1d51f193c458ff942e7c
X-Git-Newrev: 252b6ade2c0cfa2ee37ee274547344d64d785367
X-Patchwork-Hint: ignore
Message-Id: <20231013062252.DCEED8468E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/openblas: Add
 support for RISC-V architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=252b6ade2c0cfa2ee37ee274547344d64d785367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

OpenBLAS RISC-V 64bit support was added in [1] and was renamed to
"RISCV64_GENERIC" in [2]. Those commits were first included in
OpenBLAS release v0.3.13. This support can now be enabled. With this
commit, we can install the library and packages such as GNU Octave on
RISC-V platforms.

This patch also adjusts the alignment for adding "RISCV64_GENERIC"
in Config.in.

[1] https://github.com/OpenMathLib/OpenBLAS/commit/c167a3d6f41ed2f5680c2a72846b4c9b5d416543
[2] https://github.com/OpenMathLib/OpenBLAS/commit/265ab484c89d10dfff2d5df678221918d7a880e3

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c789bcddf0fb17580bef0cdc45b5334a90ecdf13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 73 +++++++++++++++++++++++-----------------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 58976e657a..26a76d29fb 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -1,55 +1,56 @@
 config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	string
-	default "P2"           if BR2_x86_pentium2
-	default "KATMAI"       if BR2_x86_pentium3
-	default "NORTHWOOD"    if BR2_x86_pentium4
-	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
-	default "BANIAS"       if BR2_x86_pentium_m
-	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont || BR2_x86_westmere
-	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
-	default "HASWELL"      if BR2_x86_core_avx2
-	default "ATOM"         if BR2_x86_atom
-	default "ATHLON"       if BR2_x86_athlon || BR2_x86_athlon_4
-	default "OPTERON"      if BR2_x86_opteron
-	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
-	default "BARCELONA"    if BR2_x86_barcelona
-	default "BOBCAT"       if BR2_x86_jaguar
-	default "STEAMROLLER"  if BR2_x86_steamroller
-	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
-	default "POWER4"       if BR2_powerpc_power4
-	default "POWER5"       if BR2_powerpc_power5
-	default "POWER6"       if BR2_powerpc_power6
-	default "POWER7"       if BR2_powerpc_power7
-	default "POWER8"       if BR2_powerpc_power8
-	default "PPCG4"        if BR2_powerpc_7400 || BR2_powerpc_7450
-	default "PPC970"       if BR2_powerpc_970
-	default "PPC440"       if BR2_powerpc_440
-	default "PPC440FP2"    if BR2_powerpc_440fp
+	default "P2"              if BR2_x86_pentium2
+	default "KATMAI"          if BR2_x86_pentium3
+	default "NORTHWOOD"       if BR2_x86_pentium4
+	default "PRESCOTT"        if BR2_x86_prescott || BR2_x86_nocona
+	default "BANIAS"          if BR2_x86_pentium_m
+	default "CORE2"           if BR2_x86_core2
+	default "NEHALEM"         if BR2_x86_corei7 || BR2_x86_silvermont || BR2_x86_westmere
+	default "SANDYBRIDGE"     if BR2_x86_corei7_avx
+	default "HASWELL"         if BR2_x86_core_avx2
+	default "ATOM"            if BR2_x86_atom
+	default "ATHLON"          if BR2_x86_athlon || BR2_x86_athlon_4
+	default "OPTERON"         if BR2_x86_opteron
+	default "OPTERON_SSE3"    if BR2_x86_opteron_sse3
+	default "BARCELONA"       if BR2_x86_barcelona
+	default "BOBCAT"          if BR2_x86_jaguar
+	default "STEAMROLLER"     if BR2_x86_steamroller
+	default "VIAC3"           if BR2_x86_c3 || BR2_x86_c32
+	default "POWER4"          if BR2_powerpc_power4
+	default "POWER5"          if BR2_powerpc_power5
+	default "POWER6"          if BR2_powerpc_power6
+	default "POWER7"          if BR2_powerpc_power7
+	default "POWER8"          if BR2_powerpc_power8
+	default "PPCG4"           if BR2_powerpc_7400 || BR2_powerpc_7450
+	default "PPC970"          if BR2_powerpc_970
+	default "PPC440"          if BR2_powerpc_440
+	default "PPC440FP2"       if BR2_powerpc_440fp
 	# P5600 is built with MSA support which is only available in Codescape toolchains
-	default "P5600"        if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
-	default "SICORTEX"     if BR2_MIPS_CPU_MIPS64
+	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
+	default "SICORTEX"        if BR2_MIPS_CPU_MIPS64
 	# I6400 is built with MSA support which is only available in Codescape toolchains
-	default "I6400"        if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
+	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	# OpenBLAS assumes SPARC=Sparc v9
-	default "SPARC"        if BR2_sparc_v9
+	default "SPARC"           if BR2_sparc_v9
 	# Cortex-A15 always have a VFPv4
-	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
+	default "CORTEXA15"       if (BR2_cortex_a15 && BR2_ARM_EABIHF)
 	# Cortex-A9 have an optional VFPv3, so we need to make sure it
 	# is available
-	default "CORTEXA9"     if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
+	default "CORTEXA9"        if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV3)
-	default "ARMV5"        if BR2_ARM_CPU_ARMV5
+	default "ARMV5"           if BR2_ARM_CPU_ARMV5
 	# On ARMv6, OpenBLAS assumes that a VFP is available, and
 	# EABIhf is used
-	default "ARMV6"        if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
+	default "ARMV6"           if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV2)
 	# On ARMv7, OpenBLAS assumes that a full VFPv3+ is available
 	# (and not the more limited D16 variant), and that EABIhf is
 	# used.
-	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
+	default "ARMV7"           if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
 				   BR2_ARM_CPU_HAS_VFPV3)
-	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
+	default "ARMV8"           if BR2_aarch64 || BR2_aarch64_be
+	default "RISCV64_GENERIC" if BR2_RISCV_64
 	help
 	  OpenBLAS target CPU. See TargetList.txt in the source tree for
 	  the possible target strings. A possible value is set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
