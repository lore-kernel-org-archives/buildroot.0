Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005BBCE7B1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 09:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A180783C49;
	Fri, 29 Sep 2023 09:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A180783C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sJuATrPYCn_O; Fri, 29 Sep 2023 09:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C9483C79;
	Fri, 29 Sep 2023 09:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C9483C79
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3C211BF842
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 09:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC2284226E
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 09:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2284226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLzeCztTDJ1z for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 09:13:43 +0000 (UTC)
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57AC84219D
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 09:13:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57AC84219D
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id m9Z4qqn0Y9owrm9Z4qVGUu; Fri, 29 Sep 2023 11:13:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 11:13:37 +0200
Message-Id: <20230929091337.2389476-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK4M5n2aU4rt4La0F9zWuMgfma+f2RXUeoZFI3sLESW9f7vWJlg7YiUWmW1ydcWBj9WRRfKVLhbo/Db1bIM6x08pvnqVK6h0o0uj1g3PaU9g1FhfxpPv
 wjmHwM1fBRfdhOa6DRWTEJCSNusl4vSGuXM2tNm9UFoH5mMVXJSvdR/FgM3yEcMnJTue8QgvAfJ1Qm0yddLRs5L26O75Qo6pA1jQkaVTBOEdHi3PHmzhDwG0
 cIESnDc8cd2rpbalrEG3IJaVG+4zxVrWOaXKUVS1eoRRwz2GjYzIJ3DdDTiyVh1s
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695978819; bh=LTY2AVzF79+bZDU+qi5c9mGrOn4mqwKsxYtHQk1jsfA=;
 h=From:To:Subject:Date:MIME-Version;
 b=C7OKUTG7vUqB5n90/Zr2AMcceUos/fuVY4GryijHcXq41rvQ3ICtuRx46iRANYMX9
 QVPHKCcuw8/byUF3GlFDWXp/QMdRRNCkHZlMdf3ADXC4pcYvEXWo8PpEqBKcvVNO28
 z2yKt55l8aETKJZib9WZr2mv3F38ui37lipzznA2u1Dir8WDQgmSNEWHqyQfmzvLtB
 JtyCycAMQ5jZcGw0XopBrk0z9RWlB6FqLP2kOZ6vdFBbsPf2vBykX6zLbLpNnEXxxi
 76uTI5pGYAlS/BS+Yh4oOQus8Nz/v/oi0rYx914OPThrQG8Zv7kndok5blng4vRw2x
 RiR6ksnQCvkNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=C7OKUTG7
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2023-09-29
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

mali-driver now builds on Linux 6.5.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index f48450292d..ddde56b55c 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ba30a5bae498462c4e967564b3fd6e5cbc5f4a7f71bfe9d13091ac6b0504d749  mali-driver-9baa7331c8e5ba6075e3fc42c530ae7f4c320cad.tar.gz
+sha256  3111757a411ba216a4b8e3d88c29eb3be3182a7f0d5f8b9cfe10f85ec6693bc9  mali-driver-d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 3ab9b19f5f..fa5a8d94d9 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 9baa7331c8e5ba6075e3fc42c530ae7f4c320cad
+MALI_DRIVER_VERSION = d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
