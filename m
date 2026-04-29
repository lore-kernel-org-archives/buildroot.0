Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EE5CCFA13
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 20:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F43616F5;
	Wed, 29 Apr 2026 20:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SteB8a5VQRyY; Wed, 29 Apr 2026 20:33:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DD51616F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777494813;
	bh=2IW33WyvpxNR2SnxejSek3ExElsIApujw4NkbsS7lN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KPb+mjEXNlZ7OLejD6lWtCpnMb0JEJeLcYnSBCqh52bR6+ncrq/uPHNLIq49B6JUU
	 5wiibwOq+s3QGOwRCwJdogA4OzQDAc5bCjHNzIWsfzzekskGg8kOmE3OyDg6E/lBNx
	 J3avictV1zAM1F475XHplBX4GZRuuEZGLZyyok6aO72LjOXXCnUEyxewizfUd8TvOc
	 jxNZhK9j2m9eDBByDXTDJNgV6IiDfmfQoivF526YuuntAqlZeapMOgo4syJeAQqzx2
	 OfyHKSunbODnsAsZ46slXQM3V2VfVY0fqu5jD02PRE02f3Z2Z5pfW++sN5aXXZKDga
	 Vm9yBRbPNklpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD51616F7;
	Wed, 29 Apr 2026 20:33:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 055F118E
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB4AD842E6
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxP-utcd_FHN for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A675842DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A675842DC
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 20:33:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C86BF83B85; Wed, 29 Apr 2026 20:33:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Apr 2026 22:05:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b31ff563d2113786f15c437a76621a24a56b6d6
X-Git-Newrev: 84c0cb6e9dbc8b3ce11c4482c50f07497f4cd45d
X-Patchwork-Hint: ignore
Message-Id: <20260429203329.C86BF83B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: enable
 FORCE_CHECK_HASHES
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84c0cb6e9dbc8b3ce11c4482c50f07497f4cd45d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Enable the FORCE_CHECK_HASHES and the corresponding custom hashes.

This commit also removes the corresponding .checkpackageignore entry.

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Michael Walle <mwalle@kernel.org>
[Julien:
 - remove .checkpackageinore entry to fix check-package error
 - remove unneeded linux-headers hash due to bootlin toolchain usage
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                | 1 -
 board/kontron/smarc-sal28/patches/linux/linux.hash | 2 ++
 board/kontron/smarc-sal28/patches/uboot/uboot.hash | 2 ++
 configs/kontron_smarc_sal28_defconfig              | 3 ++-
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 100dcd3da4..db6e8b883a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -105,7 +105,6 @@ configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
-configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
 configs/mender_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sam9x60ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/kontron/smarc-sal28/patches/linux/linux.hash b/board/kontron/smarc-sal28/patches/linux/linux.hash
new file mode 100644
index 0000000000..a4cc7bd3f6
--- /dev/null
+++ b/board/kontron/smarc-sal28/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
diff --git a/board/kontron/smarc-sal28/patches/uboot/uboot.hash b/board/kontron/smarc-sal28/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..36322a6a90
--- /dev/null
+++ b/board/kontron/smarc-sal28/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 09d3142589..b1e175b7b2 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,9 +1,10 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/kontron/smarc-sal28/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
