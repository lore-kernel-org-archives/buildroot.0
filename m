Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A856F428EC
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BB661050;
	Wed, 15 Apr 2026 20:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tX-_6GIFk5TW; Wed, 15 Apr 2026 20:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD1EB61039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285769;
	bh=+x3oRcGsYCYJdiuV3uQWHc+9AAVefOq8m4Rxj4YS2K0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C0xDNYK7o+rSlHoGXRM0+/izYG8JvWY1Qma4gF9POCpJaRfUYZFU0UQGOGNwvL4lG
	 ELrYbvWDxRmQHI6JBghBk1AwZnCLIOn6lndPs6VqVPQoTw402kRCNDQqS7m6+awT3M
	 2ScYicnhi15HkSq5tArORWFh+nH2WEOsC6IajUeBP/kz2b/MI/q4G/fKBboQd5iAgP
	 b4pVR9mq1NPXzIua9ommKJarWeaE8PXBZhpSFYHVaijLkCNLiOqumJVhIq22SVg4Oh
	 08ZzbZ6LGrO1CJz+nxD602t4TaQhWAO5DZ41gATuBcDKwMTe3fEJGPnwl6AeryVvbD
	 PqK96Ic5t1xqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD1EB61039;
	Wed, 15 Apr 2026 20:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D9B62E7
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FB0084AE3
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B36Fg7HEkf19 for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A047E84ADD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A047E84ADD
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 361D8816A4; Wed, 15 Apr 2026 20:42:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 22:04:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07ab2a508e3073c01b3b18c7b2cb31169f266c6c
X-Git-Newrev: 8e786e873ac759b5804059e8ae750e51c3a006ca
X-Patchwork-Hint: ignore
Message-Id: <20260415204242.361D8816A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: bump u-boot
 and linux
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e786e873ac759b5804059e8ae750e51c3a006ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The old u-boot version doesn't build anymore because of the following
error:

  ModuleNotFoundError: No module named 'pkg_resources'

Bump it to the latest version 2026.04. While at it, also bump linux to
the latest LTS kernel (6.18). The new kernel grew in size, thus we also
have to enlarge the rootfs image.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858936681
Signed-off-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/kontron_smarc_sal28_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index efd4bd41e6..181a92daab 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
@@ -18,11 +18,11 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RCW_SMARC_SAL28=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="160M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
