Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F5AC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 13:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 713C060B1C;
	Mon, 22 Jan 2024 13:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 713C060B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jqspE2cXmmQ; Mon, 22 Jan 2024 13:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD7960A88;
	Mon, 22 Jan 2024 13:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAD7960A88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 879601BF25B
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6110260A88
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 13:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6110260A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJDTl2DPWh5Q for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 13:06:08 +0000 (UTC)
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 514F360A5B
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 514F360A5B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ru03rKz8TLoEZRu03r7FYs; Mon, 22 Jan 2024 14:06:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 14:06:02 +0100
Message-Id: <20240122130602.1930529-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGuoF3cT6GF0hVz3H9d+Btd4X6hgm85gCPd+d8zfEmoh4tqcZOYDfUn8qUJUAywjf9WdqNtwIis+GKtcQwLEzB+CTNr6/cFZkcal0j61FHkwLI3RSsMc
 UorAdbrsHWkkhPCJgBVnQKijtvO/oUNdfheJvYwRi1xbcKn77aAQOtp+c2x1NwhxXJV5wb+oKB6k3YbOgGvE0+gVZZhkEdNjh9rE1EY6kStfmHUPtjt+FqDR
 ue/dTFvN6roNR6e3B6FVJgcQVTZptFqgkWk3ZYhMbi7uer32Ic8OKGnT0TVYwn6QsP6Y4dgKvaPpOrwf3eWDgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705928764; bh=J1/D241gilZrz9wqEx3byExpGdKME2hrEE2uTyIDGHE=;
 h=From:To:Subject:Date:MIME-Version;
 b=R66AZAcVFadWmP6SsBCKV2jgdqHw65DFAu0SBn9TAO7A0bs5Kbs4HXbra3X91k5wT
 f8hxIpS55fp62BLjdfpOinXVDtnB85pCeFuRpdJi2p7Pj2aenuowESKW1vr/s1hCml
 ZNF/W1B8XECwUAGAJF0+DIRKfhHpNfuMWWCMU4+rsBQmWuQu8+L+zYfhzsR57njlc6
 OKHBLNQfOEkjJrK4HNSTNLO9LuNPmUQ2Fh5KXBAomZ4py/hCT1s6BYw4N/FfkudwbE
 Y7XDfAnzzr4mS74SAFha7cAiSl8pE9N5qii2pSydiw+Telhk1Co48mFEwnMg4frG0i
 z+qTs64Odx4Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=R66AZAcV
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.97
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index e44f729363..fdfe9773d2 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_96_1_RTM/src/SHA256SUMS
-sha256  c51e89f6fbb06163f4302e368eeb672d748b52d583948bdb15ef1b069237a496  nss-3.96.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_97_RTM/src/SHA256SUMS
+sha256  078efb8393f32e40b1fb4bf6930fff7f1aabed01287fcc5fe58aba736765fa0a  nss-3.97.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 459b00123d..7405c0f984 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.96.1
+LIBNSS_VERSION = 3.97
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
