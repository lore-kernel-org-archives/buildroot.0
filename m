Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DD0EE49A5
	for <buildroot@archiver.kernel.org>; Wed, 23 Aug 2023 03:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D6B4031B;
	Wed, 23 Aug 2023 03:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94D6B4031B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ogwjPx1rQY1; Wed, 23 Aug 2023 03:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A2F240321;
	Wed, 23 Aug 2023 03:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2F240321
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161391BF2C2
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 03:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5C4760DFC
 for <buildroot@lists.busybox.net>; Wed, 23 Aug 2023 03:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C4760DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRNHLUS4pVDt for <buildroot@lists.busybox.net>;
 Wed, 23 Aug 2023 03:08:16 +0000 (UTC)
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F46960A70
 for <buildroot@buildroot.org>; Wed, 23 Aug 2023 03:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F46960A70
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 37N382JW087412;
 Wed, 23 Aug 2023 11:08:02 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.158) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 23 Aug 2023 11:08:01 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <buildroot@buildroot.org>
Date: Wed, 23 Aug 2023 11:07:45 +0800
Message-ID: <20230823030745.22850-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.38.0.68.ge85701b4af.dirty
MIME-Version: 1.0
X-Originating-IP: [10.0.15.158]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 37N382JW087412
Subject: [Buildroot] [PATCH] configs: andes_ae350_45: Update generic
 extensions
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
Cc: Yu Chien Peter Lin <peterlin@andestech.com>, ycliang@andestech.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of upstream commit cbd91e89e43d600172c62fd1cbd33aa74d0a851a
we can use the defualt BR2_riscv_g to select IMAFD extensions.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
https://patchwork.ozlabs.org/project/buildroot/patch/20230815054327.1436-1-peterlin@andestech.com/#3169699
---
 configs/andes_ae350_45_defconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/configs/andes_ae350_45_defconfig b/configs/andes_ae350_45_defconfig
index a60c4b25a0..fd8b7db0e7 100644
--- a/configs/andes_ae350_45_defconfig
+++ b/configs/andes_ae350_45_defconfig
@@ -1,9 +1,4 @@
 BR2_riscv=y
-BR2_riscv_custom=y
-BR2_RISCV_ISA_RVM=y
-BR2_RISCV_ISA_RVA=y
-BR2_RISCV_ISA_RVF=y
-BR2_RISCV_ISA_RVD=y
 BR2_RISCV_ISA_RVC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=y
 BR2_GLOBAL_PATCH_DIR="board/andes/ae350/patches"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
