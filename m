Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB70EC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 557D460F01;
	Sun, 17 Jul 2022 07:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 557D460F01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuhBgYt37aSV; Sun, 17 Jul 2022 07:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FC3560A7E;
	Sun, 17 Jul 2022 07:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FC3560A7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69DBA1BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 441D560A7E
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 441D560A7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfcDgbhnajp4 for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:23:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85C0B60A75
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C0B60A75
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D830681DDF; Sun, 17 Jul 2022 07:10:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:23:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1af0f9d255b78a45d6a68b1db0dcfef589988389
X-Git-Newrev: aac5e85726395f72e47eba0a22206552ea9c47aa
X-Patchwork-Hint: ignore
Message-Id: <20220717071011.D830681DDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ts7680: bump Linux version to
 4.9.311
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

commit: https://git.buildroot.net/buildroot/commit/?id=aac5e85726395f72e47eba0a22206552ea9c47aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/ts7680_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ts7680_defconfig b/configs/ts7680_defconfig
index e4f5c1aabd..9e058b1d78 100644
--- a/configs/ts7680_defconfig
+++ b/configs/ts7680_defconfig
@@ -4,7 +4,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/technologic/ts7680/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,d03d426e6abd95a973bc669315206295713c17e8)/linux-d03d426e6abd95a973bc669315206295713c17e8.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,embeddedTS,linux-4.9.y,v4.9.311-ts)/linux-v4.9.311-ts.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="ts_imx28"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
