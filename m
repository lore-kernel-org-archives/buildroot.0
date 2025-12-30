Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E931BEE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B125C608E9;
	Tue, 30 Dec 2025 22:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avy9pwvLab2t; Tue, 30 Dec 2025 22:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C057560A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133592;
	bh=RAqNRYNhWwylIjksmMHyAnk09eEkJQDXReQHAzCUYZc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l1P5yDJYNQ0azkCtXwEcg6M/gZfDeXZTD9kxuMWn3PhUJ7GkE+UiDZlGsltV3pszw
	 wQ52Do3WJOOh14LIjvTkvm2/ssjufM2cp3Bm6EZ50DmWoXVB4qxVEyl3Gkh+OeghJG
	 ZDcNRI7zBzerRr+nGYCr8frYoDBiMktg+Wlayb/fye+bDuz3XPKbblgRQ7mNI38K8s
	 +KuijJud3o953MaeVmx99szAMv1aayn4QGU0izmVa1OEJ8B6VmyI6EL2TfjbNqljpZ
	 nUGGMuaVM51v4f+YP6hgmwAG6dIZk799vAgwG3m0/hJP1sM/ijbigYqZ3zuZ/qCyf5
	 G7dAo7525ALcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C057560A56;
	Tue, 30 Dec 2025 22:26:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE0CD35B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C00F26080C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_F8iOrvGCFB for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E194460608
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E194460608
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6C57FB2F; Tue, 30 Dec 2025 22:26:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f53a1af56b8cedda58038413cbb9e621ab01705a
X-Git-Newrev: 1721206b35d6b2b39ce337759674b5ab7123005e
X-Patchwork-Hint: ignore
Message-Id: <20251230222627.DF6C57FB2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi3_qt5we: drop defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=1721206b35d6b2b39ce337759674b5ab7123005e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, remove the only
defconfig that uses it. This defconfig is according to our DEVELOPERS
file, unmaintained.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/raspberrypi3_qt5we_defconfig | 43 ------------------------------------
 1 file changed, 43 deletions(-)

diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
deleted file mode 100644
index 48284513dd..0000000000
--- a/configs/raspberrypi3_qt5we_defconfig
+++ /dev/null
@@ -1,43 +0,0 @@
-BR2_arm=y
-BR2_cortex_a53=y
-BR2_ARM_FPU_NEON_VFPV4=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
-BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
-BR2_PACKAGE_XZ=y
-BR2_PACKAGE_LIBERATION=y
-BR2_PACKAGE_QT5=y
-BR2_PACKAGE_QT5BASE_EXAMPLES=y
-BR2_PACKAGE_QT5BASE_GIF=y
-BR2_PACKAGE_QT5WEBENGINE=y
-BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
-BR2_PACKAGE_RPI_FIRMWARE=y
-BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
-BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
-BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
-BR2_PACKAGE_RPI_USERLAND=y
-BR2_PACKAGE_CA_CERTIFICATES=y
-BR2_PACKAGE_NTP=y
-BR2_PACKAGE_KMOD_TOOLS=y
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_KMOD_XZ=y
-BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
