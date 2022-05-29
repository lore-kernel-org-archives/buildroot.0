Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C309C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4AF41A0D;
	Sun, 29 May 2022 20:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y5n9Y-nXU3ZD; Sun, 29 May 2022 20:28:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06163415B6;
	Sun, 29 May 2022 20:28:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB79C1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E78CF40B08
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIcwtKoUAQzS for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:28:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 298C440128
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:28:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8B023866D5; Sun, 29 May 2022 20:17:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c5c3fbb2295f3f2b0bb27ac235d5f59afcfd55e
X-Git-Newrev: fba63210876e33f81a2854558511edb03619b8fb
X-Patchwork-Hint: ignore
Message-Id: <20220529201715.8B023866D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/squashfs: fix
 BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
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

commit: https://git.buildroot.net/buildroot/commit/?id=fba63210876e33f81a2854558511edb03619b8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
-> BR2_TARGET_ROOTFS_SQUASHFS_BS_8K added by commit
555f8dfd6ef893463ce19d5ee242afd6b83cb450 and raising the following build
failure:

/nvmedata/autobuild/instance-0/output-1/host/bin/mksquashfs: -b invalid block size

Fixes:
 - http://autobuild.buildroot.org/results/927f070dfc1a800e57ca6619f062940641837db9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 fs/squashfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
index 0e8de2fd3a..21322a2246 100644
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -46,7 +46,7 @@ endchoice
 config BR2_TARGET_ROOTFS_SQUASHFS_BS
 	string
 	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
-	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
+	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
 	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
 	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
 	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
