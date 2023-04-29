Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2BFC77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 20:46:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F013611E6;
	Sat, 29 Apr 2023 20:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F013611E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lxPP-bWikcGG; Sat, 29 Apr 2023 20:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5108960F8D;
	Sat, 29 Apr 2023 20:46:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5108960F8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD46A1BF405
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EE881FE8
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EE881FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZGpWh2rZNK6 for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 20:45:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FBB81FC5
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9FBB81FC5
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 20:45:25 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2a8a5f6771fso9987961fa.3
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 13:45:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682801123; x=1685393123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1vegX1VxSQUY+aNwvKd7IXrasqYLOxNkn9z8nSxqVNc=;
 b=VsJaFcOpdbFEoYk3zGjH7FfxiSQK5wzpSFvb/08LsA+k75HVYzC9o47/YR9Gr2KyYU
 7B0l7Gmxyq7dFU446EAeJZ/4KhqfzlYfOzfRhWx+M1bJrfnzEposZfgaZek6iFfc32aU
 qz593tv6598l5HE3YwMAwHXqNAb2Sx4GscsC7rmi9nIdvssDMuT2rO0LxZi8Ne6oQ1l5
 QBJfF0/3FUktyJrhHCVySwrgpbBx/Dx1luwDI7cxiinKOAlOB7cruOdPXUvowwWBV4UV
 IhNFMnaNFuRRQ5xFWLtLDlSR+LtIqZnaH433NsrdE3gUn2ikisEEJPDvmAXNHMOv7Bsv
 tljw==
X-Gm-Message-State: AC+VfDyZhx7b/e1bxNBD1im5sZa+QkoRUldD86p9MkUszEt+5EBCwMUy
 qntSpuBrN0kIBPQqtzltvs7ryEhpo1V5lQ==
X-Google-Smtp-Source: ACHHUZ6vFs5+cmQJTs95Hjh1/6FhA1BZyyqmOmYXBQiofuiHQ+1Yq7l5D6Mp/L8WjSXfCINVo0SF5w==
X-Received: by 2002:a05:651c:8a:b0:2a9:f9bd:1366 with SMTP id
 10-20020a05651c008a00b002a9f9bd1366mr2194271ljq.50.1682801123447; 
 Sat, 29 Apr 2023 13:45:23 -0700 (PDT)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 z10-20020a2e350a000000b002a8abe6f094sm3721906ljz.104.2023.04.29.13.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 13:45:22 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 23:45:11 +0300
Message-Id: <20230429204511.750377-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429204511.750377-1-geomatsi@gmail.com>
References: <20230429204511.750377-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682801123; x=1685393123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vegX1VxSQUY+aNwvKd7IXrasqYLOxNkn9z8nSxqVNc=;
 b=PnfPADu/1VYEc0+DhL3mintkXG8iNsczS/p5ml2SrYln9t0oXRyc8gspAuNaKfLfqI
 H42ESmkNpzd0ETN628+3ToIvtUV/U0XjOgYra7eG7MPbyHg5g/bg5P5I7P/W6p8qJQUz
 sLV949ICiHRz2YzSbA9VWwPBDR4K0BL6NoF7Xe7KCB23Q9w7NZxNa5H2EaVXBIGEdOFC
 WPEuD9LGyPwQkef/hem5OFVVYlltvcRcE/k1gXL8aRvO8maQDGu/q75zz1jK5io9zut/
 HXR6QgLSYpYs6iR0awaIUNqD6NH5ukdz+7sgjDc3i5jjBE57EUUlNAM1MNx1Lht1TESr
 iB8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PnfPADu/
Subject: [Buildroot] [PATCH 3/3] configs: orangepi_pc_plus_defconfig: U-Boot
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building U-Boot for OrangePi PC Plus requires host OpenSSL.
Build error is masked only because Linux kernel is built
before U-Boot for this specific image configuration were
wireless driver is enabled.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_pc_plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 73ba934b69..9dbf808da7 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
