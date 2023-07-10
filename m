Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94203EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24C2D40B91;
	Mon, 10 Jul 2023 21:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24C2D40B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jaacYlrPHTYK; Mon, 10 Jul 2023 21:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C48F40BA0;
	Mon, 10 Jul 2023 21:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C48F40BA0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 919081BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B57161034
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B57161034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIjTYmTYeCHp for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:15:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A3861029
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97A3861029
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:15:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.132.92])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IyE4qFO3vFU54IyE4qmcrn; Mon, 10 Jul 2023 23:15:20 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 23:15:19 +0200
Message-Id: <20230710211519.3247870-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAks4b3wrUMpDHtruFLLIZoFwvxaV7+uZ58NGbt2IhbuQlKay4GvXkGdh51ajOtTAEmWEZKh9GXLF8Wg+Nco0btXWdek9bZSxX4H4UlI5Zc91j82gFAj
 2Z0DZtRgWAEvjTTA6vrpmHgD1RTqa5HzrgavqZAOFIZjJtDd0ec7XPFrh4NktRVIWOooxXBgSr2NBdukGfVbddMs7WH5bF5aaf0msbTp5CagKxBwMsVma9e2
 yYoYkNmTFmN9O+OsB3e+Enw5zPMRseAxwTQPIB344JE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689023720; bh=lKnj4Pa5RbBDFhN1me86a6SqsE7JO9cEyE6QQATfvig=;
 h=From:To:Subject:Date:MIME-Version;
 b=hUveytxP5R1QtnT2grULlFXfyf/+re0Jik6aEDi9hDfCZVyNcCnVo5GcDWCunQ+mL
 6FWbgqCgCiwpoIn1PvcrsyRP/ulbQ1AegPt0xvwYuoIcrpH1m+/kXpRPSq1sIPZjr3
 owdj7rbwsGg+MEqnHgGrpWQ8B3WHGNabWx8TS8n2IJ3VSxzMAX3JKSI1GFmh/avPJJ
 szazLWBzjXaDR5t+qN6pwmKw1zAgLzrkoUyACjz+n6m98UnBwJGOUyGNG129mIPVn2
 OmM+rTdFEpsjjePEMOKEZ1pCwf6yQrWlUDAkBvHncKpjW5TeL2OU/VTL8FV/0A2vvt
 4Cx+pU4B1wiiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hUveytxP
Subject: [Buildroot] [PATCH] package/mali-driver: bump version to 2023-07-10
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

This version fixes build failure with Linux 6.2 and 6.3

Fixes:
http://autobuild.buildroot.net/results/0c043a6978fc5ea51b2c7a862de288223589926e/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index de3b6e69f0..f48450292d 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  763d3cf76eb03584df6a13986a2877dc0ae5f310fc3d91e8a498fc5f89271dcc  mali-driver-c90627f78d58567a2acb7cbf77d565e03a131294.tar.gz
+sha256  ba30a5bae498462c4e967564b3fd6e5cbc5f4a7f71bfe9d13091ac6b0504d749  mali-driver-9baa7331c8e5ba6075e3fc42c530ae7f4c320cad.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 8e059fe8bd..3ab9b19f5f 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = c90627f78d58567a2acb7cbf77d565e03a131294
+MALI_DRIVER_VERSION = 9baa7331c8e5ba6075e3fc42c530ae7f4c320cad
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
