Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BC2C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 16:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F0F436CF;
	Wed, 10 Jan 2024 16:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20F0F436CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHOaHSweyN_D; Wed, 10 Jan 2024 16:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 385954364F;
	Wed, 10 Jan 2024 16:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 385954364F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB271BF5A5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6B0983396
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 16:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6B0983396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7TFl5QRUgZYE for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 16:51:43 +0000 (UTC)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23E8C82430
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 16:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23E8C82430
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 3254F16715;
 Wed, 10 Jan 2024 17:51:39 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id YhqQjZgsuvS3; Wed, 10 Jan 2024 17:51:38 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id E20C716716;
 Wed, 10 Jan 2024 17:51:37 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 17:51:11 +0100
Message-ID: <20240110165111.3937223-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1704905498; bh=L2
 r3J2Wfv0YGWx3IzDWLZVJox5wBqKilpZArXhLYkWk=; b=WEq4GQ16fzrWefZzPQ
 fmf6IDNAhTltooHKcmclZh1SxKU8voj/kozTcQ5L34AvtDl2q7q5QE96x6yk0HHF
 XG+VF3/nqK6pAcxIHj1idUL6sz/7c2LQVXTZT8qBKMp6QNCTM2foUz6kUONbaIJu
 CYSLC7LtyqNmR7HAwULM1PvAM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=WEq4GQ16
Subject: [Buildroot] [PATCH] package/sqlite: use SPDX identifier for license
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/sqlite/sqlite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 99b1c4aa71..b54bd9580c 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -8,7 +8,7 @@ SQLITE_VERSION = 3.44.2
 SQLITE_TAR_VERSION = 3440200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2023
-SQLITE_LICENSE = Public domain
+SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
 SQLITE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
