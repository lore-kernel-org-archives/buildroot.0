Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D45C05022
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 20:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E7283BE8;
	Wed, 20 Sep 2023 20:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E7283BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvifxGifX2Cp; Wed, 20 Sep 2023 20:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC3283BB9;
	Wed, 20 Sep 2023 20:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC3283BB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E20F31BF392
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BADF541ED8
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BADF541ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VBtQkubtlBPr for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 20:35:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C311F41EBE
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 20:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C311F41EBE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0962873F7; Wed, 20 Sep 2023 20:35:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 22:34:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60fad6628efbb187e243737704cac3778a7fb09a
X-Git-Newrev: ec3b960418670db556d3aa1db9ed9f6f4c74d878
X-Patchwork-Hint: ignore
Message-Id: <20230920203539.B0962873F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roc_pc_rk3399: enable OpenSSL for
 U-Boot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ec3b960418670db556d3aa1db9ed9f6f4c74d878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable OpenSSL to build U-boot. Reported by the daily autobuild.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/5083367140

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/roc_pc_rk3399_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 3cc64be176..79a51a8230 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -31,6 +31,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
