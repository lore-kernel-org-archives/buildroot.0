Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F5CC47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 17:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D5B80F9E;
	Wed, 10 Jan 2024 17:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D5B80F9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vR6_zNVYMEF; Wed, 10 Jan 2024 17:08:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297E580E50;
	Wed, 10 Jan 2024 17:08:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 297E580E50
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7225E1BF5D7
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C127421F2
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 17:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C127421F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esN3RnnEY30j for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 17:08:20 +0000 (UTC)
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27768421DE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27768421DE
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 6FF5E16761;
 Wed, 10 Jan 2024 18:08:18 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id f6QYuUi026zP; Wed, 10 Jan 2024 18:08:18 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 9D2B416734;
 Wed, 10 Jan 2024 18:08:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:07:58 +0100
Message-ID: <20240110170759.3966933-2-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110170759.3966933-1-christian@klarinett.li>
References: <20240110170759.3966933-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1704906498; bh=SWORu7ypcag4CO4cL7y5HVyBoO7ThY4xdh6i4
 tw/rsM=; b=oZAAhgLC19+7RWTu3EdQ09sBxQa5oCfqSoaMqYLVGztaledfFy66Q
 3iVhfyjQRJfl1E4GcwGyek2BUDjoVN0/d3Wjd6gcqm4xvAcgiju5Me/Fa2B8itS3
 3lIVaPwX4FdK+008ESTOyzszpkMrY42R7JreP3OiZNOfAF1n51TiGw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=klarinett.li header.i=@klarinett.li
 header.a=rsa-sha256 header.s=sel2011a header.b=oZAAhgLC
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6base: add
 QT6BASE_CPE_ID_VENDOR and QT6BASE_CPE_ID_PRODUCT
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
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

cpe:2.3:a:qt:qt:6.4.3:*:*:*:*:*:*:* is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/8397D12E-2D77-458E-B9C3-DC7B4775B1A7

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/qt6/qt6base/qt6base.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 67c705fb93..667dd4133f 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -7,6 +7,8 @@
 QT6BASE_VERSION = $(QT6_VERSION)
 QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
+QT6BASE_CPE_ID_VENDOR = qt
+QT6BASE_CPE_ID_PRODUCT = qt
 
 QT6BASE_CMAKE_BACKEND = ninja
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
