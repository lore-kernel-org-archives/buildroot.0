Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE17C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 11:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5A8407E8;
	Sun, 23 Feb 2025 11:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fQEAKDeUK7u; Sun, 23 Feb 2025 11:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11EC140813
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11EC140813;
	Sun, 23 Feb 2025 11:18:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 698A2943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 11:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 587E740175
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 11:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DAsOMM5J_EZv for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 11:18:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EEE2400FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EEE2400FE
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 11:18:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63890879B3; Sun, 23 Feb 2025 11:18:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 11:58:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2578cf368e604211bacaef27738ea96dcaba7572
X-Git-Newrev: 7340b91a5e358f0b8b279a29327d79a2368f4e97
X-Patchwork-Hint: ignore
Message-Id: <20250223111835.63890879B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/polyhex_debix_model_a_defconfig:
 Remove BR2_PACKAGE_HOST_IMX_MKIMAGE
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

commit: https://git.buildroot.net/buildroot/commit/?id=7340b91a5e358f0b8b279a29327d79a2368f4e97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_PACKAGE_HOST_IMX_MKIMAGE is only needed when the NXP U-Boot
version is used.

polyhex_debix_model_a_defconfig uses mainline U-Boot, which builds flash.bin
directly, without using the NXP imx-mkimage tool.

Remove such unneeded package.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/polyhex_debix_model_a_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/polyhex_debix_model_a_defconfig b/configs/polyhex_debix_model_a_defconfig
index 97348b7b33..6f8ec49410 100644
--- a/configs/polyhex_debix_model_a_defconfig
+++ b/configs/polyhex_debix_model_a_defconfig
@@ -42,6 +42,5 @@ BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_IMX_MKIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
