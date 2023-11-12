Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C318C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 18:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD4A2820DB;
	Sun, 12 Nov 2023 18:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD4A2820DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THTMMvtCYieF; Sun, 12 Nov 2023 18:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 236EA820D6;
	Sun, 12 Nov 2023 18:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 236EA820D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91C241BF3F3
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 18:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B4EA612FF
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 18:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B4EA612FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sRgJO7qSj_4B for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 18:01:07 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EBCF61024
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 18:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBCF61024
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 2Elarmb71tD7I2Elar1TKd; Sun, 12 Nov 2023 19:01:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 12 Nov 2023 19:01:00 +0100
Message-Id: <20231112180101.1451451-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfP5WRadMN4W+i/fqau5GcSHdx0qUJmLFrq7WBeTgqGam5qGzt1xWsHllSNKp1cjN0aF2dIYXqvkTouDuNMw4o9vLTymm24B55dNPK7wCShqJKI6YUawk
 9rNwBPBf1Lb940Bz3l9ykMTz2/DRHQiQv7f6UHjebQg+uz4c8vGfo44TkxhVZa6QSrKZ2AWAdiqKxLQoTYqhH072Qizjp6HvOu0FzZoGCNZ/yIonmod7k5Of
 u+mOODphIBAKqftRuM0+twoShaAcdxi0YJvqDHlxy2okfWAkN0DfNDJMSt9rdxeNuOysK3EGZOfCK8CHd2tRxg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699812062; bh=J6yR7jxdyTdymbc1cBdLWfaM4UDNapLSqFSydz11nEA=;
 h=From:To:Subject:Date:MIME-Version;
 b=QfKXU91eXQE1snqv+2CT3T9LrSU/ScnSib4Y+FhnqpG5u/OvD6am/8qKtAeIz3uz7
 3aWQ3UH+Rslik+3sis0KBWuWePTpf08e1t6B8RRr9G5YTOc6l++1cB0Z+7LYQ7eGoO
 q+mBLXOvbSeu7ojoCa71RheLvUxsvVMKHbmYmQl4FA2g03abMsVOjDR49KELGJBwYH
 PgZ6LMa0CPVuT1R50FnyuUGu5PxXjjk85VZLsttsf8pbYKnK+p1JKsHBUjyBljzGmp
 iGeVcuC28Ak260CxeonGHy3KIyRisIjOt67/CYFPDIUGXMj5K/A5L6FoNmUvXKxufg
 +ieMXaQm8yndg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QfKXU91e
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.12
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file (date updated with
https://github.com/cesanta/mongoose/commit/d7eb3db60bdbf42ebce0cd03924f815ed0c490e6)

https://github.com/cesanta/mongoose/releases/tag/7.12
https://github.com/cesanta/mongoose/releases/tag/7.11
https://github.com/cesanta/mongoose/releases/tag/7.10
https://github.com/cesanta/mongoose/releases/tag/7.9

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index ffef9f446c..ed5db5ebf6 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  55073dcd427ab9475731ad855e417884f4fbfb24b7d5694f6cabadbee1329f16  mongoose-7.8.tar.gz
-sha256  b41c293820074278291813af9f181918154875c94d744a90bf4eec331be28ac5  LICENSE
+sha256  91e719e164816b349be3cb71293927f3f6abbe3fb02187e2d9b5e56f542c2063  mongoose-7.12.tar.gz
+sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 0693f7553a..74594ff48c 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.8
+MONGOOSE_VERSION = 7.12
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
