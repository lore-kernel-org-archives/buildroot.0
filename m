Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D5BCD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 20:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24BFE60BE0;
	Tue, 19 May 2026 20:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHPTrwefWMBZ; Tue, 19 May 2026 20:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C3E160BD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779222784;
	bh=LqdVhWCbedjwfJ5Ust8Isi2Fk19/k1KHbhoh6BbyOJE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AaepCccbcdRShr3lDRwSZIF9AXpG3LSev+8KxuXxY4G02myBi8tcR0yH6dyl5X/zf
	 z8XxVg/D9rSPg8VB1tSnjSwW7TIkoVYqBc8PgesW2keqWDXgtsXSzkLPLCnLwZNCO6
	 oYuPZ1x2nfULRtdHquDiHVn8kXdoexsQgdoXyOL/pWSS9KQnOcQ9NqIi5XBrAFw/GE
	 V8WuwxMxl6x7iSfyGTR7Jl+cz3NuIJYdpjVVEgP4O2SD/Y/gGiLP7iM/8ALs1Rjn5P
	 PUPL5gJAVUktBKEFTuW3IvHImrlTmgU6xFC+ldthWyY7OxjlAy+lNnDCEl40Re6Qq4
	 0SEJpIk6i7BiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C3E160BD6;
	Tue, 19 May 2026 20:33:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E26A1B2
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49AA940586
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFrLaVkyAJdt for <buildroot@buildroot.org>;
 Tue, 19 May 2026 20:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B1A94056E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B1A94056E
 for <buildroot@buildroot.org>; Tue, 19 May 2026 20:33:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5D9D867E0; Tue, 19 May 2026 20:32:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 19 May 2026 21:54:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc2621ef40b78a66da14f97efa6068189fa91651
X-Git-Newrev: 95f86e5d8ea50ac12ce667307bec2af7e9a1b145
X-Patchwork-Hint: ignore
Message-Id: <20260519203253.C5D9D867E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/pine64: switch to
 external toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95f86e5d8ea50ac12ce667307bec2af7e9a1b145
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Switch to an external glibc stable Bootlin toolchain following the
recommendation from
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/pine64_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index e19b7b5012..a2e19b1a4b 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -1,6 +1,8 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
