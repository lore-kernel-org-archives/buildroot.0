Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2705C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 22:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C62C408C4;
	Thu,  4 Aug 2022 22:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C62C408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PmpDEap59T4C; Thu,  4 Aug 2022 22:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F0794013C;
	Thu,  4 Aug 2022 22:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F0794013C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9321BF302
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8F5360E21
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 22:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F5360E21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xRGE-9okNGI for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 22:43:23 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00172600C9
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00172600C9
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 22:43:22 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JjRxoOYSo1ySPJjRyonMIk; Fri, 05 Aug 2022 00:36:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  5 Aug 2022 00:36:17 +0200
Message-Id: <20220804223617.3554355-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNcN7VyYEiIXE0OLOOgTYhn4o8v7i8JdH50h/2Zf7dmAgrGe65jJ06fyLtQpTew4a21cl/eHdwP6QYcMeshN46f4mBSlAua8VcY2dkj827+GgrtsTUl3
 zBWjI4r5LZUH9zDwDzToYgruAz1gVsqeyC88GEYj/kukRUsTE9QQgTYiQQrRdRFemqqlGR+AAuo0Dr6WZj63rMOacvxOq8914sEX1zUPy7RuK5p5sMiOaJLN
 +DZHkw9zRNVEJicZua11NrGCH0F8EKK8jG+om35MAag=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659652578; bh=mOTHmQhWQsLplZ2BqNU1LvW7FddrG9m7I+1PA4L15Hc=;
 h=From:To:Subject:Date:MIME-Version;
 b=BIHKYftRCiJNMhAqUeqXQ3BppFaaqeFDsoJ/thobLHHXLiavBr9+N38ZGCHCiYxeb
 a0EX3oFh7dXQAKPMHLnV1J7oTV7tRYfiv/ePyLJu76iuwuEFjb8Ci0fPgf8EvT65DL
 6WHVGZg3iyM4QxP1IG/z7MHrQppzbo8XpaVnV/hj7Oi+RsridZFnbZ+ULVjQyqX9x0
 Ptck4IlsEsennU19/NNMvIQ8dNFpX1npBdD9wYlukJiZYkgvC9EPS6NltsKiZ1jK/n
 QSuQQO39H8uVUoEBAxG5vIDAcLEx8P/tfxHBIS96Y5F58kthp3T3Jy0PNB/FNccvjq
 yferb59O7c3eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BIHKYftR
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: fix build
 failure with linux version >= 5.15
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

Add a patch to fix missing DMA_BUF module inclusion that leads to build
failure. The patch includes DMA_BUF by using:
MODULE_IMPORT_NS(DMA_BUF);

Fixes:
http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...1-mali-support-building-against-5.15.patch | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch

diff --git a/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch b/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch
new file mode 100644
index 0000000000..39709a3107
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/0001-mali-support-building-against-5.15.patch
@@ -0,0 +1,93 @@
+From e5f387146fb2e14c4785e84e239a3de6da1312c3 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 5 Aug 2022 00:26:42 +0200
+Subject: [PATCH] mali: support building against 5.15
+
+Add patch to fix build failure with Linux version 5.15 due to missing
+MODULE_IMPORT_NS(DMA_BUF);
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ...6-mali-support-building-against-5.15.patch | 30 +++++++++++++++++++
+ patches/r6p0/series                           |  1 +
+ patches/r6p2/series                           |  1 +
+ patches/r8p1/series                           |  1 +
+ patches/r9p0/series                           |  1 +
+ 5 files changed, 34 insertions(+)
+ create mode 100644 patches/0026-mali-support-building-against-5.15.patch
+
+diff --git a/patches/0026-mali-support-building-against-5.15.patch b/patches/0026-mali-support-building-against-5.15.patch
+new file mode 100644
+index 0000000..2e05c43
+--- /dev/null
++++ b/patches/0026-mali-support-building-against-5.15.patch
+@@ -0,0 +1,30 @@
++From 57999c7d17fabc53c684304e83571db7f6cfb656 Mon Sep 17 00:00:00 2001
++From: Giulio Benetti <giulio.benetti@benettiengineering.com>
++Date: Fri, 5 Aug 2022 00:20:00 +0200
++Subject: [PATCH] mali: support building against 5.15
++
++Since Linux 5.15 module using DMA_BUF needs to explictly MODULE_IMPORT_NS
++it, so let's add MODULE_IMPORT_NS(DMA_BUF); if Linux version is >= 5.15.0.
++
++Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
++---
++ src/devicedrv/mali/linux/mali_kernel_linux.c | 3 +++
++ 1 file changed, 3 insertions(+)
++
++diff --git a/src/devicedrv/mali/linux/mali_kernel_linux.c b/src/devicedrv/mali/linux/mali_kernel_linux.c
++index 9bfa2bd..27ec709 100755
++--- a/src/devicedrv/mali/linux/mali_kernel_linux.c
+++++ b/src/devicedrv/mali/linux/mali_kernel_linux.c
++@@ -1129,6 +1129,9 @@ static int mali_ioctl(struct inode *inode, struct file *filp, unsigned int cmd,
++ module_init(mali_module_init);
++ module_exit(mali_module_exit);
++ 
+++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 15, 0)
+++MODULE_IMPORT_NS(DMA_BUF);
+++#endif
++ MODULE_LICENSE(MALI_KERNEL_LINUX_LICENSE);
++ MODULE_AUTHOR("ARM Ltd.");
++ MODULE_VERSION(SVN_REV_STRING);
++-- 
++2.34.1
++
+diff --git a/patches/r6p0/series b/patches/r6p0/series
+index 5d4883f..c5d3568 100644
+--- a/patches/r6p0/series
++++ b/patches/r6p0/series
+@@ -19,3 +19,4 @@ r6p0/0022-mali-support-building-against-5.6.patch
+ 0023-mali-support-building-against-5.7.patch
+ r6p0/0024-mali-support-building-against-5.9.patch
+ 0025-mali-support-building-against-5.10.patch
++0026-mali-support-building-against-5.15.patch
+diff --git a/patches/r6p2/series b/patches/r6p2/series
+index e19cf11..dcc0c8e 100644
+--- a/patches/r6p2/series
++++ b/patches/r6p2/series
+@@ -22,3 +22,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
+ 0023-mali-support-building-against-5.7.patch
+ r6p2/0024-mali-support-building-against-5.9.patch
+ 0025-mali-support-building-against-5.10.patch
++0026-mali-support-building-against-5.15.patch
+diff --git a/patches/r8p1/series b/patches/r8p1/series
+index 4ad43c1..c03d4e0 100644
+--- a/patches/r8p1/series
++++ b/patches/r8p1/series
+@@ -17,3 +17,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
+ 0023-mali-support-building-against-5.7.patch
+ 0024-mali-support-building-against-5.9.patch
+ 0025-mali-support-building-against-5.10.patch
++0026-mali-support-building-against-5.15.patch
+diff --git a/patches/r9p0/series b/patches/r9p0/series
+index dca4e02..913edd4 100644
+--- a/patches/r9p0/series
++++ b/patches/r9p0/series
+@@ -14,3 +14,4 @@ r6p2/0022-mali-support-building-against-5.6.patch
+ 0023-mali-support-building-against-5.7.patch
+ 0024-mali-support-building-against-5.9.patch
+ 0025-mali-support-building-against-5.10.patch
++0026-mali-support-building-against-5.15.patch
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
