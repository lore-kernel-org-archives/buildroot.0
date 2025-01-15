Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CD2C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874FF8501A;
	Fri, 28 Feb 2025 16:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9Zbbtt6RcEr; Fri, 28 Feb 2025 16:59:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A70985019
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A70985019;
	Fri, 28 Feb 2025 16:59:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B011DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71378419EC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPLGEHJqTXxt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3FE442583
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3FE442583
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E31687912; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 49cc81057b35f07223a98ef36f5f3ec28a626ecc
X-Git-Newrev: 5cb7e4ad3dee83ef6e4b98441af26417b4b32fff
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.9E31687912@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/glibc: remove nios2
 support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5cb7e4ad3dee83ef6e4b98441af26417b4b32fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Doing so, we remove nios2 support from the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 arch/Config.in          | 1 +
 package/glibc/Config.in | 1 -
 package/glibc/glibc.mk  | 4 ----
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index e57f4b2baa..7da2dc69e4 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
 	  Nios II is a soft core processor from Altera Corporation.
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 6075d28874..d464b3def8 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -20,7 +20,6 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	default y if BR2_x86_64
 	default y if BR2_microblaze
-	default y if BR2_nios2
 	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
 	depends on !BR2_POWERPC_CPU_HAS_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cee03a16fd..e026c18762 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -143,10 +143,6 @@ endif
 # Glibc nowadays can be build with optimization flags f.e. -Os
 
 GLIBC_CFLAGS = $(TARGET_OPTIMIZATION)
-# crash in qemu-system-nios2 with -Os
-ifeq ($(BR2_nios2),y)
-GLIBC_CFLAGS += -O2
-endif
 
 # glibc can't be built without optimization
 ifeq ($(BR2_OPTIMIZE_0),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
