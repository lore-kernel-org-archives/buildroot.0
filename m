Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF58C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:28:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D3480E4B;
	Mon, 12 May 2025 21:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2STCoiT_tQd; Mon, 12 May 2025 21:28:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9923D80E50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9923D80E50;
	Mon, 12 May 2025 21:28:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB0D71E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6CA40271
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_OLzxb6IW9n for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1B6240027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B6240027
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:28:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF4FD867E8; Mon, 12 May 2025 21:28:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:00:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d64ae929685e3b79ba383dee1946a52576bae3de
X-Git-Newrev: a7ea1e658de6d8f951ef8c4e81724c131306db6b
X-Patchwork-Hint: ignore
Message-Id: <20250512212814.AF4FD867E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/bsh/imx6ulz-bsh-smm-m2: flash U-Boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ea1e658de6d8f951ef8c4e81724c131306db6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the board flashing by adding the bootloader, which I had mistakenly
forgotten to include in the script.

Fixes: 322e8d845196 ("configs/imx6ulz_bsh_smm_m2_defconfig: new defconfig")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst | 2 ++
 configs/imx6ulz_bsh_smm_m2_defconfig       | 1 +
 2 files changed, 3 insertions(+)

diff --git a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
index 7c5a884d65..bf3866e414 100644
--- a/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
+++ b/board/bsh/imx6ulz-bsh-smm-m2/nand-full.lst
@@ -25,6 +25,8 @@ SDPV: jump
 
 FB: ucmd setenv fastboot_buffer ${loadaddr}
 FB[-t 60000]: ucmd nand erase.chip
+FB: download -f _image
+FB: ucmd nandbcb init ${fastboot_buffer} nandboot ${filesize}
 FB[-t 60000]: ucmd ubi part rootfs
 FB[-t 60000]: ucmd ubi create root -
 FB: download -f _filesystem
diff --git a/configs/imx6ulz_bsh_smm_m2_defconfig b/configs/imx6ulz_bsh_smm_m2_defconfig
index 2ca98c5856..8a1ae36f8c 100644
--- a/configs/imx6ulz_bsh_smm_m2_defconfig
+++ b/configs/imx6ulz_bsh_smm_m2_defconfig
@@ -42,3 +42,4 @@ BR2_PACKAGE_HOST_E2FSPROGS=y
 BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UUU=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
