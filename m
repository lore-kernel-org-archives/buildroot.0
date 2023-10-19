Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C828ACDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 19:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514B0815CF;
	Thu, 19 Oct 2023 19:04:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514B0815CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoka6R5UVCRv; Thu, 19 Oct 2023 19:04:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D1BD80F5D;
	Thu, 19 Oct 2023 19:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D1BD80F5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE041BF98E
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07FF461103
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 19:04:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07FF461103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vxtHgHX_zEaH for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 19:04:51 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C53760FFB
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 19:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C53760FFB
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tYK6qILWzX0QvtYK6qsO6r; Thu, 19 Oct 2023 21:04:46 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 21:01:51 +0200
Message-Id: <20231019190151.919007-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO1R/58EgIBQ09PUlBm6glLMngFxlD5OA9g0x2r8OdJ8DJ0wluxftjori0eV9u7IuRFypX8l4XEaUlDCuW7FpXejtebVV87QRoKHPJYB/J4hrvBBZTIu
 XVa/dZ5+JQDGA9W0XgBz8M3Mi2FfxGsLT+D17kO3vJRup5aINhH51AzOOGF2zNmDc2FhgnZyM0QHDd6tQB+6cIEgGuPbCndGvfGVsgeDEWZToBqBwqwve+FT
 BlMSOu7c+41tH8Xb4bUobxZyo7zkcClrN/5YeOaLWde+pNaO+cpx/+gBwyksZbcl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697742286; bh=TlEQvtTgnWQRIpVnnvbm6hdQRGUP87O3gz8vNRzAil0=;
 h=From:To:Subject:Date:MIME-Version;
 b=TyZ5J055iEVwD7dME0k3iCh4CWDodSj5PhIgJtx0CfSnnsWzqnRi4uQv8AapweBFX
 mliatnF1oug6GXdaoa/sNq1H0uB7lzC9bXBf+TYsaPGuIFdZJbXuzDy68rl8DxPlbm
 cmSJBUFetQbB3NPnucMBu5q58lXmPFrIK1LzFyIgp04ixmJNa1StzYU6dRa23j4loX
 hB19fsQEcbvv2LyOjSZ24JGeau9QF+14iKPxiy5IcKElk9i8U/kday86nyXMb0tjlL
 JR+DgCdVt5cJztnvhZ8cqejyYQ3Ks1Zovo2cgMN9C97mUIN9F80oE9iT1+q766jCY6
 wMaOwryDlXv9Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=TyZ5J055
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.2.2
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
index 3f601d29ee..69926f8c6a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0fec78f98c9c8faf228957a201c8846f809452c20f8445eb092a1ba6f22dbea5  harfbuzz-8.2.1.tar.xz
+sha256  e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3  harfbuzz-8.2.2.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 9a9859c133..0dfe1b2056 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.2.1
+HARFBUZZ_VERSION = 8.2.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
