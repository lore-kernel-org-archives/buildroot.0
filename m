Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679EAC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 19:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1304740223;
	Sun, 30 Jul 2023 19:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1304740223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nZxo4YJwTJwo; Sun, 30 Jul 2023 19:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C6624023B;
	Sun, 30 Jul 2023 19:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C6624023B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6F31BF3E1
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 19:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 822BF818C4
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 19:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822BF818C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QiyXepP6G70h for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 19:15:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AD7B81831
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 19:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD7B81831
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58910A4C0C45;
 Sun, 30 Jul 2023 21:15:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58252)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQBt0-0004GS-0Q;
 Sun, 30 Jul 2023 21:15:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 21:15:26 +0200
Message-Id: <20230730191526.3206877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690744526;
 bh=7eTm8VmqwzWwZAJYZ7Q+VP8aRmJZFGzgvU++ou84RUg=;
 h=From:To:Cc:Subject:Date:From;
 b=Es9nFAQXLqfaWqQ7dU2/dRGAYTh2ikjplt+ZgS42f7KtAAr3yUHNRJaIqGWjsGRGA
 RP4m38Hlmc6UZx6sFu5jgVfmjAw96vpvyuPH+Xi6czR+sRS45886Dhk36/ssfAilsU
 W2OjfyJvcmX9AXFC7LvIsye9s1zfEkWt81H6Awc/UfV9GYTvHl8JIr/zHa/8t+Z6x1
 0CqtXVwi+S6p7c800gwB52lLahhf16uRatF9uyyPRga8aduZ0coWWLexb1Bq2vS+9d
 cBuDUWiShKjeozzD0DXN41ah4L8YMdkh2wlFQ+BbN2c6w4/K42E6Tqor+H61CaZB7+
 nCaFJC2G3Gt7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Es9nFAQX
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 004619f4f4..5b021edcc3 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a4ce9ef9299901ebbb5849aba9bb9de3e8f0ab4d1166f1f06ea25997d10d06f6  tvheadend-18effa8ad93e901f3cdaa534123d910f14453d1f.tar.gz
+sha256  9d8e68d1442403709846b93e7994652a1eca0f03924924d3a4dd31b882851375  tvheadend-fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index c0fa83be8a..f9303ef2fe 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 18effa8ad93e901f3cdaa534123d910f14453d1f
+TVHEADEND_VERSION = fe47ecb5504a521fed9c1ca9705fb0dd2bb8443a
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
