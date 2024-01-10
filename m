Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC691C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7650783BE6;
	Wed, 10 Jan 2024 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7650783BE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12N8V72zb1k5; Wed, 10 Jan 2024 17:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2FFB83BCD;
	Wed, 10 Jan 2024 17:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2FFB83BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD8131BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B694183BDA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B694183BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YntFSSOJVsIQ for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:08:13 +0000 (UTC)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F8E183BBA
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8E183BBA
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 6BBB116761;
 Wed, 10 Jan 2024 18:08:10 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id w3u04Lw0BAYF; Wed, 10 Jan 2024 18:08:10 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id A731516734;
 Wed, 10 Jan 2024 18:08:08 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:07:57 +0100
Message-ID: <20240110170759.3966933-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1704906490; bh=sa
 IJSxMu37fg0bW5pPBxFOt3fK/aJ2mzTMZBMNYWJ7s=; b=exK+9qAZnynIFOnj5I
 KJFDLEpi4Hfv22tIZPskU91bJS/FDreOOU/MTxOAhtJyzCZOAfmP3XqG8xlMv9Gf
 Jr0tfrM7aC0Gj9IJhRteaZVzMuXPCZbLpBgGBDJqjcojviBpT/1Xqb7zVZTTaR4I
 bVJlzBl3kdMnx6xqQpP4lmBO8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=exK+9qAZ
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: add
 QT5BASE_CPE_ID_VENDOR and QT5BASE_CPE_ID_PRODUCT
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Christian Hitz <christian.hitz@bbv.ch>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

cpe:2.3:a:qt:qt:5.15.8:*:*:*:*:*:*:* is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/3A753A6D-0AFE-4E62-9C2F-58C8B630830C

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/qt5/qt5base/qt5base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cc29f5523f..91891a2ec2 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -7,6 +7,8 @@
 QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
+QT5BASE_CPE_ID_VENDOR = qt
+QT5BASE_CPE_ID_PRODUCT = qt
 
 QT5BASE_DEPENDENCIES = host-pkgconf pcre2 zlib
 QT5BASE_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
