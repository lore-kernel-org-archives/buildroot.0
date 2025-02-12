Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42FEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F4C4FA2A;
	Fri, 28 Feb 2025 17:17:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWxF9Bf8DZ3b; Fri, 28 Feb 2025 17:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F59850004
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F59850004;
	Fri, 28 Feb 2025 17:17:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 139161DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CD7C4254E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrjoQnmHTeA8 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9973142D44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9973142D44
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8AB62826DB; Fri, 28 Feb 2025 16:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Feb 2025 23:24:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7a18c2ef8d654a34d31eb5cc146acdcc4b2029f
X-Git-Newrev: 452cb98323f4aadf8ada8c9bacf1238f7b3b3e89
X-Patchwork-Hint: ignore
Message-Id: <20250228163039.8AB62826DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/beaglev_fire: add
 support for overlays and update script
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

commit: https://git.buildroot.net/buildroot/commit/?id=452cb98323f4aadf8ada8c9bacf1238f7b3b3e89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When applying overlays at boot time all dtbs need to be compiled with
the `-@` flag. Set the appropriate config to do this.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/beaglev_fire_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_fire_defconfig b/configs/beaglev_fire_defconfig
index 1d26a78f07..bfaa8208e9 100644
--- a/configs/beaglev_fire_defconfig
+++ b/configs/beaglev_fire_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-beaglev-fire"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_PACKAGE_MTD=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
