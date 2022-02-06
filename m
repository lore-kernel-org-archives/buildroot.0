Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C59C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 22:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A7C60B71;
	Sun,  6 Feb 2022 22:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oCIqKF_6fyI; Sun,  6 Feb 2022 22:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BCD860ABA;
	Sun,  6 Feb 2022 22:59:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5C21BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5247B60B41
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 22:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bDJ7b4orLeVx for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 22:59:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A4216059C
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 22:59:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GqUqnqZqzkz4hGqUqnY9sp; Sun, 06 Feb 2022 23:59:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644188344; bh=BLUQ1sEf1m7oKd/hSQ40ihOvyZwzTJ+j51Ux72/GB8I=;
 h=From:To:Subject:Date:MIME-Version;
 b=UZCLynl5K0No+jV8YIAiprp5cUAOEksyJoBBRK/8yzzX6mML8wdmd8m98rXOsSiBN
 MYF4mqUxUWuopxCOfUnD0fVEgLuMraiuC07LmI6ZjWcwaflpF+D0Wx1Zg8ti0iDyCX
 uk82IkNbZoaoZ+p/0AdKuPb7rNZKjDLRQQ7MRJg+MthQvW4zTJqTAEkxXWxFgZsKrF
 a0yd0KJ/sa3nuUSC41VJbItReKQBChYM8kKAGfF5IlYA7c8BfNL89urJHxFKPzzPap
 xNKQDNN8p/gWu7RXhlRuiseRUq6utb+bkaTydOHJKiYI13urH07SerraXaA39GpB78
 x18zraWHaDxAg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 23:59:02 +0100
Message-Id: <20220206225902.3349344-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfM4y1g0JU+W6tv3Sz2p/OqArgxHJPSvCV/pmcktvFdpliZzBvKCUXVSjb9zDv6JcuNDDyJ0Y2xPjnfcJl/c18gZ2BRpevMuoDNpYvR9y65Zq3y18jJhy
 jlAxOT7zHJ2a4C2OieXcOKaNCYFX93NDCafCqBqXIcxrAQyb4yM7btUyOgiSn+WEkx3rH8LwHV7rmiOew0C/TeFouqfm5r5gmq6mgPa1O09ybRvjXa1uae/b
 4FeJDOtSnXbFS5wsrL8FtY4vxIQ0vNThO8yivF1wkX4=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.3.2
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
This patch superseeds this:
https://patchwork.ozlabs.org/project/buildroot/patch/20220131175341.4091688-1-giulio.benetti@benettiengineering.com/
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1615933a6e..61f2865563 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0ada50a1c199bb6f70843ab893c55867743a443b84d087d54df08ad883ebc2cd  harfbuzz-3.2.0.tar.xz
+sha256  1c13bca136c4f66658059853e2c1253f34c88f4b5c5aba6050aba7b5e0ce2503  harfbuzz-3.3.2.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 67eab359c6..1f5dfa8822 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.2.0
+HARFBUZZ_VERSION = 3.3.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
