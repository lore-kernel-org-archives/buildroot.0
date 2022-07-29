Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEE3C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 20:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD9582B21;
	Fri, 29 Jul 2022 20:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CD9582B21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8AABxKIsbGl; Fri, 29 Jul 2022 20:45:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB8E82FC9;
	Fri, 29 Jul 2022 20:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EB8E82FC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0091BF35D
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F70605B7
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 20:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F70605B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZ8uSkkrzdjj for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 20:45:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B0B460601
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B0B460601
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 20:45:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HWqwoCSBJbMeiHWqwoSVQ1; Fri, 29 Jul 2022 22:44:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 22:44:56 +0200
Message-Id: <20220729204457.7266-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL5QVw8bmbFMdKIc9m1zFxSe4OtWSVCisGQheBj/7uPqdiGoPDMbrMEDO7KRif8t5x6qfJfmt8HMpIOALtShBapmNZbS3rgN+ClxswjZ3Izt7ohbQKTz
 XJlSfZNTEItg8AGEkTSlW4TfuBsNdbj9+Exl3v/TSlbbYJoBSsJCL9JiCjv3FrUiU7K38wl7u5xPR1NmQDi4u3ykfuvkBxXoJFL5i0+uWhNQWTPhcigefPGl
 2jXc4yzSOvVb+ZOAS+BbI9WzJaKjzieKuj3dMfzLKM5IOUXh0tOd2hNuYCDfncwZ85fIaCnoUzfoqIci2oRU5lL1w4CR0xNjyNMxi0UkVeVhpV9fSfv9EsLp
 YNGB+PAGfwORUlInP4UgQ9pINyFyKFgm3Z+4LIW/iF0nvHIJb/5t3g1ucvqERO1eryDMJIun
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659127498; bh=0tRqNmkmwEmISxdz6XMykfhaBNL26Sk1bnDaCzTSxEQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=herYGy7U9AUvlyMc52FdoUN7wFpUGo34/ZXZK2281mYB1lt65ZiohkTjM+/bF9nUw
 1u3igSnktrTLOwMGIwkH69iMSp2iB08B5fjOoNzV59WjjYkWY/GoiX629xOkmTpWU/
 6zZOC0UPCPURzE1k5lczU0vh37HuSIaQ/g8iuURq77Wd9nFV4KVX3IvKF7W35D6zx+
 RXR+64+ZhXLMwJ+Syh1h9n1sBXuW/MvKGtxHMzJ/nYQWRjXxI3QdfU9tOpZVgUkw4J
 bz9oYaOgp/sRhuFT5mV+BQauFKxevCDltb/jJe1Q2NuF4e0hYNb0fG/qUYkfNFvnDm
 Z2fiKnlPyjgqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=herYGy7U
Subject: [Buildroot] [PATCH] toolchain/Config.in: improve gcc bug 43744
 condition
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This makes the condition easier to read and it's easier to maintain the
gcc bug too because we don't have to take care about new gcc versions.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3cc747c1cc..d2fc347d36 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -113,12 +113,9 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 # reappeared on gcc 9.x and is still not fixed on gcc 11.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
-	default y if BR2_sh4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_9 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_sh4
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
