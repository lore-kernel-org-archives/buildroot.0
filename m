Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB021C52D71
	for <buildroot@archiver.kernel.org>; Fri,  9 Aug 2024 08:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AB38199D;
	Fri,  9 Aug 2024 08:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPMNWs3u-kQv; Fri,  9 Aug 2024 08:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AED0581EC4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AED0581EC4;
	Fri,  9 Aug 2024 08:52:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 211C91BF281
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5BA64123C
 for <buildroot@lists.busybox.net>; Fri,  9 Aug 2024 08:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F74S6LJdkjWV for <buildroot@lists.busybox.net>;
 Fri,  9 Aug 2024 08:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.154.123;
 helo=esa.microchip.iphmx.com;
 envelope-from=prvs=944a06301=jamie.gibbons@microchip.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4D6541240
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D6541240
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4D6541240
 for <buildroot@buildroot.org>; Fri,  9 Aug 2024 08:52:13 +0000 (UTC)
X-CSE-ConnectionGUID: ewcEd6WfTG6n55+qcfmOcA==
X-CSE-MsgGUID: Um9cv/t9TM+ZSsT5ZggOMA==
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="197717201"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2024 01:52:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Aug 2024 01:51:52 -0700
Received: from jamie-dev.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 9 Aug 2024 01:51:51 -0700
To: <buildroot@buildroot.org>
Date: Fri, 9 Aug 2024 09:53:34 +0100
Message-ID: <20240809085334.3530176-3-jamie.gibbons@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
References: <20240809085334.3530176-1-jamie.gibbons@microchip.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1723193533; x=1754729533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aixuSovAE4NtZ+yLvx4Mim0/sYmZG9qeaNz5/dnc6Io=;
 b=1r78doc5A7Mn9ObXy8+5rKFi1ntcuajNxk6BV4/B9y2Fgc3JNP2mJWgA
 d/paxGXbd+XW9oEF0wxvjedQL1Rz5tS57NxKRyXkfH3kCipSIq5rug+11
 A1PIUSFqtlZaXLxyrvuT3kBpNpcAapcBgZPomwCzHy0utX1rvYT6DM5cy
 LtFJdDa6PevhqPy8+Dg7JvsMnp4VAX2u35QixGSRbxt2Vap57z66lOMop
 D1/pcYvAR1OdSmJ94KXxn8/0o8RbP6PlQ+WghCQiYuBk70ZjvNwVB7T+b
 y5oxsKslZeN0zs4RVK3KHakfPpulwWZy9gdzBJSfJ9r+ZJchTwUAfVrMo
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=microchip.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=1r78doc5
Subject: [Buildroot] [PATCH v3 2/2] configs/microchip_mpfs_icicle: update
 custom tarballs
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
From: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Reply-To: Jamie Gibbons <jamie.gibbons@microchip.com>
Cc: Jamie Gibbons <jamie.gibbons@microchip.com>,
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Linux kernel and U-Boot custom tarballs were updated incorrectly
in commit 45db64545742. Update these to select specific release tags
instead of branches. Update the U-Boot and Linux hashes to match
these changes.

Fixes: 45db64545742 ("configs/microchip_mpfs_icicle: bump Linux and
U-Boot, add hashes")

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Tested-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index 025d630f7d..416a8b1550 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a45642bd69b11d9312c15faac67fbd15b0ef90a6d90662d18c0760e37165c7cc  linux4microchip+fpga-2024.06.tar.gz
+sha256  dcb7b41fd363729675c34545fcb514d5a94dbb3714ee10f527a26ca7716c2579  linux-linux4microchip+fpga-2024.06.tar.gz
diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index ddb73b9a71..2628d4b4fd 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5d9bcbebe9723ab12cbf2b60277268741e84e4aadbe7ecd8c05be046f202d8a1  linux4microchip+fpga-2024.06.tar.gz
+sha256  d461c45a9c5acd019776cdcf8ab2b571315282a880dd6580431f7dd5bfac3889  uboot-linux4microchip+fpga-2024.06.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 30d07550ac..4337ac34b4 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux-6.6-mchp+fpga)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.06)/linux-linux4microchip+fpga-2024.06.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,u-boot-2023.07-mchp)/linux4microchip+fpga-2024.06.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.06)/uboot-linux4microchip+fpga-2024.06.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
