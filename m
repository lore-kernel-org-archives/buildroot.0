Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D20C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 17:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45BC782ADD;
	Mon, 31 Jan 2022 17:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRpXm8Hh_56K; Mon, 31 Jan 2022 17:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D94D81CEF;
	Mon, 31 Jan 2022 17:53:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775C31BF4DB
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 742F06079D
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 17:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zBLNIsdDkzv for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 17:53:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B01605A5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 17:53:47 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Eas3nfo1z0FuyEas5nYDdO; Mon, 31 Jan 2022 18:53:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643651626; bh=ieoByxwFjSzXhNi5TqVZYto3eiFS+4J/vSncGJwfJms=;
 h=From:To:Subject:Date:MIME-Version;
 b=ZAqohrxuxQ1qjEhgKt/sjSOHwRF3aSCSfY3Nmij25KxGhjUVN3hw41g+utbLf10Lw
 1z4aYIIR+2fyUkgk8tLanbi/uA9x9w8Wq7BG+mAve8dwxQ/Xr+k6eGvARwVfv9UuJl
 Td3Kkj0kvCqCwd7vxCeyy1HIEkoA7Sv7c3PWU/679ur6b+ZyB4sAhylSOnB4+FiQre
 wFJBBPzvHhW/T+FsmLjV0IpipY1lHOB+fszxUWZD7CjYormjweguy1gggcVyxxLWRN
 ZglbqugjNExWzIhSMTs3uTfqayAhPOQSHj/6aCm/ZdT+Q7hbF+ujyKIhQOgH0YDAOL
 mTKzYr/c1JrbA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 18:53:41 +0100
Message-Id: <20220131175341.4091688-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJPQLYkHxymPN/tG97XeFq/QL/yeg4UxBi/BbeOkQubQX2xrty8tMCWZrUAL6ck3QfXyMDbkc7mj+2ese3OCBi449DQaCw7TAbaC9jBvXq91Pmkv6Ize
 JTbpx3IxYF3JRyj1jtyJvSbPf9bVPsirx63lNiF2lWX3P4dK93QcDB/SEGgFlRT03Z4jkZWjV+MxyO8tpjWsf5xvQlzV0Ae+v4Rp1Mh9uYzU6KipCZIZzIMt
 QxWXlGjPXeIn72PvX9ROXEgyPs3VPe5ewnZMe397gnI=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.3.0
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
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1615933a6e..20ef6c5f51 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd  harfbuzz-3.2.0.tar.xz
+sha256  f6fb9f28d3df7c027f38b283ec28944fb9900ab2898b149c75c91c34c9c186e6  harfbuzz-3.3.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 67eab359c6..5f4625f96f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.2.0
+HARFBUZZ_VERSION = 3.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
