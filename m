Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62485EE0207
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162098308B;
	Wed, 13 Sep 2023 19:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 162098308B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgsF-jniXbyq; Wed, 13 Sep 2023 19:29:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56FDF82068;
	Wed, 13 Sep 2023 19:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FDF82068
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6270D1BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BD57822C8
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BD57822C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BN1NByUQw0BN for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 561EE81F95
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561EE81F95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4185786E59; Wed, 13 Sep 2023 19:29:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 20:55:07 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d319f44303cf82fbd821bb7604d461e093b0c0ab
X-Git-Newrev: e8239372e7eb82e3f7b1763f64a8c067aa9d432f
X-Patchwork-Hint: ignore
Message-Id: <20230913192916.4185786E59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/freescale_imx6qsabresd_defconfig: fix defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8239372e7eb82e3f7b1763f64a8c067aa9d432f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

While switching ATF to github, the BR2_TARGET_UBOOT_CUSTOM_GIT=y
symbol was not removed. Since then this defconfig fail to build
in gitlab-ci due to invalid defconfig check.

  WARN: defconfig ./configs/freescale_imx6qsabresd_defconfig can't be used:
        Missing: BR2_TARGET_UBOOT_CUSTOM_GIT=y

[1] dd42b159a5f752921ee602530d289c810ad7ee51

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436612

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0ee8ef970bab8680162175d127e388a04286791f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6qsabresd_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 86513d8072..dddfaf5228 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -37,7 +37,6 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
