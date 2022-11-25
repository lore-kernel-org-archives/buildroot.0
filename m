Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E2C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 21:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C71AA8229C;
	Fri, 25 Nov 2022 21:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C71AA8229C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHhJRzOt-aF9; Fri, 25 Nov 2022 21:56:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 010B88224F;
	Fri, 25 Nov 2022 21:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 010B88224F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B5CF1BF3D1
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DB2F8224F
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 21:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB2F8224F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3e79Xwb961iw for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 21:56:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DA4A82246
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 21:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DA4A82246
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A9B78469C; Fri, 25 Nov 2022 21:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 22:54:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d5d447c5d531479ea5fa60ca3231ec91bde5354
X-Git-Newrev: 634b55a1c6e5009bfd592bd9c40b99fd14cbf668
X-Patchwork-Hint: ignore
Message-Id: <20221125215605.3A9B78469C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/nitrogen8*: extend filesystem size
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

commit: https://git.buildroot.net/buildroot/commit/?id=634b55a1c6e5009bfd592bd9c40b99fd14cbf668
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The default ext2 filesystem size of 60 MB is now too small to contain
the root filesystem of the Nitrogen i.MX8 configurations. The
nitrogen8mp_defconfig configuration for examples generates 55 MB of
contents in the rootfs, so an image of 60 MB is slightly too small.

This commit extends the filesystem size to 120 MB.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859635 (nitrogen8mp)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859634 (nitrogen8mn)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859633 (nitrogen8mm)
  https://gitlab.com/buildroot.org/buildroot/-/jobs/3372859632 (nitrogen8m)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/nitrogen8m_defconfig  | 1 +
 configs/nitrogen8mm_defconfig | 1 +
 configs/nitrogen8mn_defconfig | 1 +
 configs/nitrogen8mp_defconfig | 1 +
 4 files changed, 4 insertions(+)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index a6a9526dee..932ff97ab3 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index 0130a6a62a..53fbdc3da4 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 50976959c5..51a0a56140 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index a14a024353..05caae466a 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Linux headers same as kernel, a 5.15 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
