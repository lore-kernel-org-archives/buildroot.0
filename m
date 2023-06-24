Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF38EB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 19:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87874161B;
	Sat, 24 Jun 2023 19:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87874161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wt3cgmJHxb3u; Sat, 24 Jun 2023 19:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C22EA41610;
	Sat, 24 Jun 2023 19:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C22EA41610
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADC661BF3D9
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 19:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9316A41610
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 19:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9316A41610
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkrEFSjROv8v for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 19:27:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8234F41608
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 19:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8234F41608
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CE0984574; Sat, 24 Jun 2023 19:27:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 21:27:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42356e1d0908eec82254d64145226bfae78eb6b3
X-Git-Newrev: 044c38b71d8cda99e893f0bdcfb18992a229d017
X-Patchwork-Hint: ignore
Message-Id: <20230624192718.6CE0984574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/mx53loco: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=044c38b71d8cda99e893f0bdcfb18992a229d017
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select  BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build error:

include/image.h:1383:12: fatal error: openssl/evp.h: No such file or directory

Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 212a032d84..d03c7d0916 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -24,6 +24,7 @@ BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
