Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A31BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D22FC60C21;
	Sun,  6 Feb 2022 10:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aIw3YHTPoQza; Sun,  6 Feb 2022 10:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1596360BE4;
	Sun,  6 Feb 2022 10:51:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6962B1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 659124032E
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOW7wRiOBV2P for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:51:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB1D24032B
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:51:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8A4D282BBB; Sun,  6 Feb 2022 10:44:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 490438f437b2a603204aa6ae9cbf3875c262f976
X-Git-Newrev: a8c0a1c6a0a771eab65f27fc4ed3f76c43334ef8
X-Patchwork-Hint: ignore
Message-Id: <20220206104417.8A4D282BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglev: linux needs host openssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8c0a1c6a0a771eab65f27fc4ed3f76c43334ef8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035820979

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 70459bf3e8..79af8c2ece 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="starlight"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7100-beaglev-starlight"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
