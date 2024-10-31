Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1D4E68974
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 11:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3CAF60AD9;
	Thu, 31 Oct 2024 11:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQVmCFTBwO9x; Thu, 31 Oct 2024 11:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC2C60ADE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABC2C60ADE;
	Thu, 31 Oct 2024 11:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F055E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 11:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F4940DFF
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 11:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLBBlpCyTEdq for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 11:05:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.105;
 helo=cvsmtppost14.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D90D240E10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90D240E10
Received: from cvsmtppost14.nm.naver.com (cvsmtppost14.nm.naver.com
 [114.111.35.105])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D90D240E10
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 11:05:19 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo001.nm ([10.112.18.53])
 by cvsmtppost14.nm.naver.com with ESMTP id REIYTzaqTeugfqH4cTA1OQ
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 11:05:17 -0000
X-Session-ID: 2SxFHGKkQM2jJE0HKMzRGA
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: ZwndKqgqFqJZ+HmrKxKm+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp011.nm.naver.com with ESMTP id 2SxFHGKkQM2jJE0HKMzRGA
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 31 Oct 2024 11:05:16 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 20:04:41 +0900
Message-ID: <20241031110441.2953443-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730372717; bh=1Q4+f42+2iFB13/PogKx9JYg9wMQR2t2yD9yGi9EUds=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=nRIVp83MH1r165CkpXSulpFUQ71BQ9upsmbJ5/VFAN+76vSK9cJsfstP8I9g4037N
 TxY6PQOCoF/I/SOXmnkXxfdhb0WdaZisIc7GEfObHp5yChRxl9Iclkq1ed7HcuzdGd
 jCQviTD089uS31198pi2tDxw1LyDfo3pxxt6gJ3cfxG79e5n8ZcZqC2Hxo11Srko6k
 oDK+DLtL0LPDU0amizUPGklSgw02CtbgtlNlozRvqGZauP79LilgPFo1hn9+lG1otw
 LpeS/xkHwsufvt/ig4r4UOtUR4IBoLB1lMYvIY47xkVRfSCV7cmdPm7EhGvWUQ0KcX
 qDmfPCw1DIMJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=nRIVp83M
Subject: [Buildroot] [PATCH 1/1] configs/pc: fix grub root device in help
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Cherniaev Andrei <dungeonlords789@naver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also make docs more user-friendly

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 board/pc/grub-bios.cfg | 2 ++
 board/pc/readme.txt    | 7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/board/pc/grub-bios.cfg b/board/pc/grub-bios.cfg
index bd3e3f0006..02db996dd6 100644
--- a/board/pc/grub-bios.cfg
+++ b/board/pc/grub-bios.cfg
@@ -1,3 +1,5 @@
+# After any change rebuild grub2 and the image:
+# make grub2-rebuild && make
 set default="0"
 set timeout="5"
 
diff --git a/board/pc/readme.txt b/board/pc/readme.txt
index 41aec50d36..311add1558 100644
--- a/board/pc/readme.txt
+++ b/board/pc/readme.txt
@@ -42,8 +42,11 @@ Emulation in qemu (BIOS)
 1. Edit grub-bios.cfg
 
   Since the driver will show up in the virtual machine as /dev/vda,
-  change board/pc/grub-bios.cfg to use root=/dev/vda2 instead of
-  root=/dev/sda2. Then rebuild grub2 and the image.
+  change board/pc/grub-bios.cfg to use root=/dev/vda1 instead of
+  root=/dev/sda1.
+1.1. Rebuild grub2 and the image:
+
+make grub2-rebuild && make
 
 2. Run the emulation with:
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
