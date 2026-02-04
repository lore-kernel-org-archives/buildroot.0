Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339DCE95380
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F131940CAA;
	Wed,  4 Feb 2026 11:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOdEB4w0jGYn; Wed,  4 Feb 2026 11:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733CD40BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203245;
	bh=V+38wzdyo1HxGhjbdzS+bNxOjdanKZ7GMHLODCIxqak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PWotOD/dh3oCddsfCBFEvDT3RYyvp1X2afbYDrL8Phm9RsM/OyZSM8Do5ZZsI+nln
	 mp9JAJjsZoOTkNDseEL2HUKeHZAchhcCQyPQTC1kL7q4TvO8RPtvt522ZeQNYSeaNo
	 yPeU5+Djhzzw9nVjPmiCtagGQEa3t9SvKWW8KUHUoMwN4LTMMr/FPfdrwwHftitPHJ
	 2g/WPxV2KQ3Yvmn1kPUEr9K/TkgKCBlDeLg0AM864PQgV5RjzydBclXG+jsVs7oItH
	 Je7WW1Fj/exrujnf3Waaxshe6sXcIOBlosGrLYyAUfgnsR9f/+OUb7Xp9jQ5bDVM3U
	 re55rKl/VCLgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733CD40BD5;
	Wed,  4 Feb 2026 11:07:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20ECAF5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB19140B4D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgqMZtpIlUH6 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A0940B57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04A0940B57
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DECE5868D0; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 12:03:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 758188b76a6a5bfcde0797c00643f717324e8009
X-Git-Newrev: e9e55131778c46abceebadfbf1a3f57b7f61b7d3
X-Patchwork-Hint: ignore
Message-Id: <20260204110718.DECE5868D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev_fire: Bump Linux
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9e55131778c46abceebadfbf1a3f57b7f61b7d3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump Linux to latest release tag: linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a kernel bump to
v6.12.48.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/beagleboard/beaglev_fire/patches/linux/linux.hash | 2 +-
 configs/beaglev_fire_defconfig                          | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/beagleboard/beaglev_fire/patches/linux/linux.hash b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
index 9ee63df23d..2902da56b6 100644
--- a/board/beagleboard/beaglev_fire/patches/linux/linux.hash
+++ b/board/beagleboard/beaglev_fire/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7bd234a93bc6351d6a830f9ef18e9e780d70c478d280a6513a30bc2f945fb050  linux-linux4microchip+fpga-2024.09.1.tar.gz
+sha256  37191994758d521dc7223cb5010a67ef83bd061bf70194ea522abc9ef2b17391  linux-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 4fc33969d0..a5cda23242 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -1,6 +1,6 @@
 BR2_riscv=y
 BR2_RISCV_ISA_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglev_fire/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -8,7 +8,7 @@ BR2_ROOTFS_OVERLAY="board/beagleboard/beaglev_fire/rootfs-overlay/"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboard/beaglev_fire/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2024.09.1)/linux-linux4microchip+fpga-2024.09.1.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.10)/linux-linux4microchip+fpga-2025.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
