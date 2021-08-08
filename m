Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4756C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC7460EB9
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 19:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CC7460EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E38827FD;
	Sun,  8 Aug 2021 19:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64_Y-LR929kz; Sun,  8 Aug 2021 19:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F71B827FB;
	Sun,  8 Aug 2021 19:35:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0371BF97F
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD9C401E1
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1ZZVmU35pyb for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87EDC401E2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3E0F28D253; Sun,  8 Aug 2021 19:33:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 21:23:23 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 57c1cd136d8976e1a916a433772d9e957e03ac8a
X-Git-Newrev: a243b96d07765076ed20f112611ab1964cfcd7ed
X-Patchwork-Hint: ignore
Message-Id: <20210808193333.3E0F28D253@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: add missing options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a243b96d07765076ed20f112611ab1964cfcd7ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

This defconfig needs wchar, thread debugging, and udev support to be
able to use all the packages it enables.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/1478738516

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 28803d38e571250d599b1c59054f09cfef6a7a04)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/microchip_sam9x60ek_mmc_dev_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 6c3fcc6b3f..8b6ecfb7e8 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -1,6 +1,10 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
