Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC56EE020A
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A760A82C91;
	Wed, 13 Sep 2023 19:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A760A82C91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnpaJpV7o2lM; Wed, 13 Sep 2023 19:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D826E8336F;
	Wed, 13 Sep 2023 19:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D826E8336F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F3C11BF980
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 383EA60ED3
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 383EA60ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_T0_L4jLHZ6 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5ADBE60760
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADBE60760
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B0FD86E72; Wed, 13 Sep 2023 19:30:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 20:54:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7ce77eac68ea2dc742db456610cea5b8bb841bc5
X-Git-Newrev: a70eefcdd8aff7207899c7609faf58cd33d6b318
X-Patchwork-Hint: ignore
Message-Id: <20230913193023.4B0FD86E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=a70eefcdd8aff7207899c7609faf58cd33d6b318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
