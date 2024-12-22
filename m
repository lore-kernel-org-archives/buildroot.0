Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97873C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631434F955;
	Fri, 28 Feb 2025 16:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hngJPYwG_VOs; Fri, 28 Feb 2025 16:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0E4F42D23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0E4F42D23;
	Fri, 28 Feb 2025 16:43:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 129E11DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E622E42A45
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOgHLJTZRC0b for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F84E424F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F84E424F9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AD4D84487; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Dec 2024 13:21:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 55781877d9f23f897b9149d27bf793045b9c7ef5
X-Git-Newrev: 4f04bde045ad167ba605b6e78545e79dff153a58
X-Patchwork-Hint: ignore
Message-Id: <20250228162944.4AD4D84487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/rock5b: Switch to
 mainline TrustedFirmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f04bde045ad167ba605b6e78545e79dff153a58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The Rock 5b board support currently uses a binary trusted firmware
blob from the rockchip-rkbin package. Recently, the Rock 5b's SoC,
i.e., the rk3588, received mainline TrustedFirmware-A support:

https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/21840
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/29363

This support was recently released as part of the v2.12 version of
the TrustedFirmware-A. This patch changes the defconfig from using
the rockchip-rkbin atf binary blob to building the TrustedFirmware-A
v2.12 for the rk3588 from source.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/rock5b_defconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index f898e86c8c..47a7acc083 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -23,9 +23,15 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
 BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
-BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3588"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
