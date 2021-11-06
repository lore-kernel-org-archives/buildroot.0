Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E898C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:11:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9139A611C0
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9139A611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grinn-global.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8EB405F8;
	Sat,  6 Nov 2021 10:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3cm9MuWM6WK; Sat,  6 Nov 2021 10:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0E9405F2;
	Sat,  6 Nov 2021 10:11:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 380D91BF2AE
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E30960731
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OWycGhV-ekKZ for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:11:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 883236071C
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (12)
Received: from bartekk-pc.lan (host-81-161-202-9.oxylion.net.pl [81.161.202.9])
 by server220076.nazwa.pl (Postfix) with ESMTP id 32E2D1C50DB;
 Sat,  6 Nov 2021 11:11:51 +0100 (CET)
From: Bartosz Bilas <b.bilas@grinn-global.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 11:11:48 +0100
Message-Id: <20211106101148.295572-1-b.bilas@grinn-global.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/stm32mp157c_odyssey: specify uboot
 custom version
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to buildroot requirements set custom uboot
version instead of relying on the newest one.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 configs/stm32mp157c_odyssey_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/stm32mp157c_odyssey_defconfig b/configs/stm32mp157c_odyssey_defconfig
index 8639c6ee6c..22a8ff0a1f 100644
--- a/configs/stm32mp157c_odyssey_defconfig
+++ b/configs/stm32mp157c_odyssey_defconfig
@@ -22,6 +22,9 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="*.stm32"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
