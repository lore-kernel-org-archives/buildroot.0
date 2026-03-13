Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739EB107BCE6
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48CD260E18;
	Fri, 13 Mar 2026 20:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jEo-fN_Tt9V; Fri, 13 Mar 2026 20:55:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5535260DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435314;
	bh=rplwVgaVyioxr+AGT31d3fZzBX+DvUGODjVuA94XBT8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CcKs2eJimDiWbrQ05arcEipTZLUszGDJTo0RQDbxbLVxb98R9SZ0CNvFleD/ZTwf2
	 te6JGduh+ZAHS5CjVWF50ams+b7/RraTq8wrtLe8OgVTPvyHhncqG60y6MgEivM8SL
	 MPj9yLOw2Qs7e71e/265Bum9/xFgFYagiW9sTp9eSQsw0SlgEx75JKZKtpVmwVwl6k
	 LWqveKwdzBpf+dkgPrNPco7fHE4J0Me76/NFY8TLaOetq+K2GH1tRLtkcjHxeO7pjS
	 84LmvBfwc9fLuJYzW8ODbkGtzHindEdrlXl8TSatrivI7n3RtuvE1VDj2dDGlNYbfB
	 wkQsDh6+e7aFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5535260DEB;
	Fri, 13 Mar 2026 20:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3683E787
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19C81608C5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yHaoUql8gq8 for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F9D560832
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F9D560832
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43DD186FB8; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:52:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e757926757dc08022e7c57b36ae3bc2c6119339
X-Git-Newrev: 3dbb2a0aaa66e84f7318f7bfb0f9411cf3ef5b4e
X-Patchwork-Hint: ignore
Message-Id: <20260313205508.43DD186FB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add the Neoverse-V3AE core
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3dbb2a0aaa66e84f7318f7bfb0f9411cf3ef5b4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit adds the Neoverse-V3AE (Automotive Enhanced) core, which
is an armv9.2a ISA. See: [1] [2].

This CPU support was added in GCC 15. See [3] [4] [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

This CPU is present in NVIDIA Jetson Thor / Tegra T264 [6].

Note: at the time of this commit, the latest binutils v2.46 does not
include a Neoverse-V3AE support for its '-mcpu' option. See [7]. This is
not an issue because gcc will call the "as" assembler with the relevant
"-march=armv9.2-a+EXTENSION..." options. Binutils supports "armv9.2-a"
since upstream commit [8] (first included in 2.38), and the oldest
Binutils version in Buildroot is 2.44.

[1] https://developer.arm.com/Processors/Neoverse%20V3AE
[2] https://developer.arm.com/documentation/101595/0002/The-Neoverse-V3AE--core/Neoverse-V3AE--core-features
[3] https://gcc.gnu.org/gcc-15/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-15.1.0#l222
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=7ca2a803c4a0d8e894f0b36625a2c838c54fb4cd
[6] https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-thor/
[7] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-aarch64.c;h=cd76163488c48e45d43c35b2704d637999d51015;hb=3e93b95c3ae3f00a0283ddbab8029cbc07d96aff#l10833
[8] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=3518022233e6b757c57d3deb7723fd91214fe036

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index ff301785e5..eb5babe29b 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -544,6 +544,12 @@ config BR2_neoverse_v3
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+config BR2_neoverse_v3ae
+	bool "neoverse-V3AE (aka poseidon)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -945,6 +951,7 @@ config BR2_GCC_TARGET_CPU
 	# armv9.2a
 	default "cortex-a720"	if BR2_cortex_a720
 	default "neoverse-v3"	if BR2_neoverse_v3
+	default "neoverse-v3ae"	if BR2_neoverse_v3ae
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
