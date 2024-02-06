Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0B8C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F57661233;
	Tue,  6 Feb 2024 16:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F57661233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0sSCSjAeksB; Tue,  6 Feb 2024 16:32:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 551C061042;
	Tue,  6 Feb 2024 16:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551C061042
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF9671BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B16CF41C14
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B16CF41C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVAHa8aXWzpy for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:31:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C6441FCD
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C6441FCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D460287138; Tue,  6 Feb 2024 16:31:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 17:31:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5367c08162aea89f0b1140d80a134ce67d0252d4
X-Git-Newrev: 81724d15cdaded0b40cd76f1736002fc6fef2554
X-Patchwork-Hint: ignore
Message-Id: <20240206163157.D460287138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2_defconfig: update
 arm-trusted-firmware to lts-v2.8.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=81724d15cdaded0b40cd76f1736002fc6fef2554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The assumption is that updates to the stable branch should not break anything,
so we use the latest LTS rather than a specific version.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/stm32mp157c_dk2_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 7472be38bb..c48705b2fb 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -27,8 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_8_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
