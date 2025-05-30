Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB98C5AD49
	for <buildroot@archiver.kernel.org>; Fri, 30 May 2025 19:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3803040A4C;
	Fri, 30 May 2025 19:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ox56YKDT0v13; Fri, 30 May 2025 19:32:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D53140A31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D53140A31;
	Fri, 30 May 2025 19:32:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46496920
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C5440A38
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SoaQKBqHsCu5 for <buildroot@buildroot.org>;
 Fri, 30 May 2025 19:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC9D040A1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC9D040A1E
 for <buildroot@buildroot.org>; Fri, 30 May 2025 19:32:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB8728775A; Fri, 30 May 2025 19:32:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 May 2025 21:31:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6f33d59ef7d3230f36841a97032698dc0f283f93
X-Git-Newrev: de374e06d856dd5079fc792c883b06563af950b0
X-Patchwork-Hint: ignore
Message-Id: <20250530193201.AB8728775A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/arm: add the Cortex-A720
 core
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

commit: https://git.buildroot.net/buildroot/commit/?id=de374e06d856dd5079fc792c883b06563af950b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds the Cortex-A720 core, which is a armv9.2a ISA.
See: [1] [2].

This CPU support was added in GCC 14. See [3] [4].

Cortex-A720 processors are included in boards such as the
Radxa Orion O6. See [5].

This CPU supports Aarch64 only at all exception levels (EL0 to EL3).

[1] https://developer.arm.com/Processors/Cortex-A720
[2] https://developer.arm.com/documentation/102530/0002/The-Cortex-A720--core/Cortex-A720--core-features
[3] https://gcc.gnu.org/gcc-14/changes.html#aarch64
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-14.1.0#l180
[5] https://radxa.com/products/orion/o6/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 546ba8070e..c5695c1eba 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -518,6 +518,14 @@ config BR2_neoverse_n2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV9A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
+
+comment "armv9.2a cores"
+config BR2_cortex_a720
+	bool "Cortex-A720 (aka hunter)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV9A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -914,6 +922,8 @@ config BR2_GCC_TARGET_CPU
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
 	default "neoverse-n2"	if BR2_neoverse_n2
+	# armv9.2a
+	default "cortex-a720"	if BR2_cortex_a720
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
