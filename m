Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19F4C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4105C40587;
	Sat,  6 Aug 2022 20:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4105C40587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Jy0P_NT4r6X; Sat,  6 Aug 2022 20:11:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 798A440579;
	Sat,  6 Aug 2022 20:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 798A440579
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C7BA1BF47A
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E558E40579
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E558E40579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qQonp9FL2LG4 for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 20:11:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00D4C40140
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 20:11:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D4C40140
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5722986D1E; Sat,  6 Aug 2022 19:57:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Aug 2022 22:09:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82e61bed8208857d5d13c384c89086c4dd4e1e79
X-Git-Newrev: 5fef2f2669ac7dd00119e5371571c1030fa69570
X-Patchwork-Hint: ignore
Message-Id: <20220806195706.5722986D1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/sipeed_maix*sdcard: add missing
 quotes around string option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fef2f2669ac7dd00119e5371571c1030fa69570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of those 4 defconfigs was failing in Gitlab CI as the
defconfig check doesn't pass, due to the BR2_TARGET_ROOTFS_EXT2_SIZE
string option value missing double quotes:

WARN: defconfig ./configs/sipeed_maixduino_sdcard_defconfig can't be used:
      Missing: BR2_TARGET_ROOTFS_EXT2_SIZE=64M

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054080 (sipeed_maixduino_sdcard_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054070 (sipeed_maix_go_sdcard_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054049 (sipeed_maix_dock_sdcard_defconfig)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054037 (sipeed_maix_bit_sdcard_defconfig)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/sipeed_maix_bit_sdcard_defconfig  | 2 +-
 configs/sipeed_maix_dock_sdcard_defconfig | 2 +-
 configs/sipeed_maix_go_sdcard_defconfig   | 2 +-
 configs/sipeed_maixduino_sdcard_defconfig | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/sipeed_maix_bit_sdcard_defconfig b/configs/sipeed_maix_bit_sdcard_defconfig
index 4ad3b2e1db..e42c3ee425 100644
--- a/configs/sipeed_maix_bit_sdcard_defconfig
+++ b/configs/sipeed_maix_bit_sdcard_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # Filesystem
 BR2_INIT_NONE=y
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_SIZE=64M
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/sipeed_maix_dock_sdcard_defconfig b/configs/sipeed_maix_dock_sdcard_defconfig
index de79ff950b..d1a1b2886d 100644
--- a/configs/sipeed_maix_dock_sdcard_defconfig
+++ b/configs/sipeed_maix_dock_sdcard_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # Filesystem
 BR2_INIT_NONE=y
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_SIZE=64M
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/sipeed_maix_go_sdcard_defconfig b/configs/sipeed_maix_go_sdcard_defconfig
index 7338b0c09d..65a6815c20 100644
--- a/configs/sipeed_maix_go_sdcard_defconfig
+++ b/configs/sipeed_maix_go_sdcard_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # Filesystem
 BR2_INIT_NONE=y
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_SIZE=64M
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
diff --git a/configs/sipeed_maixduino_sdcard_defconfig b/configs/sipeed_maixduino_sdcard_defconfig
index b4f1994239..5785d7acf3 100644
--- a/configs/sipeed_maixduino_sdcard_defconfig
+++ b/configs/sipeed_maixduino_sdcard_defconfig
@@ -36,7 +36,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 # Filesystem
 BR2_INIT_NONE=y
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_SIZE=64M
+BR2_TARGET_ROOTFS_EXT2_SIZE="64M"
 BR2_ROOTFS_OVERLAY="board/canaan/k210-soc/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/canaan/k210-soc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
