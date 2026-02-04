Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C1AE9537E
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA7B83C6A;
	Wed,  4 Feb 2026 11:07:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEYiU6wgY3yJ; Wed,  4 Feb 2026 11:07:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23B083C6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203246;
	bh=o1ZAQY1Yh/pPxh3ApoCTM++Nsi1dGiBELlyC/Qy1jcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U4NcPXFaijR6WGbxFOjROZWlC5ktk2gIhkt9L9inShkxqL/Psq6+cos7GiHcnQEqn
	 +071QzdF5ZkcSViQFclZTsIEjOQl36ud9IEsSUKIXQCKN1Ie51CrAP+HGscbeSluZf
	 5SRcGquDsLaF3+4K5UmtNyUyD8dyJjjibq0h1kRmkJwhk8TzM+/ZCvmvTmfX5gd+G9
	 Kfjf7qmWLCf9wQYKoN/1+EMYGpkKc58hFBWec/RdbYIlZM7G7USw/XFlMtXYqXSAsT
	 EMZHapppMjbpiW95nssBufrSVFQ5/3FdbSRO56WlQWPV1rjtB9YrvR138mA2IzY9uC
	 yzZKSTGa6qQJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23B083C6B;
	Wed,  4 Feb 2026 11:07:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6EBF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F9040109
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21y_gXrA2ZNR for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3494054B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3494054B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3676868CD; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 12:03:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1c8ab14a7e8e5faccf5a2b1b4989deedf34fded
X-Git-Newrev: 758188b76a6a5bfcde0797c00643f717324e8009
X-Patchwork-Hint: ignore
Message-Id: <20260204110718.D3676868CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev_fire: Bump U-Boot
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/758188b76a6a5bfcde0797c00643f717324e8009
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump U-Boot to latest release tag: linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a U-Boot version
bump to v2025.07.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/beagleboard/beaglev_fire/patches/uboot/uboot.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
index cb0ec5ec52..a40f963a2e 100644
--- a/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglev_fire/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a2fad7fe7f933fa4679b070e952e1e7a21dbd8b586d7a9a11bfcb99e75ae7ad6  uboot-linux4microchip+fpga-2024.09.tar.gz
+sha256  591c80f7e16d6f43192deb7ab7587ae81b31ba7c7de1a668c14b9997b6c976c8  uboot-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index bfaa8208e9..4fc33969d0 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2024.09)/uboot-linux4microchip+fpga-2024.09.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,u-boot-mchp,linux4microchip+fpga-2025.10)/uboot-linux4microchip+fpga-2025.10.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="beaglev_fire"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglev_fire/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
