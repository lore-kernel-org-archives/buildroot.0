Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3F7CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 448EF60769;
	Sun,  7 Apr 2024 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SirulU0PNPSv; Sun,  7 Apr 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBB3B60837
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBB3B60837;
	Sun,  7 Apr 2024 07:59:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA7501BF340
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7C2A40787
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 07:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-c2Wx9L8fG4 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8900440783
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8900440783
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD098462F; Sun,  7 Apr 2024 07:59:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 09:47:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7d491b0ffc5c0876053cc94c4112e73096aa5c2
X-Git-Newrev: 0a59e72946561b3a4b11aa8e51ee893852048b44
X-Patchwork-Hint: ignore
Message-Id: <20240407075910.6DD098462F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/bananapi_m2_zero: bump Linux to
 6.8.4 and U-Boot to 2024.04
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
Content-Type: multipart/mixed; boundary="===============6236698631789573229=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6236698631789573229==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0a59e72946561b3a4b11aa8e51ee893852048b44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Necessary adaptations:
- The SD card is now called mmcblk1; adapt Linux boot command accordingly.
- The DTB is now under the allwinner/ folder.
- U-Boot needs OpenSSL to build.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/6544501111

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/bananapi/bananapi-m2-zero/boot.cmd |  2 +-
 configs/bananapi_m2_zero_defconfig       | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/bananapi/bananapi-m2-zero/boot.cmd b/board/bananapi/bananapi-m2-zero/boot.cmd
index 081450935b..70ccdf7045 100644
--- a/board/bananapi/bananapi-m2-zero/boot.cmd
+++ b/board/bananapi/bananapi-m2-zero/boot.cmd
@@ -1,4 +1,4 @@
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk1p2 rootwait
 
 mmc dev 0
 fatload mmc 0 $kernel_addr_r zImage
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index e5c89fce40..8a3e5cd830 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -1,26 +1,26 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Bananapi M2 Zero"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-zero/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.4"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-bananapi-m2-zero"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-h2-plus-bananapi-m2-zero"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="bananapi_m2_zero"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============6236698631789573229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6236698631789573229==--
