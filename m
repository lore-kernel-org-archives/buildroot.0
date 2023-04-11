Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48573C77B6F
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 12:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC00441BEB;
	Tue, 11 Apr 2023 12:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC00441BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XiL-7w4LeXtY; Tue, 11 Apr 2023 12:20:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF79B41BE3;
	Tue, 11 Apr 2023 12:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF79B41BE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB741C3BF5
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A328860701
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 12:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A328860701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kONOApSotizP for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAAA3606EC
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAAA3606EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9FA183F79; Tue, 11 Apr 2023 12:20:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 14:17:16 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6838495a88684e69c130cff58f96d5a78bf0e1c7
X-Git-Newrev: 0f4884a44d682fd43809575bcfdc3fb707edd08e
X-Patchwork-Hint: ignore
Message-Id: <20230411122031.C9FA183F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 configs/stm32f469_disco_sd_defconfig: explicitly set U-Boot version
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f4884a44d682fd43809575bcfdc3fb707edd08e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The version of U-Boot must be explicitly set because if you keep the
default setting, the bootloader is continuously updated in buildroot with
the risk of building a non-working image.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 924b163b1e4e1f82ea758a7e69a73f9e6b888e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_sd_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index ea1361efc0..dc00a47e1d 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -18,6 +18,9 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
