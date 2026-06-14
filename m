Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E13CD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 10:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29DC41176;
	Sun, 14 Jun 2026 10:13:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dw-3XUe1r5Fk; Sun, 14 Jun 2026 10:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01ECB41185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781432008;
	bh=RToKDhDlYT0R/AYNkY6SBWLUwouHgX8URpddSV/M0O8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eNmAZCHxS6fik3PBNrmUgG5rLEDS3HwkayCsoMFj1x+pcmde8HMXwqsE1grqf3Rbj
	 /mdyBLOSzz58aMYqzF6uzB1Vj4Wa99J6fqV6cIk7Zs1iMoP9pokFDGLQXICSsSq1Gd
	 xJhLflNghFttG+BpkxPyAuizl7cVLsfPGGME53uf/8mOXKLYf13/f6fhHddYG+aQlU
	 eYQiyZ4hSD0jHlbmWpFLxGa+VSKLlL0BzdfIYJP2VNkrsyqLBT8waCF7w/MU6bv79F
	 Bnm5IBNRATMMsvR3vNPm8CEGRus/VteAQGrH4so6r0ZjhRN5RA+/ZyOZZHgNsAHIRc
	 xsc52IIZ9lKlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01ECB41185;
	Sun, 14 Jun 2026 10:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA595169
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC3EE41185
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTi1H_2VpUnd for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 10:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7AA141176
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7AA141176
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 10:13:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3A3688257; Sun, 14 Jun 2026 10:13:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jun 2026 12:08:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82d1a378d3f682c235cf0081de3816d18bbbcd16
X-Git-Newrev: dbe0896826e7394da71d653c6987d1a119d85336
X-Patchwork-Hint: ignore
Message-Id: <20260614101305.C3A3688257@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_arm_{ebbr,
 vexpress_tz}_defconfig: switch to Bootlin stable toolchain
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbe0896826e7394da71d653c6987d1a119d85336
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the qemu arm ebbr/tz configurations to use the Bootlin
glibc stable prebuilt external toolchain, as recommended in the
Buildroot meeting report from ELCE 2024:
https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minutes by ~20 minutes.

https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913982 (qemu_arm_ebbr_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728913985 (qemu_arm_vexpress_tz_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_arm_ebbr_defconfig        | 4 +++-
 configs/qemu_arm_vexpress_tz_defconfig | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index 1ccfa142ee..eae560590e 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh board/qemu/arm-ebbr/post-image.sh support/scripts/genimage.sh"
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 300185838c..48273cdf5a 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_ARM_FPU_VFPV3D16=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
