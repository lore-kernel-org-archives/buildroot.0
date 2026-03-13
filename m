Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B98A107BCE7
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E3640CC5;
	Fri, 13 Mar 2026 20:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X60YrM1lXoD9; Fri, 13 Mar 2026 20:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5256940CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435313;
	bh=/EumvXj7S689jNYbz3Yfi1ESg2gAbUbvRWll5dZ29qc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Bl+86b+SdoZLnE6L17bOP2jQjhJq4+3vjPeGYRbO1z17kcsO/XOGYnu7Uv7qM6c7r
	 1DUAqukN/Q1/QWZfde794p5LZCzCwP0AVouETnqqW2CwgSda/ZbG1N3lcZZ24mFzCw
	 TosxJ+G0os9qe13QihwYK3yJmDlqPndOmegc31PzhedKRcp0Q3loPiobju592AD+sB
	 VlUtOBP9rNjKdTr5iCJMLPuNZWonmWVuiWDNQ9JtUib6JNj/qxCBBwsnPqjfcv1iWI
	 OOItmKya9dbXfvDq7TQeT+NrCeTsxHRfGHQTl026BCFPoQlAKEtnOauD98OUfJdjuT
	 wh7lDG0xOAYIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5256940CD1;
	Fri, 13 Mar 2026 20:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DE861AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C80806FB
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DB_GNzqG0SY for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B6880874
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02B6880874
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26A0986FA7; Fri, 13 Mar 2026 20:55:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:52:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 174a07ec22d37f0e296f0a7384a1093036205ed5
X-Git-Newrev: 99d626822348e1edd79b7363f010dd549c37c976
X-Patchwork-Hint: ignore
Message-Id: <20260313205508.26A0986FA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/arm: add the Neoverse-V1 core
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/99d626822348e1edd79b7363f010dd549c37c976
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This commit adds the Neoverse-V1 core, which is an armv8.4a ISA.
See: [1] [2].

This CPU support was added in GCC 11. See [3] [4] [5].

This CPU supports Aarch64 at all exception levels (EL0 to EL3).
It also supports Aarch32 only in EL0 (user-space). This means it's
technically possible to compile Aarch32 code. GCC has the support
to do so. Since Buildroot recompiles a full system (ATF, Kernel,
user-space) this support has limited value. This is why this
CPU is limited to 64bit builds only.

Qemu added neoverse-v1 support in upstream commit [6], first included
in v8.1.0.

[1] https://developer.arm.com/Processors/Neoverse%20V1
[2] https://developer.arm.com/documentation/101427/0102/Functional-description/Introduction/About-the-core
[3] https://gcc.gnu.org/gcc-11/changes.html#arm-targets
[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config/aarch64/aarch64-cores.def;hb=releases/gcc-11.1.0#l141
[5] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=c9d56eb777552ac5ee0c281e1f6e34b6fe929b77
[6] https://gitlab.com/qemu-project/qemu/-/commit/c74138c6c040b62e941326a4fbb25a93fdd35b72

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in.arm | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index a0bf6c3386..16911f5b95 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -498,6 +498,12 @@ config BR2_tsv110
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
+config BR2_neoverse_v1
+	bool "neoverse-V1 (aka zeus)"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARM_CPU_HAS_FP_ARMV8
+	select BR2_ARM_CPU_ARMV8A
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_11
 config BR2_saphira
 	bool "saphira"
 	depends on BR2_ARCH_IS_64
@@ -918,6 +924,7 @@ config BR2_GCC_TARGET_CPU
 	default "neoverse-n1"	if BR2_neoverse_n1
 	default "tsv110"	if BR2_tsv110
 	# armv8.4a
+	default "neoverse-v1"   if BR2_neoverse_v1
 	default "saphira"	if BR2_saphira
 	# armv9.0a
 	default "cortex-a710"	if BR2_cortex_a710
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
