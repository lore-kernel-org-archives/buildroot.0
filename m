Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C460C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABEE3617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABEE3617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76B4B6066B;
	Sun,  7 Nov 2021 02:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61sNt8dfktxV; Sun,  7 Nov 2021 02:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F013360620;
	Sun,  7 Nov 2021 02:39:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5601BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CA3440284
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX5l8Z1MInVN for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:39:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id B025E40281
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:39:07 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY5Kmun0aFf01jY5KmqT0p; Sun, 07 Nov 2021 03:39:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252746; bh=Dwgs6ZWwdLgFxJ1S0cUkA/Ttyv6KAnEM/ivetypFLyA=;
 h=From:To:Subject:Date:MIME-Version;
 b=RpT5t9G2RAQdwSbci8CbzGOCp3E9qp13cwRNe8hOwwcQAn0ubNiTUfqmaZhJVJGXi
 iSvcV4b9imhBucug2M086h1CxF5LWoioP52JSahE+DIZbdGs7fUB9vB5aT5hQYEiv0
 /aq2VlA6vyj4mAq8OyrJB9HPzi4casWUEbtfzl9NxBHrV0dx/hgccYRmBGC9K3epvw
 yYeIx3mU2OCIM5LfrvllUPiIF82X3Wu2xFkfomSXTaLFT/svg8pN5ESdC1bVzgIxXg
 5HnvLFgEjuzAQ5yArNWcDZHSRRJP6nR/F6clysZGRVDWj5U3dYjSisaBQgEw5Noegn
 jMTkE4h6RZLBg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:39:04 +0100
Message-Id: <20211107023904.3060501-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGO+6q8zqAyBegxKPIBZlyZ4fTwSsKJXoaqY6YBxtKNzJgkRGD102rysMm+UW9tE/02Ic/nOgdWWGZOO3BqxUwNqyxCShbCoMobORWTC5d6qQnvwzuYu
 OuAfGhlTAenQGXFrr/rcWrzdJyFk0ipE26vC3oIm1q4zt6XOS1mDPbcr8JfJnSg3YSazAjhso2EwaxXjoLZLuHnAHiGhmN5iH0wHRql4j18ObKTmfneaGRDX
 mIM+Xib0YS3HosWavmapZP8uBNlcS2p6qNoGfs50Y+0=
Subject: [Buildroot] [PATCH 041/102]
 board/hardkernel/odroidxu4/genimage.cfg: beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/hardkernel/odroidxu4/genimage.cfg | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/board/hardkernel/odroidxu4/genimage.cfg b/board/hardkernel/odroidxu4/genimage.cfg
index e6b85cf2fa..0a90d6be50 100644
--- a/board/hardkernel/odroidxu4/genimage.cfg
+++ b/board/hardkernel/odroidxu4/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"exynos5422-odroidxu4.dtb"
 		}
 	}
+
 	size = 32M
 }
 
@@ -17,34 +18,34 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "bl1.bin.hardkernel"
 		offset = 512
-		size = 15360
+		size = 15K
 	}
 
 	partition bl2 {
 		in-partition-table = "no"
 		image = "bl2.bin.hardkernel.720k_uboot"
-		offset = 15872
-		size = 16384
+		offset = 15872 # 15KB + 512B
+		size = 16K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-dtb.bin"
-		offset = 32256
-		size = 720k
+		offset = 32256 # 31KB + 512B
+		size = 720K
 	}
 
 	partition tzsw {
 		in-partition-table = "no"
 		image = "tzsw.bin.hardkernel"
-		offset = 769536
-		size = 256k
+		offset = 769536 # 751KB + 512B
+		size = 256K
 	}
 
 	partition vfat {
 		partition-type = 0xC
 		image = "boot.vfat"
-		offset = 2097152
+		offset = 2M
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
