Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B145C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC0C61102
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 11:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EC0C61102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1216260A8D;
	Thu,  5 Aug 2021 11:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bY6gxOCQEcct; Thu,  5 Aug 2021 11:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6751D60609;
	Thu,  5 Aug 2021 11:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFA4F1BF844
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A01C660A73
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DI90rQoy1fVq for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06D18605DB
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 11:07:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 950168B75E; Thu,  5 Aug 2021 11:07:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 12:56:21 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d8a7cd188bc3ef6445042510d268724a61e5315e
X-Git-Newrev: 0f725b8f6c2853468b896d767ca4a98abe6691b0
X-Patchwork-Hint: ignore
Message-Id: <20210805110700.950168B75E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] Config.in: add
 BR2_PIC_PIE_ARCH_SUPPORTS hidden option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0f725b8f6c2853468b896d767ca4a98abe6691b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

The nios2 architecture is already excluded from PIC/PIE due to issues,
and we're going to also exclude Microblaze, so let's introduce a
BR2_PIC_PIE_ARCH_SUPPORTS hidden boolean to facilitate adding this new
architecture exclusion.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 70dd4bd156bac2bde07751dc3c4d5da9b14d7d7c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index d9be677c21..be0da30c63 100644
--- a/Config.in
+++ b/Config.in
@@ -713,11 +713,16 @@ endmenu
 
 comment "Security Hardening Options"
 
-config BR2_PIC_PIE
-	bool "Build code with PIC/PIE"
+config BR2_PIC_PIE_ARCH_SUPPORTS
+	bool
 	default y
 	# Nios2 toolchains produce non working binaries with -fPIC
 	depends on !BR2_nios2
+
+config BR2_PIC_PIE
+	bool "Build code with PIC/PIE"
+	default y
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_SHARED_LIBS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	help
@@ -725,7 +730,7 @@ config BR2_PIC_PIE
 	  Position-Independent Executables (PIE).
 
 comment "PIC/PIE needs a toolchain w/ PIE"
-	depends on !BR2_nios2
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_SHARED_LIBS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
@@ -816,7 +821,7 @@ config BR2_RELRO_PARTIAL
 
 config BR2_RELRO_FULL
 	bool "Full"
-	depends on !BR2_nios2 # BR2_PIC_PIE
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_PIE
 	select BR2_PIC_PIE
 	help
@@ -825,7 +830,7 @@ config BR2_RELRO_FULL
 	  program loading, i.e every time an executable is started.
 
 comment "RELRO Full needs a toolchain w/ PIE"
-	depends on !BR2_nios2
+	depends on BR2_PIC_PIE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_SUPPORTS_PIE
 
 endchoice
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
