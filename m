Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EFAC00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 22:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4EE4087A;
	Mon,  8 Aug 2022 22:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF4EE4087A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhI38BaklMxj; Mon,  8 Aug 2022 22:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D8CA40571;
	Mon,  8 Aug 2022 22:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D8CA40571
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F351BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F018143C
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 22:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F018143C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0FCXLYljt_F for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 22:06:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD848812F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD848812F0
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 22:06:15 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.27.64])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3D31413F8B3;
 Tue,  9 Aug 2022 00:06:11 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 00:06:03 +0200
Message-Id: <20220808220603.784548-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659996372;
 bh=A/0ciJcgqzz0BqW/mgVNLdatUPDlNogo9U/c9MG1e38=;
 h=From:To:Cc:Subject:Date:From;
 b=Cv4yHkityRD9jvRrFnKoChjO+fGLaaeGfsrO8Hefliexw8LIMxlt3L/CvWhBV6kqI
 8aJpxJ5CvHwBy6TP5pe3BiSWbIuijhmzB8Y1IpJ2rwHOODcxvJ4IYghrFnGTPKjtMt
 UXU3B/xxDySajSFo4Mws1WxNhbQF+UcnuwXNI7tkmwlB22p0A1U5EeYI5STvCLmggX
 yVpFRtffPRwMwQzD9c+GwOixv9T+V5+5odZzHwGSb5Wm4e//WpttW0u9PXywws/V8q
 gELFgjE2TWj9aMCAjx98RUVqT08ivubJTJPzGSPh5eWy0jT/7WZA/XHdtHKDVH7E/S
 QAESNQfCS+Zrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cv4yHkit
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.21
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v0.3.20, see:
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.21

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Commit tested with:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -a -p openblas
    ...
    44 builds, 24 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/openblas/openblas.hash | 2 +-
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 71fc4d34c5..3a52600056 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8495c9affc536253648e942908e88e097f2ec7753ede55aca52e5dead3029e3c  openblas-0.3.20.tar.gz
+sha256  f36ba3d7a60e7c8bcc54cd9aaa9b1223dd42eaf02c811791c37e8ca707c241ca  openblas-0.3.21.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 085d32acc3..ac40c57afb 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.20
+OPENBLAS_VERSION = 0.3.21
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
