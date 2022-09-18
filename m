Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DACEC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C87E86FB17;
	Sun, 18 Sep 2022 09:37:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C87E86FB17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcNAORHyXywF; Sun, 18 Sep 2022 09:37:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE84160E1A;
	Sun, 18 Sep 2022 09:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE84160E1A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32D5C1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F2484011C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F2484011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIAf_tT0M4eb for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A8FF404A1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A8FF404A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4894F84BC1; Sun, 18 Sep 2022 09:35:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 11:16:53 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 310ceef5ceb2764d5e6585798c7231a7e1e8f26d
X-Git-Newrev: 2aadfa64e2a5e374f63318a63dfdfa0db9193d64
X-Patchwork-Hint: ignore
Message-Id: <20220918093506.4894F84BC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] configs/rockpro64: Use
 mainline ATF
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

commit: https://git.buildroot.net/buildroot/commit/?id=2aadfa64e2a5e374f63318a63dfdfa0db9193d64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Use the mainline ATF as it supports the Pine64 ROCKPro64 board.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054016

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 0d198311b9d267b3883e9e979fc273f5c61e323c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/rockpro64_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/rockpro64_defconfig b/configs/rockpro64_defconfig
index 5086320cbc..d39640f855 100644
--- a/configs/rockpro64_defconfig
+++ b/configs/rockpro64_defconfig
@@ -7,9 +7,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="11a0a46a899fcc3b1fdb214b382f3d7495d88eca"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
