Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739D3C433FE
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 19:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA0140939;
	Tue,  4 Oct 2022 19:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA0140939
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuRNlqW_-CDx; Tue,  4 Oct 2022 19:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E99408CF;
	Tue,  4 Oct 2022 19:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4E99408CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 119101BF405
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEC99400BF
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 19:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEC99400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7RCH88BxrLY for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 19:54:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D6D4019B
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18D6D4019B
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:54:50 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id ACF0ED2BB1
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 19:51:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3DD7EFF804;
 Tue,  4 Oct 2022 19:50:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1ofnwP-003uT9-Si; Tue, 04 Oct 2022 21:50:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 21:50:38 +0200
Message-Id: <20221004195039.931947-10-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221004195039.931947-1-peter@korsgaard.com>
References: <20221004195039.931947-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/11] qemu_riscv64_nommu_virt_defconfig:
 specify kernel headers version
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The defconfigs uses a 5.19 kernel, so specify 5.19 kernel headers now that
is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_riscv64_nommu_virt_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_riscv64_nommu_virt_defconfig
index 5fab255d88..ee70beb208 100644
--- a/configs/qemu_riscv64_nommu_virt_defconfig
+++ b/configs/qemu_riscv64_nommu_virt_defconfig
@@ -3,6 +3,9 @@ BR2_riscv=y
 BR2_RISCV_64=y
 # BR2_RISCV_USE_MMU is not set
 
+# Linux headers same as kernel, a 5.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=y
+
 # Busybox with hush
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
