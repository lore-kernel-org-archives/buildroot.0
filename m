Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61615C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 22:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99CD641677;
	Wed, 27 Jul 2022 22:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99CD641677
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7a0qGv0FhSbI; Wed, 27 Jul 2022 22:27:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 627DB414C0;
	Wed, 27 Jul 2022 22:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 627DB414C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 164261BF47F
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E52AC82ADD
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 22:27:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E52AC82ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02mTxlz1gYU0 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 22:27:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B553082A3B
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B553082A3B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 22:27:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (26)
Received: from zm.lan (pub-42.182.29.194.multiplay.pl [194.29.182.42])
 by server220076.nazwa.pl (Postfix) with ESMTP id D3D5D1BC5AB;
 Thu, 28 Jul 2022 00:27:29 +0200 (CEST)
From: Marcin Niestroj <m.niestroj@grinn-global.com>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 00:27:15 +0200
Message-Id: <20220727222716.1407968-1-m.niestroj@grinn-global.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/orangepi_zero_plus_defconfig: switch to
 mainline TF-A
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the same TF-A as orangepi_zero_plus2 board.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2720001176

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/orangepi_zero_plus_defconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index cf82f8b3cc..e8de5c203d 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -8,10 +8,9 @@ BR2_SYSTEM_DHCP="eth0"
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/apritzel/arm-trusted-firmware.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50iw1p1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="aa75c8da415158a94b82a430b2b40000778e851f"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
