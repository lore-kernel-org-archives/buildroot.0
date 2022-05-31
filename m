Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3D1C433FE
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 20:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B310460C02;
	Tue, 31 May 2022 20:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTY4ZtI-TUUg; Tue, 31 May 2022 20:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65BB60B67;
	Tue, 31 May 2022 20:47:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD6F1BF27E
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39F1960B67
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmzo2pOqJ8Kx for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 20:47:41 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8DD760AEA
 for <buildroot@buildroot.org>; Tue, 31 May 2022 20:47:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.179])
 by Aruba Outgoing Smtp  with ESMTPSA
 id w8fLnRSdbtk1Hw8fLnNykZ; Tue, 31 May 2022 22:40:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1654029635; bh=A3pU3+I2/PNqAYawKBrjsHyZPfu6YMGeRUoHTwrRBvw=;
 h=From:To:Subject:Date:MIME-Version;
 b=ml4kHmsA/uox13ShlJyFrTJ/QPj0+ArPjkPXpGCeRikLv5H5EKIzBP7cC1b5J7ZRW
 2Fhy8hSDQjjf4nNje0E43UVyfpBBhT+Ie3S7Smv0Zfp0BSOy0pOGT08l3AuSvrjl5H
 oIZcWkqwtsALop421wxPJR6dxL8rTHWEJ6b+GDl1vwqKZJZ+djveRyivpVkv1GcvAG
 KPERO3WQse3KARyKI5nXKj9TuPA/bbvs88NRtHjXk5mXQvNlT+7pICuQyS/csNx+MY
 CnG5yLiHxEf+41kPa40xFjlCQmjMJaoYHvywthVY5Jo7WXPZYmiTD4uU/ZM/byjVNU
 aTPH2H3yW3HTg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 22:40:34 +0200
Message-Id: <20220531204034.1756510-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEOzS3Cuv23KyZqgT1f2HzU6pJb6aIxJUbV0lrrk5CQe5wSbLUhGRv8M6f+0nWiKLtQVPDVEqoXXjY/DkP4vviaJSoKZvs4L3IERG2aAClowELhm/6OU
 4qbElcMeGkYMnLae6YGFq9ZiFWu0YZcWwDEFAPwCxHlC6zoxrr0I6nJx3kvlMhxwiPVvnQn/xr4n4ad65qmioh36oAt4M1MN1R5z9+a3tik0IQ6Jj6weBn09
 0apaML6nX/4hv+z5/GczSY+33aadzvIaT5OGGsX6VozRL4lnVSYBRtoMq0Gqlyas
Subject: [Buildroot] [for-next PATCH] package/harfbuzz: bump to version 4.3.0
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
index f3ba228353..29ef89719d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bd17916513829aeff961359a5ccebba6de2f4bf37a91faee3ac29c120e3d7ee1  harfbuzz-4.2.1.tar.xz
+sha256  a49628f4c4c8e6d8df95ef44935a93446cf2e46366915b0e3ca30df21fffb530  harfbuzz-4.3.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 38ed34ab70..8abce91537 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 4.2.1
+HARFBUZZ_VERSION = 4.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
