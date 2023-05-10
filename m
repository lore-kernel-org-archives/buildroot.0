Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C29EC77B7C
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 20:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6EE470073;
	Wed, 10 May 2023 20:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6EE470073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6CTLXu2d0z8; Wed, 10 May 2023 20:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2710960EA7;
	Wed, 10 May 2023 20:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2710960EA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 585FE1BF349
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3043E42055
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3043E42055
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dkEr5q0vcjA for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 20:51:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8D9842052
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8D9842052
 for <buildroot@buildroot.org>; Wed, 10 May 2023 20:51:33 +0000 (UTC)
Received: from localhost.localdomain ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id wqmZpDjTuij22wqmZpb16J; Wed, 10 May 2023 22:51:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 22:51:30 +0200
Message-Id: <20230510205130.1965130-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG0IPVLl+XIiLqKcYP9Tf1l1tbVc9/Ge83Z1LIKgqU4WkaVUVz3FHeWRW6ByDels+CZcoU8qITrNG2A2wC9ZvIJ3mhIrm86bZUp1cN5qXjowTInrTFZq
 aWOItsXrPeBJmAhqnEresaLVx/Ho9e7rXIbmdW1YYUcfeW7nR16J1vYN47QXIMIBeCu2TP0ZfTohsF1ZrUbIf0ZAmgAyr+F+HIckJLInUoY718xR90srofoK
 QT7299Xgl4t9fDsY6Eq1rngbh9OgCZvU0DDiwZDE8Jdk83ZJbceDvfXzSN/r/d1b
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1683751891; bh=ee3DGHk7DGung6k5oYLdYak7uwlqiuv4GHcJbJrxewQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=YcbMjze5aot7NqDN4deESxUPZBu9D2Tq5U9EJyd4wW1x7xYRRCm2NflRzS//Ol54T
 KhG/2L7W5mxo0/q1678vqjMPXDV1Yt0ASkLydIHkuHCjdddFiGDoPEuSWXGQ4yI877
 LtNG0wbwBWFT2N4Zvb6RfkS68yLC1nyBs03T7hRWevkYy2G1fqzHBaoB/sSwJ2gibu
 kEBfUbU0IbhQ40JemyAM1u4DEtcB/xVgHpMJEqeA7L6mqNZ/kXkKhddua22JClmkEo
 cBhEjf3IthdPfhMF/k97piVZFSf8PMhEcG+/M1wwuxtlxag4zfedGOP14o4/T0OD4G
 WPsHqqe3Q3rKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YcbMjze5
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 7.3.0
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
index 88b90c8b39..6b3dfc22b7 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc5560c807eae0efd5f95b5aa4c65800c7a8eed6642008a6b1e7e3ffff7873cc  harfbuzz-7.2.0.tar.xz
+sha256  20770789749ac9ba846df33983dbda22db836c70d9f5d050cb9aa5347094a8fb  harfbuzz-7.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 23741ebace..981d911014 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 7.2.0
+HARFBUZZ_VERSION = 7.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
