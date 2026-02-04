Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F6E95380
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5B140B1F;
	Wed,  4 Feb 2026 11:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHGYzj1i3kOK; Wed,  4 Feb 2026 11:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D62AE40B4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770203240;
	bh=RmLRVoIMtu8iXGGF3tpMSVNb4QGbunqy3l/YF9y0q8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g5w9OmRZjA3R7FxO9y5TRaqMemEE3jvgpSkdU/7Zr5i+GTEjSutQq9cDdFNUV6s6a
	 WHPfpxKeQW3ZMZEDa96xBiWULqdbk+Eip3U01RHNSg79kXVw4YW3UNf4S/JT0Sx53N
	 cfU4yMS8g97j8GiSvi5NrPsqaUhsZJGYsf2bA/Qs6yhdIpkVcPdAmJ0G7mh/y+K+pa
	 aakSWeBZA2apEmlEuia91FdMxV904BNypcMwIy4QOSGvHtkpSX0NjNwzNOlsPaaLWb
	 r4Xw+C45S9T13kFTPM+B26XVChVd7K8rq713W7x4Hojtr8KsNeMZLTlZdqtbzs+G98
	 8iGOcu746D0jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62AE40B4D;
	Wed,  4 Feb 2026 11:07:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C68F9F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3F1640BD5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25q6MT0_GNbx for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 11:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42C840B4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E42C840B4D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C84E4868CC; Wed,  4 Feb 2026 11:07:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 12:03:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10b2c1bceb8c22022057212dc71c42ccc7c88b77
X-Git-Newrev: e1c8ab14a7e8e5faccf5a2b1b4989deedf34fded
X-Patchwork-Hint: ignore
Message-Id: <20260204110718.C84E4868CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: Bump Linux
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1c8ab14a7e8e5faccf5a2b1b4989deedf34fded
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bump Linux to latest release tag linux4microchip+fpga-2025.10. This
includes the latest features and bug fixes. Included is a kernel version
buump to v6.12.48 and a GPIO driver fix.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/microchip/mpfs_icicle/patches/linux/linux.hash | 2 +-
 configs/microchip_mpfs_icicle_defconfig              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/microchip/mpfs_icicle/patches/linux/linux.hash b/board/microchip/mpfs_icicle/patches/linux/linux.hash
index d0e2d5693c..2902da56b6 100644
--- a/board/microchip/mpfs_icicle/patches/linux/linux.hash
+++ b/board/microchip/mpfs_icicle/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7789cc2844cb9633aa8c146e194c9ad3482bf06ace707d66d0ca6039ed16833d  linux-linux4microchip+fpga-2025.07.tar.gz
+sha256  37191994758d521dc7223cb5010a67ef83bd061bf70194ea522abc9ef2b17391  linux-linux4microchip+fpga-2025.10.tar.gz
diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index b5a7562b7e..1d8937c3d1 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_HOSTNAME="mpfs_icicle"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/microchip/mpfs_icicle/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.07)/linux-linux4microchip+fpga-2025.07.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip+fpga-2025.10)/linux-linux4microchip+fpga-2025.10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
