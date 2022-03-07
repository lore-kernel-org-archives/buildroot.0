Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA70C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91AC44173B;
	Mon,  7 Mar 2022 21:47:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8t-jR4bfXFR; Mon,  7 Mar 2022 21:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20D4416C6;
	Mon,  7 Mar 2022 21:47:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8332E1BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73711416C6
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHKoRB8FqIAF for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAD02415D2
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EBC8382DD8; Mon,  7 Mar 2022 21:38:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:40:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37cc5aecf57493e037769f444fdc4f7d8ac8782f
X-Git-Newrev: 59e62a8e0d556567fa97ea400a7c351f4fa22998
X-Patchwork-Hint: ignore
Message-Id: <20220307213817.EBC8382DD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: add quotes around string
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

commit: https://git.buildroot.net/buildroot/commit/?id=59e62a8e0d556567fa97ea400a7c351f4fa22998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 616ba9c90b014637dc9925fa442a0af4a11f04b8 extended rootfs size, but
forgot to add quotes around it. Thus, kconfig removed the option
entirely.

While we're at it, move the option to a more appropriate place together
with the rest of the ext2 options.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784289

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/microchip_sam9x60ek_mmc_dev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 00ccd784b5..06e03967c4 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -7,7 +7,6 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
-BR2_TARGET_ROOTFS_EXT2_SIZE=120M
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
@@ -67,6 +66,7 @@ BR2_PACKAGE_HTOP=y
 BR2_PACKAGE_VIM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
