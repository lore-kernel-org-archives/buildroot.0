Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41986C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 23:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ECDC408D5;
	Sat,  6 Aug 2022 23:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ECDC408D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNekhUc2SGcj; Sat,  6 Aug 2022 23:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F3CE405E9;
	Sat,  6 Aug 2022 23:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3CE405E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 152981BF473
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 23:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E43D160F8E
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 23:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43D160F8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2plhF5E06nJ for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 23:21:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F23A160F8D
Received: from smtpcmd03120.aruba.it (smtpcmd03120.aruba.it [62.149.158.120])
 by smtp3.osuosl.org (Postfix) with ESMTP id F23A160F8D
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 23:21:34 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KT6royryp5XbvKT6roQveF; Sun, 07 Aug 2022 01:21:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 01:21:32 +0200
Message-Id: <20220806232132.1433066-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMXEuoHf4Pt/49vn1L42+WDLOH2yp7zja0QaykcS3G28ob4CRTJTi02kvU2AupShApZrlVsJdb4mPICdmCc419MyfDtk6fVxpT9JOL7rTKLmlGL/giCh
 BRHKky3bE1m80TTFnsimBQ1U7W2689qbeQa4F+pbbCEYESzR5GQaokwkBuTiu8Ega1yYGs+G5ZtgfiKHK84sDZ62FpCgSu1iCa2OG5MsEqWIBDodcH3ATR/3
 N/IsPmcUCnnV+w675iMO76wIQMngYcHct6ayb7zzm0d/0VGBLUmUB5Bl39/aN3ah8u7xA6TbS/oUC8j6GS/8XA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659828093; bh=nkcceiO2Cq56t1DibbNbQ6KYqS1tgw7yfK92L0eifpI=;
 h=From:To:Subject:Date:MIME-Version;
 b=jHAuDNRhRGrVHZ4yQ/ooYuYPFDMu1w+Zmh5v7r27sOHzjz8FaH3ANUZErOy2PT6xP
 V2kLXwpSkwGM4Cv/ejNeDw3GmSaZ5GUIlZHUjckFCKr5Ya31npHcKZ3/aHp6vUgEWF
 KrOPibu+u5uVl+XPxD6DA6r1NeWDAfof/kEJvM3E6FpBfyvnKR/GfIzmajwWmzOidw
 15/Q0dByNUd0OKejz2NUJ7oiANjGuzr8Ebh6YsG5AEoFuCVgvPPY4ZRI/ThNIO+CN4
 obntz2RMykgkavZ3gtr6EtbQ0hYMOc6j6wp+bI4rsJWNH4eLMinUz9aiLFCTDvc9g/
 zSISISrjTlBIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jHAuDNRh
Subject: [Buildroot] [PATCH] package/mali-driver: fix build failure with
 Linux version >= 5.15
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
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patch for fixing build failure with Linux version >= 5.15. As explained
in the patch itself starting from Linux 5.15 if we use any DMA_BUF API
(dma_buf_*()) then we must import the DMA_BUF module with:
MODULE_IMPORT_NS(DMA_BUF);

Pending Pull Request:
https://github.com/bootlin/mali-driver/pull/3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...linux-fix-build-failure-with-linux-v.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch

diff --git a/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch b/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch
new file mode 100644
index 0000000000..07f2a58c7d
--- /dev/null
+++ b/package/mali-driver/0001-mali_kbase_core_linux-fix-build-failure-with-linux-v.patch
@@ -0,0 +1,31 @@
+From 26979e5f030eab9cde8d4197a819bbaa4cc21188 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 7 Aug 2022 01:13:26 +0200
+Subject: [PATCH] mali_kbase_core_linux: fix build failure with linux version
+ >= 5.15
+
+Since Linux 5.15 module using DMA_BUF needs to explictly MODULE_IMPORT_NS
+it, so let's add MODULE_IMPORT_NS(DMA_BUF); if Linux version is >= 5.15.0.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c b/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
+index d920f8d..d87bb8c 100644
+--- a/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
++++ b/r8p0/drivers/gpu/arm/midgard/mali_kbase_core_linux.c
+@@ -4913,6 +4913,9 @@ module_exit(kbase_driver_exit);
+ 
+ #endif /* CONFIG_OF */
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
++MODULE_IMPORT_NS(DMA_BUF);
++#endif
+ MODULE_LICENSE("GPL");
+ MODULE_VERSION(MALI_RELEASE_NAME " (UK version " \
+ 		__stringify(BASE_UK_VERSION_MAJOR) "." \
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
