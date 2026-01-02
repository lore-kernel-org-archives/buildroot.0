Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280D5FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEDD140227;
	Fri,  2 Jan 2026 17:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vRaIVqtrYC6p; Fri,  2 Jan 2026 17:06:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DDC5403F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767373593;
	bh=Kx51aByBdpyrA+whyLFlQPmMdRoPmyrn99Q9Xouj778=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K/HV43ybtMaFsyPKBmewlGi97bDp1Cvd0mobvcVkxKFt8qNa9WU9bLpZzSvLpqx7/
	 AwbFn2C/I94qqx7zWCWkzqqBN48x3evpVi1YvQFXA4WRq3Vif9Fsq0bV+afGRa1Ou2
	 a3LBK/ntog0S9Qm9iyswZPf6Dw2Cgd8vEumFBy59AyYgKdwOUPZA+7aX1jfd3gJEFY
	 aoC6WktN7wveNZXLnXnQLoiN8cGp6TqHQiP5z1F4r/YAKWtGHQAv6IaW8jeDoc7LOq
	 SworS5VneZXVinn83jNMIA9hygMqaUQm1M5bxvZHX707JLU2fI093PNzF0AeBBJ1kp
	 QuCsdSS9QMjCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DDC5403F3;
	Fri,  2 Jan 2026 17:06:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAF6719D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CD04404B0
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgHfXZe3AUcR for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E4FF403F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E4FF403F3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05A57848D1; Fri,  2 Jan 2026 17:06:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:06:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a4635d87efaf054cbd10cabcdbdee4153a5b4f
X-Git-Newrev: ad5b251fca5e5615f7d881f6e5342490d54db1ad
X-Patchwork-Hint: ignore
Message-Id: <20260102170631.05A57848D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_mpfs_icicle: add support
 for production silicon Icicle kit
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ad5b251fca5e5615f7d881f6e5342490d54db1ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Include the compilation of the production silicon Icicle kit device
tree to support this device.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/microchip_mpfs_icicle_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_mpfs_icicle_defconfig b/configs/microchip_mpfs_icicle_defconfig
index 4d465016c7..52b865ef77 100644
--- a/configs/microchip_mpfs_icicle_defconfig
+++ b/configs/microchip_mpfs_icicle_defconfig
@@ -11,7 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,li
 BR2_LINUX_KERNEL_DEFCONFIG="mpfs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/microchip/mpfs_icicle/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="microchip/mpfs-icicle-kit microchip/mpfs-icicle-kit-prod"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
