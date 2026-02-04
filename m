Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19847E9537E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D15B983C48;
	Wed,  4 Feb 2026 11:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82e91scJeUb0; Wed,  4 Feb 2026 11:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDA9F83C69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203242;
	bh=X6Gc2MGXLa0KsCYM7fnHaHSrZI/xatN9dr25EmbDbkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DhVOU5ikLSEtU8e5Lx5vFJYD99tedg/I40pjzlavn1T6kC/2wIQKBhtjNmwHFJ0qc
	 3tJk+tp31AuLo2rqjYkjyz1XhwB0icLpfKyM+IGccndIJVQWo6e+WQJKyZ4cHdKUPs
	 cH+EsH+KGBfgNwbP59P1UdJ5C7yWgJr7q8fi1PzWAOdxVKXsO25YPfaHP6n06aK/30
	 HlaAsQMLDgU9O7GC4WFdFNXCvfKd2TqavOCXafRiip/9Y4xpEPZtfxkLdF0LKIzinw
	 4hB/Ru2WpzYa1HW8Qt2IhJGnEIoRmE6ENX1s+dnjfhK5wUlJgrMLEb++rvOpxmTnYE
	 cGRsIlaoBFeJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDA9F83C69;
	Wed,  4 Feb 2026 11:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D851517A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78E7405E0
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He5f5wB0ITKE for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD65F40109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD65F40109
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE267868CB; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 12:03:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c5214f6d424c46e6e25d24cbc0c86034cfcdbed
X-Git-Newrev: 10b2c1bceb8c22022057212dc71c42ccc7c88b77
X-Patchwork-Hint: ignore
Message-Id: <20260204110718.BE267868CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: Bump U-Boot
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10b2c1bceb8c22022057212dc71c42ccc7c88b77
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump U-Boot to latest release tag linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a U-Boot version
update from v2023.07 to v2025.07.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/microchip/mpfs_icicle/patches/uboot/uboot.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
index 0adbe15710..a40f963a2e 100644
--- a/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
+++ b/board/microchip/mpfs_icicle/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8dab9abc2861d95e609cd62a44b4687d03dc13eae6487fd1ae1ded6398ddb0cd  uboot-linux4microchip+fpga-2025.07.tar.gz
+sha256  591c80f7e16d6f43192deb7ab7587ae81b31ba7c7de1a668c14b9997b6c976c8  uboot-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 52b865ef77..b5a7562b7e 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.07)/uboot-linux4microchip+fpga-2025.07.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.10)/uboot-linux4microchip+fpga-2025.10.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="microchip_mpfs_icicle"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/uboot-fragment-rootfs.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
