Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E91C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 16:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F9B060E19;
	Wed, 24 Jan 2024 16:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F9B060E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B51VC7EDGhjZ; Wed, 24 Jan 2024 16:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45AE60E02;
	Wed, 24 Jan 2024 16:58:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45AE60E02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B1ADB1BF3DA
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E0640134
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 16:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82E0640134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZi5nVIigP0y for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 16:58:00 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A719E40025
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 16:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A719E40025
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SgZYrxvaOnrQhSgZZrOYU3; Wed, 24 Jan 2024 17:57:57 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 17:57:56 +0100
Message-Id: <20240124165756.913814-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJGpCznfU+BdKhKgW5rxV4ywdpSOJ8hO7b6DEhLtWM3yqpOxROgwA5D6V3legNvR/6BaE3e0lsu3gTx8krxJpBuCf3qlzx39dK0je4qCBnQKNAGGhpOp
 0ULFSi9CCBbPCc+CSWRPPK9U1bOWQ74G1d2dbdH0KU4fcbTyAVh1yDELUy2+dBhJ8la7DbaacoSIkIbkR+ugCf85GnEOawlmT9AxBngfYh8G6Bv6MoVzbyLZ
 gYNPxQkmI4tK1j8XkR9Cp3IX3b3qW3e7AEZiPRj7ScQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706115477; bh=/mA0mFCNdJlDzcvKcF7HRCUJtKdc71GgN0kY6rWlW6c=;
 h=From:To:Subject:Date:MIME-Version;
 b=nWR4WDzLclY7iAUBFkAMhdNQTHTNSsWWuhokxrdNvnnFy4fOo/wLhzNbPkK8HVbK5
 judhH8nSMm1ZV2bs6WwZIIYksIa66kblb/QGe9ErTlJNr5w20kumZVFG5t96xLZiD7
 kPikfV3To/CH+EcknRPzhKv9cpDSDKm7xcN5T/QgtKE/5SrfK1khvnNXdeJQM72bsX
 xptWdylTtwl6VPAVqXP1XJ4uwTcjY2Ss1VmrXRbN1IPbzRfrKRButWiE+WPAWRdzYS
 wfh/WjOithbApKQxKpGmE+DvIGGFz3N5wC4Rf4kPBqIkf2mulUMQbQ1LiNxxcvxl2X
 V7cn2BobyFSIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nWR4WDzL
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.7.0
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 4 ++--
 package/cryptsetup/cryptsetup.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 87cdf840c3..df92ff36b8 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.6/sha256sums.asc
-sha256  410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693  cryptsetup-2.6.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.7/sha256sums.asc
+sha256  94003a00cd5a81944f45e8dc529e0cfd2a6ff629bd2cd21cf5e574e465daf795  cryptsetup-2.7.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 3f3034475f..1b181e1b75 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
+CRYPTSETUP_VERSION_MAJOR = 2.7
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
