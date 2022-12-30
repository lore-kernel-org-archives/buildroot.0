Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B86C4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 05:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2781860AC0;
	Fri, 30 Dec 2022 05:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2781860AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cb9saP4iv_KT; Fri, 30 Dec 2022 05:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B549606AA;
	Fri, 30 Dec 2022 05:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B549606AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40AC71BF2FB
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 05:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BC6540137
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 05:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BC6540137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTTYpSp_bq-p for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 05:40:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D7A400FC
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32D7A400FC
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 05:40:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id B87ipbUcHAPNHB87ipiWz4; Fri, 30 Dec 2022 06:40:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 06:40:05 +0100
Message-Id: <20221230054005.1281050-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO1KlYf7qE3qsMQluHmdAYUjnyRTuhPBoD3gWiA9FoIVUYpSoYjDthRKsXBcdI83Y+eUMorjc3XgVQPWzMa6M8mZp5prtHRrWEDY04ks86w8JhvjlmSr
 yeLVuaGKcHgEWprnO6/NHrekkMJZhhRpwo0BWGlQDaKRwTN3u2Wfwvynf1IJzy1UeFM3Wa5LRCwx5px0m6F7RDy9jT3BfUVt2iykIlEqLHP9YHbhOG6UIUh1
 GU5rKU7Bc/1abPziXjP8pXXyZ/JdsNGQzusVGlrhqs+LgHqsg4ZslYKejPnQMx4HDYpFbWvaKDPWowU7SRR37Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672378806; bh=xJbcn24QFH24IVe/gntIfRPrt6ZVgEFJw9bGV0VWWAU=;
 h=From:To:Subject:Date:MIME-Version;
 b=jZOfJqRj1utoKHdhwuYKFdo5+XG3imIUohoY9KCNZ/zY+T8PRgXbJg5T5dCq+9yD8
 YmaStpRjMsfLcAKpXKEkcGfoEcinodUyS9F3UXG3AXcOVx+6Dkg/cfEIdXmujZAkBV
 QUqPp8gC0nfU5FBNNn6apKz7P6BIMqcbZiEE2XRRCsNT7zcfYQT84I/yzE6339f0ny
 07y6gE1+DxtbQqjpVej5zA9ha2cUhuZE0Ty9TFV2zLFOtAjPmLswGhnO+vfq8Y6WP2
 VvCzz3IQdHH6LDj2RO7pyETDv9xGhW3x8xHzjms6ZgOvGhioHQEeuKPJd8VLA5ySbK
 fmIe/V+aRRGpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jZOfJqRj
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to 2022-12-30
 version on branch master
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.1

Fixes:
Still not reported

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 08a3b6e8cc..60185db736 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
+sha256  2b297fbcc9b5ed190bcfff9f6f808c170632ac3d69dbd92156a7f4f57142dec9  xr819-xradio-005f28cfe9e20b7f2dfd9d32d38ee97060dc707f.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 8c1cb1587f..e5daaa6051 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
+XR819_XRADIO_VERSION = 005f28cfe9e20b7f2dfd9d32d38ee97060dc707f
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
