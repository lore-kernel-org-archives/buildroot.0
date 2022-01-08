Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A810C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 14:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45B564019C;
	Sat,  8 Jan 2022 14:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iBVBt8REOnhr; Sat,  8 Jan 2022 14:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7708240106;
	Sat,  8 Jan 2022 14:10:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02C231BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E237F400D3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 14:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frLfspyxxKX0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 14:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B3D400CF
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 14:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7346E82D32; Sat,  8 Jan 2022 14:03:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 15:09:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8eec48376095310119e54a1516e8f8c2cfc0afb0
X-Git-Newrev: ddc3f428afa51b935a6a48fba8533913543d77ad
X-Patchwork-Hint: ignore
Message-Id: <20220108140349.7346E82D32@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/olimex_a20_olinuxino_lime2_defconfig: use
 linux-disable-lima.fragment
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

commit: https://git.buildroot.net/buildroot/commit/?id=ddc3f428afa51b935a6a48fba8533913543d77ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This defconfig enables sunxi-mali-mainline-driver so we need to disable
Lima in Linux to prevent Mali to not load.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 64a66de5c8..b46cf37433 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -26,6 +26,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-olinuxino-lime2"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
