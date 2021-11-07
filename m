Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCB0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD9C61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FD9C61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E8FD4022F;
	Sun,  7 Nov 2021 02:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y1a8gtM5fhiV; Sun,  7 Nov 2021 02:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23AE1400EA;
	Sun,  7 Nov 2021 02:46:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3FD1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A11C605C2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dqPbD9REw5cX for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3B53605C0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:38 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9hmR7Gk; Sun, 07 Nov 2021 03:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253017; bh=+MepFb8QU/X2x8ezAev20ucN7GEYW6GeZrOrp/D70lQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZE89l1HlmV9fQIW4u52c8YwqE/phSHQLasHVZ4R95pRg2jdGpDCtnx90f/2zyJak8
 HKx5nbD87mcXPbJLQ2CenEybfXk/8zUEa+bNtZzg1Dcs6GYBN3f7i0YEWCiXWgdyAp
 GIETjQh6nOTrrqhuS3Nz7XS4t3xBQpGUQ5DNkIAQJ0dkrGW6Hk6+AT3u/TKsg8uwm9
 TZFak5aLl2ctajIOX/GaJnih5x1DQAjFmkedQUp0YkUCDINb9Ro4GmIQ19IuyUD6d4
 o2xZNpZNArzXMmpghnOfi/nhBDkMdH30QOQ0n4jILuLNcbjNJVD8terMjk1EbayLDe
 g/qn0OWET/xgQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:55 +0100
Message-Id: <20211107024330.3061378-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNHK7avP45WRhOmlXCpqoP3Sd4L9X/MT39f1fm+aOWM73Xs6tLCa1rv5dHs7Hd99Cdz8OkHtyb/0VGHCmAoVn2yPmW8TNM/frXbFqNN9zmp6nAzzAchU
 Oake/31aVQzmGJS+vMdPdOajsa+sFbjTzzmcdWPj7tRhV66+7mOESYi2poMdFLz+p47yoF7JCIaBcyc9lWVyevvlcNKxoJHEdUIsgeRMT+ys0hd66uNMsSzC
 DQ46tMVwe+08VW3yjZR1ZN2ChpVU/BQ3LpeM+nSRKsk=
Subject: [Buildroot] [PATCH 067/102]
 board/orangepi/orangepi-zero-plus/genimage.cfg: beautify file
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
 board/orangepi/orangepi-zero-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus/genimage.cfg b/board/orangepi/orangepi-zero-plus/genimage.cfg
index ec15898ddd..04d95b1deb 100644
--- a/board/orangepi/orangepi-zero-plus/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
