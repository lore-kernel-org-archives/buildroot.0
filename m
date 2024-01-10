Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDA8C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81CB81518;
	Wed, 10 Jan 2024 17:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81CB81518
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvKcXiIi9mXo; Wed, 10 Jan 2024 17:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBC380E76;
	Wed, 10 Jan 2024 17:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FBC380E76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E81E1BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BD380E76
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17BD380E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JD3Qv0h3fbqn for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:18:04 +0000 (UTC)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E13D80E48
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E13D80E48
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 864A816523;
 Wed, 10 Jan 2024 18:18:01 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id AqZpKQdNSfcB; Wed, 10 Jan 2024 18:18:01 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id B4CA116255;
 Wed, 10 Jan 2024 18:18:00 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:17:54 +0100
Message-ID: <20240110171755.3984161-1-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1704907081; bh=aC
 odo52+yslGQznOvU46/Oqs901SCRmOiroBAMW6Nf0=; b=KdUKphEXpd3lBvqTwV
 g9GNrYgcFZGaAow43559ll1kYM77OXSwobNZc4j7lMu4gMMAKhjQBd/ygpLSerau
 jzLXjEKVEczNnhf+WbfqG1FUOj0G9EKT8gTcPk/cV0jFztNq+rre7lfNqwnbX+hB
 88zhmatDcVwzBV6zK7Dmp1kUA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=KdUKphEX
Subject: [Buildroot] [PATCH] package/libaio: add LIBAIO_CPE_ID_VENDOR
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
Cc: Christian Hitz <christian.hitz@bbv.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

cpe:2.3:a:libaio_project:libaio:-:*:*:*:*:*:*:*is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/detail/69B8039E-7837-4DE3-8DFE-C2E4D834EE78

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/libaio/libaio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index e13e49346b..12cfbc4ef4 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -9,6 +9,7 @@ LIBAIO_SITE = https://releases.pagure.org/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPL-2.1+
 LIBAIO_LICENSE_FILES = COPYING
+LIBAIO_CPE_ID_VENDOR = libaio_project
 
 LIBAIO_CONFIGURE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
