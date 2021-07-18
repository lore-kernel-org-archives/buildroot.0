Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80550C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420956103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 420956103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED1783E9A;
	Tue,  3 Aug 2021 23:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id us15uK4Z5_XV; Tue,  3 Aug 2021 23:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D02083ED2;
	Tue,  3 Aug 2021 23:45:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 146C61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88D440F34
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaFDxEkDQHHr for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFD340EB9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EEA2283FEF; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 21:24:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4210b268928fc10ce576c0bb85981a34263eb7ac
X-Git-Newrev: 65a00a4570361376a324f86e7569741e99fc05c6
X-Patchwork-Hint: ignore
Message-Id: <20210803211007.EEA2283FEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/beaglev: update U-Boot
 to enable OF_SEPARATE
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

commit: https://git.buildroot.net/buildroot/commit/?id=65a00a4570361376a324f86e7569741e99fc05c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update commit ID of U-Boot to latest commit in starfive-tech repo [1]
which enables OF_SEPARATE [2].

[1] https://github.com/starfive-tech/u-boot/tree/Fedora_VIC_7100_2021.04
[2] https://github.com/starfive-tech/u-boot/commit/64ead5b83959da8eb87b6963843addf5942e6ed4

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 9b3aba136b..39872b6d0b 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 # HEAD of the starfive-tech:Fedora_VIC_7100_2021.04 branch
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,494e5ef7b8071d0b2fba50616d97771e44cbcb7c)/uboot-494e5ef7b8071d0b2fba50616d97771e44cbcb7c.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64ead5b83959da8eb87b6963843addf5942e6ed4)/uboot-64ead5b83959da8eb87b6963843addf5942e6ed4.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_JH71XX_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
