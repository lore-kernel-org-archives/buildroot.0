Return-Path: <SRS0=xEd5=PS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4774C433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:05:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BB260ED5
	for <buildroot@archiver.kernel.org>; Sat, 30 Oct 2021 23:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99BB260ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 677F8401EE;
	Sat, 30 Oct 2021 23:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxUEXe4TS-OX; Sat, 30 Oct 2021 23:05:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA7B3401E8;
	Sat, 30 Oct 2021 23:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 656C21BF336
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5463880D31
 for <buildroot@lists.busybox.net>; Sat, 30 Oct 2021 23:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqIeG5aqmybQ for <buildroot@lists.busybox.net>;
 Sat, 30 Oct 2021 23:05:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 592B580D28
 for <buildroot@buildroot.org>; Sat, 30 Oct 2021 23:05:41 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gxPvmoViVrIRlgxPvm6swe; Sun, 31 Oct 2021 01:05:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635635139; bh=I+8r02O2IcBcbdy9XSGaAcJ+BP6f3/GMKmHoZ7/fFjA=;
 h=From:To:Subject:Date:MIME-Version;
 b=ic3/KjuxHz93XuuKhpTWawZKomJ+Lgh7TLL+8tZSdSdMkS85HLvttKjd6Xn3Fm1bE
 sLtGtqHFUzjTd5kVBZtqE/zKJdoO3tJ/MHSG+6GCc1EcGhi8TWduVK/ai6L+6R3aYO
 lINgjmG5drvVsggu0Vbx1crii/1whUP/SC6xD/jmUIc7Yh3igx7DSXLsryID9Xr+oP
 cEZUkitMdA/PhJ8bbR1jOgCdRf7yPltkvVVQaQ/7bSgEntBRpRFt1KiGblNT6yEVvP
 RMdf4WwBtgQ256ZYfly+Ggy3W8kndBp7NQWDQisKq7N7BkDUWg71k2JNg874oWMmn0
 zS9Sn5jQ0M9zg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 01:05:37 +0200
Message-Id: <20211030230538.3494204-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
References: <20211030192416.4012437-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfE2UjxXQ7YY/b6wucZ68Mq6he/P4W/X4Taok7rHzBBVnX4U3J/ke1qcFtoJ+fHuzisPTo+bb4Dz+uTLQB5Ph8yBG03tWWjSQwD5jfiMNLGdZBDSdn51R
 ek7xMpsjLwjR/vzZCEw9Ak2xKdIXbSZlX4R/AuZuInNdsm39ObsPxz11E9lRkjIm3H5iz7V0jJv1dBkeiwArNRtnRKHFAOt5LJYW9Amu5z2cpdOBHQdxeRw5
 WYnTaUi1CLgT9yu2U83EXJnvSL6c72uoPsavVDed7323odi+XnCqZbFUXY2q9Al0FDF+r70Kff6h3fiA5PwPYg==
Subject: [Buildroot] [PATCH v2 1/2] configs/amarula_vyasa_rk3288: u-boot
 2021.10 needs python3
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Uboot 2021.10 needs python3 so enable it.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1723729667

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* reword commit log adding Fixes: tag
---
 configs/amarula_vyasa_rk3288_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/amarula_vyasa_rk3288_defconfig b/configs/amarula_vyasa_rk3288_defconfig
index 916a639387..ff96019e1e 100644
--- a/configs/amarula_vyasa_rk3288_defconfig
+++ b/configs/amarula_vyasa_rk3288_defconfig
@@ -13,6 +13,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="vyasa-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
