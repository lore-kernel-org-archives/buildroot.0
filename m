Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995FEE9D41B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DAE160FAC;
	Wed,  4 Feb 2026 17:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbYz1CH6O9t8; Wed,  4 Feb 2026 17:08:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 254676120D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224906;
	bh=rU0s66dDO0JuzwadGDbNhdQi9Yk/+cjPr224EowTRtU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fPksB/4MJLgPriP0f0wXv6fDpojU+Q47wC5ck7xG1q9TsGNpnzZhi3RYzjSJibsXc
	 uXI4QJ0oDe5Cl9+EInachArZdXYQRNC0tYV5T26H14CGODknoavOTX9zrCMNOn8taa
	 3FrLcEtHA2L0rB7CVuSvk2LIm/11T6CU3JEyMjUlX+d+71YqBg3qLY472Lf3kecHkr
	 Okc7ql0cNR/RFNsZm8ht7NnGCdWUNSsJw3DKITE19RG6EvUEkpsbdWF5y8+/D9rSY1
	 94cgmD+D73q0MSlH6vcL01eQbEBDoj8r1YXNYA3znZhbT76hZ1DMxfCcY77A7A5b/W
	 LS/ffYaEdfC4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 254676120D;
	Wed,  4 Feb 2026 17:08:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A01F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BDE04054D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq0ZOHSMpA_M for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C6E40550
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C6E40550
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 788008697F; Wed,  4 Feb 2026 17:07:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:27:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f08922568a0163c94dd1c54ac9d99465ad6f6760
X-Git-Newrev: 5e04489b1ca8745ea509db38253b1e116f6493e1
X-Patchwork-Hint: ignore
Message-Id: <20260204170747.788008697F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] boot/uboot: fix
 'bootloader' typo
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5e04489b1ca8745ea509db38253b1e116f6493e1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 51a10663580833388e10941e1ec70376a1b1d5bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d40e1e95e0..63d1c734ab 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -677,7 +677,7 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 	string "Custom psu_init_gpl file"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
-	  On ZynqMP the booloader is responsible for some basic
+	  On ZynqMP the bootloader is responsible for some basic
 	  initializations, such as enabling peripherals and
 	  configuring pinmuxes. The psu_init_gpl.c file (and,
 	  optionally, psu_init_gpl.h) contains the code for such
@@ -714,7 +714,7 @@ config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	depends on BR2_TARGET_UBOOT_ZYNQ
 	help
-	  On Zynq the booloader is responsible for some basic
+	  On Zynq the bootloader is responsible for some basic
 	  initializations, such as enabling peripherals and
 	  configuring pinmuxes. The ps7_init_gpl.c file (and,
 	  optionally, ps7_init_gpl.h) contains the code for such
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
