Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15BEC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58D4760F9D;
	Tue,  5 Apr 2022 20:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wtpXB4smlvyM; Tue,  5 Apr 2022 20:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A4A60FA9;
	Tue,  5 Apr 2022 20:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A71251BF3A4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2DAE40918
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vgm1JXNABST0 for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 20:37:37 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1EF540916
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 20:37:36 +0000 (UTC)
Received: from localhost.localdomain ([146.241.18.114])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bpotnTElCwoVlbpotn8rgw; Tue, 05 Apr 2022 22:30:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1649190631; bh=cEJJH43v9nJ6koMh21YoVbYWsnd/ZxgoYdT3i1lNJWE=;
 h=From:To:Subject:Date:MIME-Version;
 b=WD6SmKqGLjYH3jEK0YQT+2DApJt4flOqorfKrQaiZjb2/0yqWAoszFp/xLkLnGvwO
 wdFRubL7Fsbcggmk3FJVHjsyuJ8EY924DKYiFjv3Jreskm0SKWFyu4DjyZyKTaaX74
 Rx/HC5I0HzBDcFmn1es8vhp3jwPVX44pG7n3zNCYztnQYUK521OdzG/NzHAoQhk9r6
 jqiPyW7OXK1XtkL9S2Q4IhI5nyMmLQJdjzeGl2INWzi1vB8XXum17EXYSL+Su7fcI/
 WMN7QI8pLe8IxhSnjHmM5IoNbO1JtR7pTXRjKzvD1Tow0ZrjTaJ4jbUgzrxUSYnqI7
 VPBzX6yesC1Rw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 22:30:30 +0200
Message-Id: <20220405203030.3418304-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLkg2EKLpNbOP1Xv8O3rvtiOdtD98IWpEzVcwKzJPJCtCJ+cfvJIEAAiTkQK78kiGcg3b3fIF3nrEDojFTvmPaJlzzLIFaf8BvSAEt197sAL/hM2mFbt
 INxQg+lMcFvgbUpRgsHBFgRlpFf5aVB5K3BmZYS68/5leEBanEbCV7dnLDif5j4UDRKeANVEnjQwfeWF8weNgbyUuXdT3chnLegXMwWj9Dj8NMG8yhGlIg38
 ScKhhLNyj5hr6vqhOKDdwcEAPohLJfMATANeqixAN6qZ58PC6xwSsraXv2JcLdmA
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 4.2.0
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

Since the major release changed I've built successfully all packages that
have direct dependency to harfbuzz:
- efl
- libass
- mupdf
- pango
- qt5base
- sdl2_ttf
- supertuxkart
- vlc
- webkitgtk
- wpewebkit

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index e4674afa87..1576824a5a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7158a87c4db82521fc506711f0c8864115f0292d95f7136c8812c11811cdf952  harfbuzz-3.4.0.tar.xz
+sha256  f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73  harfbuzz-4.2.0.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 331b35c530..551277a788 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.4.0
+HARFBUZZ_VERSION = 4.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
