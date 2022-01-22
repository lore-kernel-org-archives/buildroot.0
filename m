Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A18C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 21:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAB2A40104;
	Sat, 22 Jan 2022 21:45:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t8ndvcV55Rqb; Sat, 22 Jan 2022 21:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FD7F403C8;
	Sat, 22 Jan 2022 21:45:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DAC11BF281
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 21:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C18081774
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 21:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTe-EX1WZkKh for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 21:45:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D198B81770
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 21:45:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a13so6457901wrh.9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbhLYtS33BCCY1cWvDg0vFxjznZzO7jSui/XCKA8B6Q=;
 b=mrIZYfwGhs2FTlrdduhnOqcJCBVUDav6Vcq3FcRMQmGOS/Mx8VV+/sSSCeAKbxzJPJ
 z6cC8qQew1vcIfsPCb4TxdUiTVajokXp6bFkXCfi3p7eD7F/MOPMCpqTJYT2gKDnIUzZ
 8LhrlL6Kd+jCZ6uQ8+QscqQLxndy8ER3yYbTTQATmGltdZsvPR19KsDC4htM9MA0ZqWX
 ks1WI9uGQ84k9f27Yb7GdVv9iSaE8Sb1owzdTqJ1Z3m4EANrbyDo/OhV1ASF+Vxcw3u4
 hGESqny/BsHGNu0qtS6JJ57DjAX181NadpKazRqta/P+K5elcJr+NQix031ysuJRvQCa
 l/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TbhLYtS33BCCY1cWvDg0vFxjznZzO7jSui/XCKA8B6Q=;
 b=uzVITthtn+yhUXhHtZAVqiAaXQwrLBLqpQKCMtSJRKzznLwbWaDKYAgyfi9xADW91w
 +XfGpxNpwfaKuGO7fAoTUJ3/SUYUqSCSOjTLSeL1Z+aCd75eIGYpgXjAHGWVkRTwiOMS
 xmCl4Gb+bnHOMXkTUtQ+CYCeScK0+ALbsJ2KUvCS6dcOUtJ6au2+IjPAYhEwPWlPXTop
 ued9mBio3N9AANo5x8Ehza65ztkIcLHmnFJm2SyoP2c3KuGp2zLuBV/el2sBByavNPem
 pc15B5M5NTIuVUPcmxGa1T6/Q4ojuVoPNdJUknohyO1GU6pc6Sg3pJW9Thymd9NW7OJ/
 1bVg==
X-Gm-Message-State: AOAM531CaSBDiGUJF3SKENorz5fXdLZUCi2PEY959uzEeeeni5j8keRc
 uPIZ1Bxcva/SKuHctwtebTX3sOHEGtw=
X-Google-Smtp-Source: ABdhPJyuHoPn8GZ2tNBriQghcjQSMzvAaVjX0CcrqwAO3NkZ9jEILdtbTm/JbxwMkzuDM+Kna78S1Q==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr8548848wrq.273.1642887903867; 
 Sat, 22 Jan 2022 13:45:03 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d2sm9569029wru.40.2022.01.22.13.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 13:45:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 22:43:18 +0100
Message-Id: <20220122214318.136871-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Config.in.legacy: fix typo
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo added by commit 7527324132878f98999539bdd97bd3518747f585:
brcmfmac-sdio-firmware-rpi by brcmfmac_sdio-firmware-rpi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 Config.in.legacy | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c11cb846fb..62717463df 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -154,7 +154,7 @@ config BR2_PACKAGE_RPI_BT_FIRMWARE
 	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT
 	help
 	  Package rpi-bt-firmware was moved as option to
-	  package brcmfmac-sdio-firmware-rpi.
+	  package brcmfmac_sdio-firmware-rpi.
 
 config BR2_PACKAGE_RPI_WIFI_FIRMWARE
 	bool "rpi-wifi-firmware package was renamed"
@@ -164,7 +164,7 @@ config BR2_PACKAGE_RPI_WIFI_FIRMWARE
 	select BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI
 	help
 	  Package rpi-wifi-firmware was moved as option to
-	  package brcmfmac-sdio-firmware-rpi.
+	  package brcmfmac_sdio-firmware-rpi.
 
 config BR2_PACKAGE_HOST_GDB_PYTHON
 	bool "GDB Python2 support removed"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
