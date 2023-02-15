Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D992C636CC
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 20:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 013E881455;
	Wed, 15 Feb 2023 20:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 013E881455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YZ3sKZZ3Itn; Wed, 15 Feb 2023 20:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0B2A81839;
	Wed, 15 Feb 2023 20:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0B2A81839
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 912901BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6ACC960ABE
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 20:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACC960ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rl3gmHWOSz-8 for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:09:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D1360AC4
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74D1360AC4
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:09:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SO5Pp9PjF3NxdSO5PpSkMk; Wed, 15 Feb 2023 21:09:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 21:09:01 +0100
Message-Id: <20230215200902.538238-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFo7iVcTOJG+nxCLhZ4ygy/UIZBW/0dYbg7L3evUIjx8v+GhkyNuQx9V28SfZvd/pJOEhzUSICUbF7A11FID55b+B1ZO8sYMBV6bC4rauX0fyeB/glPO
 WoPrzFmWVqTY5kRvlgyDPNAcSGNK6n8YA1w62NwT4KmhekxX7O5QInspNmO54CIG0lNM8KLQdqZYxjFeC0W/Csa5oAncmFdRHR81U2w7pJKokEUID9E8h5oY
 90M1haVhfPQuCvDdhJZL7EbPbbyJYrOtkgHyBQ+gjEzrfe+9ykfL3tP9lKkIZgnqIfv5y/jCksGDvA47BjZ7Iw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676491744; bh=/om10fN5kv/MCEidskti92jwvXFPZd/w6WhQfn9V4rU=;
 h=From:To:Subject:Date:MIME-Version;
 b=XQ+cjmhEPAn06yoC2rs2wa/phY6LiNpyNFX5WldAihhcxQVpCAgWXwZPkCo6otEkr
 obcy9dRyBLZMQnO63hPN6KlF5j33g3tytv/NKkpVzRCcWg9jYrxl2ld6HJzDHZW1ZI
 MC7epgF0Q+lqrMvu4bdUf4HUSV5bG6bBZEDcLm+yd7zwSLanOEY+LvDxML7CP6LfS1
 1L4lG9tzSi9cFbJ+pbaUidh/qe2/uMY6OM+nHoJp+ZrXieNLHGNYVCLu+FyEHOUCDq
 RsR5MEU7ZvkeMQ5cQx+nj8qCTa54PSJf7dpobOSBw3z5ELm1PgN1SMStayWLjlRGAW
 c5dQ9Nj7dvw9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=XQ+cjmhE
Subject: [Buildroot] [PATCH 1/2] configs/bananapi_m2_ultra_defconfig: bump
 Linux to 6.1 and U-Boot to 2023.01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/bananapi_m2_ultra_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/bananapi_m2_ultra_defconfig b/configs/bananapi_m2_ultra_defconfig
index 2ec0e60e8d..0f267021f8 100644
--- a/configs/bananapi_m2_ultra_defconfig
+++ b/configs/bananapi_m2_ultra_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Bananapi M2 Ultra"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/bananapi/bananapi-m2-ultra/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.12"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-r40-bananapi-m2-ultra"
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m2_berry"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
