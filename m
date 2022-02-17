Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ECAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 20:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C55983F0C;
	Thu, 17 Feb 2022 20:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQa-DmVNvkIo; Thu, 17 Feb 2022 20:10:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90A2F83F08;
	Thu, 17 Feb 2022 20:10:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3411BF3B5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8306540227
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 20:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iI99fK0r4vwC for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 20:10:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3027400D8
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 20:10:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Kn6In74eJNVvLKn6InZrdr; Thu, 17 Feb 2022 21:10:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645128602; bh=P+Sj9Yioy2bo1GKURcMX3PM/EJ+7IBAUu7H7w7/al2c=;
 h=From:To:Subject:Date:MIME-Version;
 b=K9Z+AxGMsAL+9U/UbKGsKe/zblRszlUhPzXxlhmmcK7ZQHLhNDAi7kY9bnvLTPsWg
 c/LeMVo5D2oiThBo5aCAqWd3fSx7pgu0Z9560zRKClNoRjGUaA2/fNwiZ/RQXy9vwI
 ce3RnRAfwLZK2m5u3ddqoUR5jZRW3vFPIwRFPksLiYgdGVw+cal9vrNOr5CNKPUsVR
 fFVoxA344AXoFdVtr6uRcTgyzgou67cGcs+VtdVJxCHldX9GOwixOZvS8V7bmsAgIa
 rd0EKrboi9ui8t0nBOcRAguk8fSbdyoLvO3AuOzoZ1vwQTUerXLnrthgmxyLjd0j4S
 ag7WP+SETi4vQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 21:10:01 +0100
Message-Id: <20220217201001.1859113-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfO6+I8cNEHjnztiPNSsJ001VzVSYpaOhc6W05ARCBg5aUUIp4neWFMp3vti1lQ8pwGy0p/7K8tXC+Wr5snJMZ46AuR4cZMTcqxGkCfnn4TsqSTjeayp3
 vAS9sjKgZ9RFHFh4D3UuHXyX50Fv7cICqS7i9mnkFLjojauD/ewIHZ6mf1MEoj8COO7qwLu3gYC92ZujY4dojogak1FfYOo3a7fUDDMo9yfeFZUUqNq/MCKY
 48O/2ob2oPNXjRcJnc2tThLvflSXmC1LI1dxyYeBdWRpZPy9EJTVi2EIVi9npT4a
Subject: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: U-Boot
 requires OpenSSL
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784267

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/kontron_bl_imx8mm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index 57e7e9683d..2b7e121e25 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -45,6 +45,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
