Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2E7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028F61075
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3028F61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D56434021D;
	Sun, 31 Oct 2021 17:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mQPJlC3BW7oF; Sun, 31 Oct 2021 17:40:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F3240210;
	Sun, 31 Oct 2021 17:40:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 714E41BF969
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 610E44017E
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gxpl8S3umUCl for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:40:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B841C40153
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 64D18890F2; Sun, 31 Oct 2021 17:36:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 18:34:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 297f2220a19e0ab75d7b8ce8e7b8eb4f91545a4d
X-Git-Newrev: dfd18cc4c2c44a91bfa713507135b86fa62387b8
X-Patchwork-Hint: ignore
Message-Id: <20211031173641.64D18890F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a10_olinuxino_lime: uboot
 2021.10 needs openssl and python3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dfd18cc4c2c44a91bfa713507135b86fa62387b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uboot 2021.10 needs openssl and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730014

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a10_olinuxino_lime_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index c3b4f0161b..d0e00301f7 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -36,7 +36,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
