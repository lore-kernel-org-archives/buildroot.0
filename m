Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD22C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 12:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B56B839B4;
	Fri, 10 Nov 2023 12:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B56B839B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGVYmS_8Wvn3; Fri, 10 Nov 2023 12:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD7B8839BC;
	Fri, 10 Nov 2023 12:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD7B8839BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 547761BF37C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E35F839BB
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 12:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E35F839BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPKRwxcWZ4zX for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2CD839B4
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2CD839B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B2BD86F32; Fri, 10 Nov 2023 12:27:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 13:24:03 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 12ad22701863ca9472c49c7cb27bcef4708581b0
X-Git-Newrev: ef14ff2a718448f418b65efecbfaddb9d90c3d24
X-Patchwork-Hint: ignore
Message-Id: <20231110122703.3B2BD86F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/stm32mp157c_odyssey_defconfig: use a fixed TF-A version
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef14ff2a718448f418b65efecbfaddb9d90c3d24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit f20589cbc7a (configs/stm32mp157c_odyssey: new defconfig) forgot to
specify a fixed TF-A version, so do that now.

When the defconfig was added, the default version was v2.5 - So use that.
Similarly to the other stm32mp1 defconfigs, this needs disabling -Werror
with E=0 to fix a build issue with GCC >= 12.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 69ac9fdbc46f28dbc6f013200e5cf13dd6f0c2aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32mp157c_odyssey_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 6b699830b1..ddcb4d4d2d 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -17,8 +17,10 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-odyssey.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157c-odyssey.dtb E=0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
