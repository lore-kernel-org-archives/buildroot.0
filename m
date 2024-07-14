Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E4C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 15:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49683600C6;
	Sun, 14 Jul 2024 15:08:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pF00vVxeX0hs; Sun, 14 Jul 2024 15:08:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25339606C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25339606C4;
	Sun, 14 Jul 2024 15:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 050951BF44A
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F22AB60585
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgF8nmVYcu0x for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 190036062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 190036062F
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14845867DD; Sun, 14 Jul 2024 15:07:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 17:06:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccd19e14a8665b4de117dd5525f4677ba4c3befc
X-Git-Newrev: 487416dfe502025458596ab5f1ff1cd83ad2968f
X-Patchwork-Hint: ignore
Message-Id: <20240714150757.14845867DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/stm32mp157c_dk2: add hashes
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

commit: https://git.buildroot.net/buildroot/commit/?id=487416dfe502025458596ab5f1ff1cd83ad2968f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the configurations of boards stm32mp157a-dk1 and stm32mp157c-dk2
have the same software versions, it is possible to share the hash files as
well.
The patch uses the hash files for Arm Trusted Firmware, Linux, Linux
headers and U-Boot of stm32mp175a_dk1 also for stm32mp175c_dk2, and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                     | 1 -
 .../stm32mp157}/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 0
 .../stm32mp157}/patches/linux-headers/linux-headers.hash                | 0
 .../{stm32mp157a-dk1 => common/stm32mp157}/patches/linux/linux.hash     | 0
 .../{stm32mp157a-dk1 => common/stm32mp157}/patches/uboot/uboot.hash     | 0
 configs/stm32mp157a_dk1_defconfig                                       | 2 +-
 configs/stm32mp157c_dk2_defconfig                                       | 2 ++
 7 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8edb2f8c70..5bac2b73a0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -278,7 +278,6 @@ configs/socrates_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
-configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
 configs/terasic_de10nano_cyclone5_defconfig lib_defconfig.ForceCheckHash
 configs/toradex_apalis_imx6_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/arm-trusted-firmware/arm-trusted-firmware.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/linux-headers/linux-headers.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/linux-headers/linux-headers.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/linux/linux.hash
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
similarity index 100%
rename from board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
rename to board/stmicroelectronics/common/stm32mp157/patches/uboot/uboot.hash
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index cf42b29a7c..310e179cf7 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -6,7 +6,7 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
-BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157a-dk1/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index c923d2cd60..2a9c31df37 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -6,6 +6,8 @@ BR2_cortex_a7=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
 
 # System configuration
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp157/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp157c-dk2/overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-image.sh"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
