Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2427C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 11:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 725E641477;
	Sat, 12 Feb 2022 11:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b396ZcLlsSea; Sat, 12 Feb 2022 11:55:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B25A641298;
	Sat, 12 Feb 2022 11:55:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33AAC1BF3A4
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2014681759
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 11:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkM9YjbPBH-5 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8786D81570
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 11:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AAC0682AB5; Sat, 12 Feb 2022 11:46:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 12:50:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d03b24075c3d02d3471412dd7e087964b1d9198
X-Git-Newrev: 5069a6ba15b4118111bf6b33b8e98553b3c084e6
X-Patchwork-Hint: ignore
Message-Id: <20220212114631.AAC0682AB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/snps_archs38_hsdk: bump kernel and
 u-boot versions
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

commit: https://git.buildroot.net/buildroot/commit/?id=5069a6ba15b4118111bf6b33b8e98553b3c084e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump versions:
- use U-Boot 2022.01
- use Linux kernel v5.16

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/snps_archs38_hsdk_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 4a1ac3fcff..413ca5098c 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,7 +1,7 @@
 BR2_arcle=y
 BR2_archs38_full=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_PACKAGE_GLIBC_UTILS=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -21,10 +21,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
