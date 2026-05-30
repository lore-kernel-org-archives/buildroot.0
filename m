Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360FCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 392B442B49;
	Sat, 30 May 2026 13:10:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cicjZyUDXOMq; Sat, 30 May 2026 13:09:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6831E42B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780146599;
	bh=pHjmG6RIZtZt+RUytJLSwD3glNzDpp9D3Y9EScB8Wfs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JxpQXdLIzX7UfQ/k6OfUvATD30Xe6e6n/a5qq8VGafOtwMI7qwfBPzJlTjd9ZrjLD
	 5LBSkGo/LVuRrzapE/dlfyiBXBkZrHv9yMQUYMMdk4PPrQ2oSvXoYBPGjTkpMDXqES
	 VB16jNduj0RuibO7oF6SrNl2hZliBI1IAsTXyEizNw38Jqz6VP9RpuoPZfQmJrFHds
	 Qo/FyuJ34q11mD6KYvIumnqx3wHwfkZl4cY4HZruSK4CzdRRaTKdigvzc5jDT1HeWe
	 P5mRSEOUjaJEupuET+3QmguGP51ZDCgODU03s2uAXFc8oaAhf1wF7iR4j4si2Q43AF
	 RqgKlc/fOUrAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6831E42B69;
	Sat, 30 May 2026 13:09:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 933F1F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 848BC42B69
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kc5oClOnUdTC for <buildroot@buildroot.org>;
 Sat, 30 May 2026 13:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85AC42B49
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A85AC42B49
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA3F3874F6; Sat, 30 May 2026 13:09:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:09:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddde78c1bd251225c07f1910d6f9db2fc5189365
X-Git-Newrev: b854bce8b00b879c6cae3a6c5ad0d96cb3d6b05a
X-Patchwork-Hint: ignore
Message-Id: <20260530130944.AA3F3874F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/hppa: remove pa-risc 1.0
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
Content-Type: multipart/mixed; boundary="===============0580260052196466997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0580260052196466997==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b854bce8b00b879c6cae3a6c5ad0d96cb3d6b05a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The new glibc 2.43 we have in Buildroot since commit [1] introduced changes
around 64B atomics [2], which break the build for PA-RISC 1.0. [3]

This is the only C library we support at this point; forcing soft-float
seems to be a workaround, but as this architecture version was not as
widely used as the later 1.1 and we have no hardware or simulator for it at
this point, remove it completely instead to spare the autobuilders.

Link: https://gitlab.com/buildroot.org/buildroot/-/commit/227378b5930b681c79a13476ae60a98753a98a03 [1]
Link: https://sourceware.org/git/?p=glibc.git;a=commit;h=9da0585852e5599ad6e849ccdf2f6f9b04038a3c [2]
Link: https://autobuild.buildroot.org/results/905c7e8db0f8b9014f26925c6e1379a0c54ad446/ [3]
Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy    | 7 +++++++
 arch/Config.in.hppa | 2 --
 arch/arch.mk.hppa   | 4 +---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8fed4b72c1..a872d229ce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -278,6 +278,13 @@ config BR2_BINUTILS_VERSION_2_43_X
 	  binutils 2.43 has been removed, select a newer version
 	  instead.
 
+config BR2_parisc10
+	bool "PA-RISC architecture version 1.0 support removed"
+	select BR2_LEGACY
+	help
+	  Following the build issues with glibc 2.43, Buildroot has
+	  removed support for this architecture version.
+
 comment "Legacy options removed in 2026.02"
 
 config BR2_PACKAGE_QEMU_TARGET_CRIS
diff --git a/arch/Config.in.hppa b/arch/Config.in.hppa
index 5768469f30..16c826dd9e 100644
--- a/arch/Config.in.hppa
+++ b/arch/Config.in.hppa
@@ -3,8 +3,6 @@ choice
 	help
 	  Architecture type (or version) to use.
 
-config BR2_parisc10
-	bool "PA-RISC 1.0"
 config BR2_parisc11
 	bool "PA-RISC 1.1"
 endchoice
diff --git a/arch/arch.mk.hppa b/arch/arch.mk.hppa
index 9d22e4371f..f4a9ac41d2 100644
--- a/arch/arch.mk.hppa
+++ b/arch/arch.mk.hppa
@@ -4,9 +4,7 @@
 
 ifeq ($(BR2_hppa),y)
 
-ifeq ($(BR2_parisc10),y)
-GCC_TARGET_ARCH := 1.0
-else ifeq ($(BR2_parisc11),y)
+ifeq ($(BR2_parisc11),y)
 GCC_TARGET_ARCH := 1.1
 endif
 

--===============0580260052196466997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0580260052196466997==--
