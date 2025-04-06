Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E21C36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 21:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F1F81010;
	Sun,  6 Apr 2025 21:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1GkSrn9nBOSg; Sun,  6 Apr 2025 21:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEEB081442
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEEB081442;
	Sun,  6 Apr 2025 21:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6321F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 21:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F4073400CC
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 21:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7dfGe2k9mvS for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 21:31:56 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 83ED1400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83ED1400E2
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83ED1400E2
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 21:31:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 1XaUuEUkxmHkS1XaUusl2m; Sun, 06 Apr 2025 23:31:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun,  6 Apr 2025 23:31:30 +0200
Message-Id: <20250406213130.3623145-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP3j8V5pOx86scfvfvHH7r5t5gcjqmGBGr+LFEIP38zlwZ2YOVtwvc5l/+JRnBKv8U88BHXZWnA8wo2LejIXJ3Z82ubMZDQIc/I5FDw1AFjO1ldFK5J4
 2PqEYH8KSTzDNeD+O6bKBIu3cHvjWX90eSE8bAXJWZRHTyso+OBr3G6GiM7/o874whrj+ZlC98wLxEAIWkmn8sCJIHMKWabFgz+jqs1ctms+X9vvHuedR6rp
 fL1uzoGFnFlXn/q4lL+UPgoH5xbvypuQerowDCfZxXg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743975091; bh=GAakZ+S9DwA0iQeH62QGs+aLYpdh2DMbi7VcTwDfCvU=;
 h=From:To:Subject:Date:MIME-Version;
 b=U4cYuFdjCdUODLQeBFwln4o4gzY4SfN2wap3CxEXPWw4RRgR0MnzCFqZR6SmRre0T
 yujzT3P0duWRruegtrIVw0t6vS/xJBt0AlxklyvmBRtniGGHkJUViFZ09kVMJJ+PMZ
 Xzhtw/wNo+NHrBy1STijKnbVheWzDnutW3IJ258GP49AajqM41ScohnBI3f8PDPMXq
 bHy1RZ+SjmRa1JGhqAiNacaVJfW2BD+bwY3YwPd26dFwtfQyQHly2h3ZzQIM3kCEuV
 KUNbf4iNWpL4c4aPdpYq3gaftwAWwifL/pwWVs6FC0cabMLhaMqnLFwS2n78VyKhKl
 Kd2S0Q1Y5k58g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=U4cYuFdj
Subject: [Buildroot] [PATCH] package/mali-driver: bump to version 2025-04-06
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version builds up to Linux version 6.13.

Fixes:
http://autobuild.buildroot.net/results/e71/e71a5b46affe5948c16a0c83534d8f56f69b6e91/
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index ddde56b55c..bc406e270f 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3111757a411ba216a4b8e3d88c29eb3be3182a7f0d5f8b9cfe10f85ec6693bc9  mali-driver-d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2.tar.gz
+sha256  c1a9ad5dfa0d4b7978a1a6dd02d7eabd4bc65e7d6a06eda749cae720749a741c  mali-driver-4f5282b305cb0956fe2485c9e9dab0021d5538f6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index fa5a8d94d9..ccb56de81f 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = d40c57d81c9cf4bc6fefeaf47153fde8eed19ef2
+MALI_DRIVER_VERSION = 4f5282b305cb0956fe2485c9e9dab0021d5538f6
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
