Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7BBC4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 12:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F320F60AC0;
	Sat,  2 Dec 2023 12:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F320F60AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIC8rN_8cVd1; Sat,  2 Dec 2023 12:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0BB60A7B;
	Sat,  2 Dec 2023 12:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0BB60A7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2A31BF299
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBB4384836
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 12:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB4384836
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vv2YFlioosXy for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 12:34:08 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C3DC84829
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 12:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C3DC84829
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bc59115c2so4286439e87.2
 for <buildroot@buildroot.org>; Sat, 02 Dec 2023 04:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701520445; x=1702125245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=efDhclO8ddUJ4OUeBOnd2FzCeHXVDZAi/iUqdVb10LA=;
 b=mupt2V7Y/bZxy/rPIfx5b1XytomVnEshBPzjtTYtFYucHLgSmaQs1E9xGj4vMreeNd
 mrMH6nQA0Y4ZhOnWCDDTWz0pNb/CF1GN0hVa/RRTFWgnjHfiJKrT0fMuOqok6te/HbLP
 pQTL9TEYCW3479TxYOXPZGWd3umf+rfpXf4ALnnxdWq02eLdoGhiuisPTuinv0A3X4nE
 sOsp5QiZjR8w4W1NY6o8wvyapvrq6xFSnGKSa/5bUIqHWvUT1YrugPQTGCmJEHfTutMG
 KFlgDMocd2QSKtd4Mmdkk9qqMGlPHQbtpsq0VhReStOA8KhOtCmcd79a2R63nCASFDvC
 5wQw==
X-Gm-Message-State: AOJu0Yyv03hnKqyVNOoK4kWPALcy9K+DnHaOKu1hH46eRcyt7dKmzD/L
 VgwDYBb/wgVcSWmhqbIIImmvqugYEv8=
X-Google-Smtp-Source: AGHT+IEgrzJdc11CXINusTLVNHrizQ2+ZZdlQ97rEx1hjd2+ZUr71JZTVhcv2Ek7bk+JDROaqHyZLw==
X-Received: by 2002:a05:6512:2c95:b0:50b:d764:967c with SMTP id
 dw21-20020a0565122c9500b0050bd764967cmr1907785lfb.96.1701520444693; 
 Sat, 02 Dec 2023 04:34:04 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020ac2546e000000b0050bbcd68e8bsm705672lfn.47.2023.12.02.04.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:34:03 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Dec 2023 15:31:36 +0300
Message-ID: <20231202123400.2327151-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701520445; x=1702125245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=efDhclO8ddUJ4OUeBOnd2FzCeHXVDZAi/iUqdVb10LA=;
 b=D5LUNd7qDBQOD79hp1fA292iWBKjFJ7eRBcm1Xa/D12w7vPETtElqCcswCp7hUCNpu
 r+PnXLD8ruCYaPG9t71LlOVP3ZqQnBDFCFFF1VXiPOeCg3HEcZkYkxe363v/xQTEUMdx
 n2qPCmRKyn6lSUynAGI9VN0+J9V4zPhE1zeD77C+O+MQ0p8EZnoo7yMDNmYp1lVWzwj+
 ojx590hBFbzil5feYNUQnCnhESYZvilFh1rFLg+xuZHP8oN/tU3D/tUZa8ekUodjInPt
 KbWZOYzsjZTM+E+JPLPZwUpkcIUbe2iUGuntmn3D91YWjqZwaPJd6btz3eQlho637mAg
 bu5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=D5LUNd7q
Subject: [Buildroot] [PATCH 0/5] allwinner: arm: bsp updates
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

Hi all,

Here are the patches with BSP updates for several Allwinner boards. Bump
Linux kernel to the latest LTS v6.6.x. Bump U-Boot and ATF to the latest
available versions. This time no WiFi issues are observed with the new
kernel, even for out-of-tree xr819-xradio driver. Wireless connectivity
works fine on orange-pi-zero, orange-pi-zero-plus2, and linksprite boards.

Regards,
Sergey

Sergey Matyukevich (5):
  configs/linksprite_pcduino_defconfig: bump BSP versions
  configs/orangepi_pc_plus: bump BSP versions
  configs/orangepi_one_defconfig: bump BSP versions
  configs/orangepi_zero: bump BSP versions
  configs/orangepi_zero_plus2: update BSP versions

 ...dts-orange-pi-zero-interrupt-triggering-xr819.patch |  8 ++++----
 .../0002-ARM-dts-orange-pi-zero-enable-spi-nor.patch   |  8 ++++----
 .../0003-ARM-dts-orange-pi-zero-enable-spidev.patch    |  8 ++++----
 .../0004-ARM-dts-orange-pi-zero-enable-uart.patch      |  8 ++++----
 configs/linksprite_pcduino_defconfig                   | 10 +++++-----
 configs/orangepi_one_defconfig                         |  8 ++++----
 configs/orangepi_pc_plus_defconfig                     |  8 ++++----
 configs/orangepi_zero_defconfig                        |  8 ++++----
 configs/orangepi_zero_plus2_defconfig                  | 10 +++++-----
 9 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
