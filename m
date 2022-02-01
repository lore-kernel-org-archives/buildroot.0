Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C272C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 18:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD43240641;
	Tue,  1 Feb 2022 18:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yp1ksXCqgpg0; Tue,  1 Feb 2022 18:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BA740363;
	Tue,  1 Feb 2022 18:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 804BF1BF989
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 783B4600CA
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3PcNE4Puf8d for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD5960BD1
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 18:33:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Exy8nuBUiroAhExyBnYlHk; Tue, 01 Feb 2022 19:33:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643740415; bh=1jD/YBd1ZgSY/xuAS9FaEFAWzkigeNiWdeh560dFjn0=;
 h=From:To:Subject:Date:MIME-Version;
 b=aS7wrJNURvABDxq/yM+EHHcb6vOB8Rz8PgIfEoZJ9IhyO73IjvyuXJDUaY38ifxE0
 ijQaqGz0BIYjr08giq7chOu7N0/pN0Y8fkA7I8bmFtqhngnaUBgOVXBm0gz7SeX8RL
 0bQuxJeqt3B3Fh8dPRVUgosDAhD1Swy1HqqRjX1+x1bSXl2hnfVtvLl9V4UwpQWZEY
 N9VOFhimRL5/wVoYauITfOtUTe2GEbu4vIOBm3s/lsgb5JK+8EGj91tuRmBIoEJPKY
 +iVYVVl6JsEppeUkhSo5+tM+PTVWHKD+BXVyQ2s4U+icBGTGOBagj4x9u3B4PZavQm
 3fwODJhY2e+gw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 19:33:31 +0100
Message-Id: <20220201183331.4009320-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
References: <20220201183331.4009320-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIA692OrNrpX2lMs/QoUnHD7qD5d7+7YHPqcrxEXZuVDlm1jI+SimkeRGy2fJWHSMbxT8ticeIHgPn7OTuFBJN5ZEadI/BZ/qKCWRzZhGGBImh8WQxXM
 NaNrBo/7hYD1ItpayaWqWMCpfhCxe+AraxRAuApUPwQiS6MFE+u0hRqBSlmbJ5YEJ+DMaSS3d5daPINXvzWXM7N5Ah9qpQT4XB6P4bTGWrcRHVae8I2gKbBr
 oY7W83kag/Y7U+DCu33qHunxF3Z9X3ZO8i9ovMtAGVw4XPS/6oBrAEiqk2jhX0boI2ky0V+2OfIYHack/oebQhR2Q8I+y1FKigPEPhMRMvcC3qz6dSkBq1yR
 b4FpRlwcZiKCNwVPrhVDFUtCEht1qud28R8YeJpVwUMbH9h47y+kZnQO2e/90oVfPAvknbvJz05Lp++DTcEbIb8XlwrIvg==
Subject: [Buildroot] [PATCH 6/6]
 configs/microchip_sama7g5ek_mmc_dev_defconfig: add missing
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
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
Cc: Eugen Hristev <eugen.hristev@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/2035821100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index 3253bce401..383865c2b6 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_PTHREAD_DEBUG=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
