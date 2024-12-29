Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37471C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA474AEF5;
	Fri, 28 Feb 2025 16:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZESPzpgOvzO; Fri, 28 Feb 2025 16:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 613074EF02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 613074EF02;
	Fri, 28 Feb 2025 16:47:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 144D01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED50042E1E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDgCMr2_Jem5 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2B8542594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2B8542594
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B43D78769C; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:51:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 073ea145df6e6c55427d6c8bf576622b5db19a53
X-Git-Newrev: f4690c2bfd7d51c614d09ff470e725c795bab980
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.B43D78769C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/arm: add the Cortex-A78
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4690c2bfd7d51c614d09ff470e725c795bab980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds the Cortex-A78 core, which is a armv8.2a ISA.
See: [1] [2].

This CPU support was added in GCC 11. See [3] [4].

Buildroot commit 771da1dd9 "configs/nvidia_bf3_defconfig: new
defconfig" [5] added the first defconfig for a board including
this CPU.

[1] https://developer.arm.com/Processors/Cortex-A78
[2] https://developer.arm.com/documentation/101430/0102/Functional-description/Introduction/About-the-core
[3] https://gcc.gnu.org/gcc-11/changes.html
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l98
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/771da1dd9b209adfb27d2dd344a4b2fdcc8bacc4

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.arm | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 219215d122..a11d581c43 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -466,6 +466,14 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
+config BR2_cortex_a78
+	bool "cortex-A78"
+	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_neoverse_n1
 	bool "neoverse-N1 (aka ares)"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -876,6 +884,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a75.cortex-a55"	if BR2_cortex_a75_a55
 	default "cortex-a76"	if BR2_cortex_a76
 	default "cortex-a76.cortex-a55"	if BR2_cortex_a76_a55
+	default "cortex-a78"	if BR2_cortex_a78
 	default "neoverse-n1"	if BR2_neoverse_n1
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
