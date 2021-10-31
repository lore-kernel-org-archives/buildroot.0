Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4521EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:40:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9B260FC1
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C9B260FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A4540190;
	Sun, 31 Oct 2021 17:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSaqK2sDDw9R; Sun, 31 Oct 2021 17:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C274017E;
	Sun, 31 Oct 2021 17:40:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 625E31BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F3DF80C56
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iCWSDni5tjoH for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:40:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF8A680BCE
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:40:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6EC0D890F3; Sun, 31 Oct 2021 17:36:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 18:35:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfd18cc4c2c44a91bfa713507135b86fa62387b8
X-Git-Newrev: 813713ef488528bb4b7a2d36327ce33e9c372abb
X-Patchwork-Hint: ignore
Message-Id: <20211031173641.6EC0D890F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a13_olinuxino: uboot
 2021.10 needs openssl, pylibfdt and python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=813713ef488528bb4b7a2d36327ce33e9c372abb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uboot 2021.10 needs openssl, pylibfdt and python3 so enable them.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723730015

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a13_olinuxino_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/olimex_a13_olinuxino_defconfig b/configs/olimex_a13_olinuxino_defconfig
index 14cec97d49..6d25d7d0a1 100644
--- a/configs/olimex_a13_olinuxino_defconfig
+++ b/configs/olimex_a13_olinuxino_defconfig
@@ -18,6 +18,9 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A13-OLinuXino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
