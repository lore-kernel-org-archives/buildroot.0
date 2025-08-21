Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A4CA0EFA
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 22:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E0B80D60;
	Thu, 21 Aug 2025 22:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LAadi2GHlUuf; Thu, 21 Aug 2025 22:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD33280D5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD33280D5B;
	Thu, 21 Aug 2025 22:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6848F1C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EBFB400CC
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xATxwrTTkpZ for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 22:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ACBE400BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8ACBE400BA
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 22:44:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7627B8789D; Thu, 21 Aug 2025 22:44:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Aug 2025 00:30:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d487ae5de279fc1402552a8f608e898d6bc7f0
X-Git-Newrev: 2c6a292b93855f40544e10b4b364455dfcd68fd9
X-Patchwork-Hint: ignore
Message-Id: <20250821224433.7627B8789D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ci20: U-Boot needs host-openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c6a292b93855f40544e10b4b364455dfcd68fd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Very likely since the bump of U-Boot from 2020.07 to 2024.01 in commit
dedb7dc6d6543d5ce16ac73f927e0a33806075e1, U-Boot needs host-openssl,
so let's add the necessary dependency.

With this change ci20_defconfig builds again:

  https://gitlab.com/tpetazzoni/buildroot/-/jobs/11054480107

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273114

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 4a66e1ac33..bb4863cb1d 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
