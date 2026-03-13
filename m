Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7B7107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25A5E806FB;
	Fri, 13 Mar 2026 20:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JRmfqeRfaaqU; Fri, 13 Mar 2026 20:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C158089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435312;
	bh=tiWdpcRU8fdfEL+z2aKPbFpmtSiACBofuEHPZnnowMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OFkkyENdQ+O689eKmAEHgYrSPwVl2ZVFV0AW+/huybi+xOS2a4rgZMVprl5OhH/dy
	 d2reH4+ngm6z8tUsXELxRuoSwDB5KuUvrvsCym8bNDwFMo92biWKSH9m0KgZB+1Oo0
	 lwd3CRlO8oeWQsNu7XbRPgTZz0cdYRNyMU2COVpIa/bQSchrAs8DLuQEBFDVgoufJ+
	 2tk+HoyLKIH5IDwdF2uPAVW4bdBUrzCsHG1SroLDRLcaexy/pID7PS8d9nCX9FiSp+
	 76haRfIrk5/Kri1LaU4Ld/PWV6EjMId4RidffzZbY9DggCg2sTMps/Jed16m2fpPAy
	 WAsC5iJ+ycvfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40C158089D;
	Fri, 13 Mar 2026 20:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 138461AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0455540099
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVClHpLLBNiD for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 246124005A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 246124005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A12286FAF; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:52:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efe7aa7ca47ba3e21032c69467519928bb4202a6
X-Git-Newrev: 7e757926757dc08022e7c57b36ae3bc2c6119339
X-Patchwork-Hint: ignore
Message-Id: <20260313205508.3A12286FAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add the Neoverse-V3 core
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e757926757dc08022e7c57b36ae3bc2c6119339
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit adds the Neoverse-V3 core, which is an armv9.2a ISA.
See: [1] [2].

This CPU support was added in GCC 15. See [3] [4] [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

Note: at the time of this commit, the latest binutils v2.46 does not
include a Neoverse-V3 support for its '-mcpu' option. See [6]. This is
not an issue because gcc will call the "as" assembler with the relevant
"-march=armv9.2-a+EXTENSION..." options. Binutils supports "armv9.2-a"
since upstream commit [7] (first included in 2.38), and the oldest
Binutils version in Buildroot is 2.44.

[1] https://developer.arm.com/Processors/Neoverse%20V3
[2] https://developer.arm.com/documentation/107734/0002/The-Neoverse--V3--core/Neoverse--V3--core-features
[3] https://gcc.gnu.org/gcc-15/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-15.1.0#l221
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=729000b90300a31ef9ed405635a0be761c5e168b
[6] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-aarch64.c;h=cd76163488c48e45d43c35b2704d637999d51015;hb=3e93b95c3ae3f00a0283ddbab8029cbc07d96aff#l10833
[7] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3518022233e6b757c57d3deb7723fd91214fe036

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index e9f3c53e0d..ff301785e5 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -538,6 +538,12 @@ config BR2_cortex_a720
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+config BR2_neoverse_v3
+	bool "neoverse-V3 (aka poseidon)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -938,6 +944,7 @@ config BR2_GCC_TARGET_CPU
 	default "neoverse-v2"	if BR2_neoverse_v2
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
+	default "neoverse-v3"	if BR2_neoverse_v3
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
