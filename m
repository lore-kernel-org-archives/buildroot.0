Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F8EC48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9D58518B;
	Sun,  4 Feb 2024 10:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9D58518B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2E9HSplsACRU; Sun,  4 Feb 2024 10:07:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4B3485186;
	Sun,  4 Feb 2024 10:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4B3485186
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E76DD1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE9F60F64
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFE9F60F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3eO6f1x4pMsa for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 395A460EE5
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 395A460EE5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2674C86891; Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:06:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05617160dd0bc4aef6cc91930d7985009e854142
X-Git-Newrev: 380d4a75f5e3c2ae52ebc1afd409713fdb6ced37
X-Patchwork-Hint: ignore
Message-Id: <20240204100707.2674C86891@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: drop
 LINUX_FIRMWARE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=380d4a75f5e3c2ae52ebc1afd409713fdb6ced37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:kernel:linux-firmware added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kernel:linux-firmware

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 58fbaab1d7..60e8861abe 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -9,8 +9,6 @@ LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
-LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
-
 # Intel SST DSP
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP),y)
 LINUX_FIRMWARE_FILES += intel/fw_sst_0f28.bin-48kHz_i2s_master
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
