Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D0CC25B10
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A468216F;
	Wed,  1 May 2024 21:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq24YA2XChvy; Wed,  1 May 2024 21:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 666D08213C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 666D08213C;
	Wed,  1 May 2024 21:33:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE511BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9BD64031F
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c84pVS6D-Ff8 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2AD94040D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2AD94040D
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF96886525; Wed,  1 May 2024 21:33:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 23:32:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d1aaddb2bd2f1a6636e93909fe55218e8bfd3ea
X-Git-Newrev: 1f7c58145497ed01d566e08734a62feef1696807
X-Patchwork-Hint: ignore
Message-Id: <20240501213325.DF96886525@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: enable on RISC-V 64-bit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f7c58145497ed01d566e08734a62feef1696807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gnu-efi RISC-V 64bit support was introduced in commit [1], first
included in version 3.0.14.

This commit adds this architecture in _ARCH_SUPPORTS.

[1] https://sourceforge.net/p/gnu-efi/code/ci/b95f138fa1550040e68ac3dd34cfce7d148d7984

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in  | 1 +
 package/gnu-efi/gnu-efi.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index d456a23837..4f44cf9f64 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
 	default y if BR2_ARM_CPU_HAS_ARM
+	default y if BR2_RISCV_64
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 96caaeb933..2eed4e40d2 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,6 +24,8 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
+else ifeq ($(BR2_RISCV_64),y)
+GNU_EFI_PLATFORM = riscv64
 endif
 
 GNU_EFI_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
