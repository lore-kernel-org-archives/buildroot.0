Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175BAC43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 14:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A7960B3A;
	Mon, 28 Nov 2022 14:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A7960B3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3JfywvSIA2xE; Mon, 28 Nov 2022 14:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE1AB60AEF;
	Mon, 28 Nov 2022 14:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE1AB60AEF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 592C81BF33D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 339F1408A0
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 14:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 339F1408A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsFFRC953qUZ for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 14:17:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE7C40084
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EE7C40084
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 14:17:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zewuoYFS21ftmzewuok9e0; Mon, 28 Nov 2022 15:17:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 15:17:31 +0100
Message-Id: <20221128141731.441737-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKSRUMb0AMwW9GVRYR0oQ7l0dK8pN9a8c0FP/gI7/5GpV6j1mW7vTOl7wRImtqKZSLyJbXU1XOp49yOOixVA9lsF2DustBBYpVCbWwq2nuICrXogsjo4
 dRsLs4lgATfnBdNPOEHaLtOeOJP4WwfLv0I1wlFAB1WwrG/PpYa9ls76lqJMxS8c6DNKkvGe9yCHpJKJSHAt7crWpIrESdxiirQhDNF6xKqa4ToQFDXSTUob
 4pMAOf5BzSVMf9O+3kOPaTqg+23joPPETEcK5b39mChiELLQ0WPf09FQnYNBQoJ6
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669645052; bh=1A0iyfJKQrSGWclnZhyeYLd3yIlonOtjGefXMAP6D9o=;
 h=From:To:Subject:Date:MIME-Version;
 b=izrjuHkjOdMT/iPR2RCMFBPC9fAkVU30qib9e4mnubRRyN9qOYDgZiQPwWqaYYvpW
 d8ElAwn81TGJdlTYn+IkKrTJdqUHnvOvZEmivJ4m8/nnCBvt4OT2SzLT8oZ9EQbFi3
 U/OdVOfyGggs3fXEC2TvBQI+ETHbn8w5GmxBZ/GEl7ZCDCrUYImzFP83e1e0f5CXUH
 FZstc88XM7Ki3+2rTfqgmqrJw3ahihd39vrXLHjgpQ31Bq8sB4G7eIa6H3tMmiru8W
 hNc0ZCYkeDxgtv3YNxWuefkG+R+MNJ94DjEf3viHEBda6a7wBF/U9UELIg2Jt0cHgH
 LdcUAgLYjVFrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=izrjuHkj
Subject: [Buildroot] [for-next] package/cryptsetup: bump version to 2.6.0
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
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 5f59b30560..149d1e71f1 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.5/sha256sums.asc
-sha256  9184a6ebbd9ce7eb211152e7f741a6c82f2d1cc0e24a84ec9c52939eee0f0542  cryptsetup-2.5.0.tar.xz
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.6/sha256sums.asc
+sha256  44397ba76e75a9cde5b02177bc63cd7af428a785788e3a7067733e7761842735  cryptsetup-2.6.0.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 4a52bb62dd..659fdfa2a4 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION_MAJOR = 2.5
+CRYPTSETUP_VERSION_MAJOR = 2.6
 CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
