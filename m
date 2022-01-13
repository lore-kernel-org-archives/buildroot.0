Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5862C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D3C340127;
	Thu, 13 Jan 2022 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XA-GYkXwHYUI; Thu, 13 Jan 2022 19:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 853D8400E4;
	Thu, 13 Jan 2022 19:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 522A31C1135
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EF0484CBC
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qmxu7x_yymIw for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41FAC84C44
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0BA18821EF; Thu, 13 Jan 2022 19:32:29 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 20:38:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 495440cf267962501753c19dab8da0714079261f
X-Git-Newrev: 4e2a38d38d30c9caab7da55a24f0ffacf7a19e50
X-Patchwork-Hint: ignore
Message-Id: <20220113193229.0BA18821EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/roseapplypi_defconfig: really
 change to ext4 rootfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e2a38d38d30c9caab7da55a24f0ffacf7a19e50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b8aebcfd823f83c16 (configs/roseapplypi_defconfig: bump kernel to
5.15.10) adjusted the board to use an ext4 rootfs, but forgot to update the
defconfig to enable ext4 rootfs, breaking the build. Correct that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/roseapplepi_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/roseapplepi_defconfig b/configs/roseapplepi_defconfig
index f4efacf80d..00bdf69d8a 100644
--- a/configs/roseapplepi_defconfig
+++ b/configs/roseapplepi_defconfig
@@ -21,7 +21,8 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="owl-s500-roseapplepi"
 
 # Filesystem / image
-BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Bootloaders
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
