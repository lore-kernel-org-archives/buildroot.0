Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E215EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E25D40CAC;
	Mon, 21 Aug 2023 20:13:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E25D40CAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sr0JqSJ5akVf; Mon, 21 Aug 2023 20:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DCBE40CB3;
	Mon, 21 Aug 2023 20:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DCBE40CB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E12B1BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8BD661130
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BD661130
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYJiotAiAeu1 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E5A06112C
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5A06112C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E4CF86029; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 13:49:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dedb686dd283a692376e000e61b64f6b055b1c42
X-Git-Newrev: 4b026eb1f48fc4deabb927c351e0bca9444f466f
X-Patchwork-Hint: ignore
Message-Id: <20230821200127.1E4CF86029@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/andes_ae350_45: Fix
 build failure caused by Zicsr and Zifencei
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b026eb1f48fc4deabb927c351e0bca9444f466f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Don't specify the ARCH_FLAGS of U-Boot, so both extensions can be
appended to -march when building w/ gcc-12.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059655

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/andes_ae350_45_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index 998276635b..ef29ab6454 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -38,7 +38,6 @@ BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="ARCH_FLAGS=-march=rv64imafdc"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
