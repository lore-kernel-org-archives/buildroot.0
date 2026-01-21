Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD6C44506
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 18:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B21785462;
	Wed, 21 Jan 2026 18:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bw_WQmZ6Ohy1; Wed, 21 Jan 2026 18:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D5285465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769019439;
	bh=FaH5pqtGAt99FjqNODDQKz4+GebbdRfZGf29EHRu8yA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oMvUk05aq4yY8ZaVvXHaHn8B2hTuo+PyFSHtRWQblrsknvYbtWhhtBmZ+I3cysNXM
	 qnxlhMua6r86z5m5sERdGR/hvmZ9Ncrl4Jq1Z1sqySrqAymGHbY9PhsRrVo2Gm6Xt/
	 wlRjw54oTi5ZYyEeqPfHxquV5tLAW4alkthMQU0LwhAD/XBIQ51n9XCSFsSfhdI4fu
	 Iim6LFZQXkkttYQCM09JDNPus6lKXRUsg666eYqSeN8JnA39qNBtukN5n3Nmz7xh+J
	 zKA3GAtoJ497joh6vlYjvsz0iGrlQEQMixsdGk1mb0WJRbYQYtu+g8HSxww3Eljt4S
	 8CU7MTeCrlNYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D5285465;
	Wed, 21 Jan 2026 18:17:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB2934F
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2BB6F824
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnNGzH5VuM4a for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D5C6F81F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69D5C6F81F
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 591E4873ED; Wed, 21 Jan 2026 18:17:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Jan 2026 19:13:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9a40c726f54df86382b10bcc74e81c487d7410f
X-Git-Newrev: 51a10663580833388e10941e1ec70376a1b1d5bc
X-Patchwork-Hint: ignore
Message-Id: <20260121181716.591E4873ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: fix 'bootloader' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=51a10663580833388e10941e1ec70376a1b1d5bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/uboot/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 22a5c35821..29f3f40b1b 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -685,7 +685,7 @@ config BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE
 	string "Custom psu_init_gpl file"
 	depends on BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG
 	help
-	  On ZynqMP the booloader is responsible for some basic
+	  On ZynqMP the bootloader is responsible for some basic
 	  initializations, such as enabling peripherals and
 	  configuring pinmuxes. The psu_init_gpl.c file (and,
 	  optionally, psu_init_gpl.h) contains the code for such
@@ -722,7 +722,7 @@ config BR2_TARGET_UBOOT_ZYNQ_PS7_INIT_FILE
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
