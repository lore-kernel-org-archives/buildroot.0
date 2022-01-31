Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39119C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 21:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2DC60EA4;
	Mon, 31 Jan 2022 21:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8zeEHlyFOpr; Mon, 31 Jan 2022 21:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0285360806;
	Mon, 31 Jan 2022 21:25:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 659DA1BF362
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5247F400E3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 21:25:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_oE8Rs5CK5g for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 21:25:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0304401C9
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:25:00 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e9so21309159ljq.1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 13:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbqbpqW3MPT4gmOs9t/YRJU/s5IbX92n5pCxxvIi1KI=;
 b=NRo6GhJ7GAIzfWLBtfSKJDPXElFbk2zVmKsTx7cM6bx02R319EaIT0H2HjlKSmOn6n
 uRgNLmi152oC2oKNw4NV0ZLbjGA2erNie4qhAHfODf7ByXanpW2PK0fDBGvFEG8ahR1e
 IoCW57yrzJV/dHHrxcDHV3DGawOZPEUVJ470hvIb0kvDfDEQ0de8osyFeJba7aE+SZoJ
 TRojCEqHUN14FNm/BDpFWYsr7KJ5WTQXRlzBy16fV+xKLB3jv/lZO2caYWYKVw0ZNEYH
 ZO8qY1fEnOck4RQgtfb2qt5OUnyCthSY9+JqaTOs3QfG1zf6cSZXD80G9FShmFtUynk7
 XGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbqbpqW3MPT4gmOs9t/YRJU/s5IbX92n5pCxxvIi1KI=;
 b=ulxRxCEbIfeBb7PDxiCUCpTcrgfKqa/9jd9JvoMYPkPKAQ/TNfHTOpYg6LM3pfQXR8
 /rljeendHRchhRrnGYC52O+ho/K81K6zVurJLdpWASaoB9IW5x5pRojOj+KoIfz96fXN
 0hCnb6+3JWFfw87FddPQw5Jk2iHDtvasNZFjS8EZcdTSuWl+bQdxhIYXzQtPkIBgoZgY
 7NHYOD2plnB+VOGvImB5ydKAPLaw7vU6Mp4kfQNlTZ7JyFbnS/hLAQ+nWEZMCi8aALSj
 5fjwlLVUZ6ZuKzLT0C5gwrgVwZVx2tRIklq+2JGldhgwNonpcO/WDdKJIuzD/ShyGBAh
 Owvg==
X-Gm-Message-State: AOAM5300b+XOp0jB3ImLK4pszUU/gSCTtppbY3BMd9B/6+5uH+kMTJ0l
 yeZVqowWRvJ4zNsnDIUHUJy6nsSdckg=
X-Google-Smtp-Source: ABdhPJxBST3jeVtNV1sr2cZPZAjkXYd8NxyLF42ZwSspIu1ySTSN7mNkANdTe0LsRogxjBQMkArM6A==
X-Received: by 2002:a2e:87ce:: with SMTP id v14mr14492030ljj.380.1643664298841; 
 Mon, 31 Jan 2022 13:24:58 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id k2sm3773927lfe.213.2022.01.31.13.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:24:58 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 00:24:55 +0300
Message-Id: <20220131212456.3176156-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

To fix the first genimage error report, change 'partition-type' entries
to the appropriate 'partition-type-uuid'. Then genimage starts to
complain about overlaps:

ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

To fix the second genimage error report, update the size of bootloader
file. Do not reserve additional space for GPT partition table since
new genimage is able to keep track of it.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index aee9719ae4..5a7ee7707a 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -22,11 +22,11 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1032K # 1MB - 8KB + 16KB(GPT)
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = "F"
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -34,7 +34,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 256M
 	}
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
