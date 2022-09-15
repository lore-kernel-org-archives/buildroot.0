Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3618AECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 08:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8DB41910;
	Thu, 15 Sep 2022 08:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF8DB41910
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5W9Bi6kjupBA; Thu, 15 Sep 2022 08:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C3B4400AF;
	Thu, 15 Sep 2022 08:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C3B4400AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46B131BF475
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBA1A80B2B
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 08:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBA1A80B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNaHixo0dtlA for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 08:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A0A80B3B
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 08:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A0A80B3B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F3D9383C12; Thu, 15 Sep 2022 08:43:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 10:42:47 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e47b4b2a54b29043f46d411219778562035815a6
X-Git-Newrev: 2a15f65c8f84aec05e5fbe0c44911d2e954737ae
X-Patchwork-Hint: ignore
Message-Id: <20220915084326.F3D9383C12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] configs/pine64_sopine:
 Use mainline ATF
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a15f65c8f84aec05e5fbe0c44911d2e954737ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Use the mainline ATF as it supports the Pine64 SoPine module.

Fixes:
  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d5ba95da6084d5d6cadca06018925f2172453cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/pine64_sopine_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/pine64_sopine_defconfig b/configs/pine64_sopine_defconfig
index 6fa511477c..f59f2387eb 100644
--- a/configs/pine64_sopine_defconfig
+++ b/configs/pine64_sopine_defconfig
@@ -7,10 +7,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
