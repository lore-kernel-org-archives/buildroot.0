Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28631C4321E
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 14:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AB794041C;
	Tue, 29 Nov 2022 14:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AB794041C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBZuBMRupDUo; Tue, 29 Nov 2022 14:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FA6A40195;
	Tue, 29 Nov 2022 14:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FA6A40195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D4E231BF429
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 14:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B094E81E42
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 14:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B094E81E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rfTrKOIfZZFz for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 14:12:39 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0DD813B8
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC0DD813B8
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:12:38 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 01ErpwFR1IM4A01EspnviK; Tue, 29 Nov 2022 15:05:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 15:05:33 +0100
Message-Id: <20221129140533.438862-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA3xq8ZMNMYvbsatM6om6+7nLjpRT5DjeQqAtQBGrhwgjD7k7YNR82wTOz/GDwNHqvPdekRv8E6AYjutVime2UxS52xO/KDVwyPuWyyVCTYGNHu20YK1
 3zZ1IvpH+OhlyjUiAMkhna2Z3V3pjUmlLiW9mHvfY+iN3MOxbqe12Y+7XD6oerxYApXwPxbnQK1KuGJNfKdQvgvf26oNYbAhYyINQXseMZhHgsLeAfLDko6O
 CpAzPJLEG2l07Nl+zljP4WYbHEOaJFseXmz65nG4NfsaIGP1lI9HOCttaaHt5P2+erXuOKyVF8Wi9SOhHy13rA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669730734; bh=NwvZ+6XwHdM52ftyU1MXSZCxMNZ/mJ/+jNpDxPOwRMQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=LLxz9nxwz2NvlYR77Uhc7TEwiEF+0Ati+0JkKnedOscBMDuEWfrUtmcAB9MfMv3im
 cx+FXmyyjcYeeG3hE1o5eFh+bTQVyQ+CvMdv5IAdN2Bx8TqIsy1o5xv/zeN8V+l0xV
 oVOPv8yu5Ru1k1Q9OKtoC/beXyDUchMHFUYxEDeasi54wSwWHSaF1+ohxQcFdDApx2
 /BjB6GFX3nPYedR1oVVu6BD7tJ3PYPkudv99dnLdWy6aw5zDnQr2CcmCz4a+aDEksx
 L58MWLtIJtL0l1Uk8TWT/kEIhmpamo5b/3Et/LFYHCMDzZZWTe79D5EFSyfoyW7Npg
 zKfDHFULcH00w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LLxz9nxw
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to latest version
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 0ad7786328..29ce0e32c2 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  50529c110e0a45fbe3169d0e237c4d0959300840f5e162c24256452976fb2670  rtl8188eu-c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba.tar.gz
+sha256  c573529862861a7a75534a4f2bc34ba7e3b116125298b5bc0d432b3065bd7df6  rtl8188eu-f4af53305cb1e9a0d8d9957a042f7c01b7121bfc.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 199362d7ae..3698115d3c 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = c4908ca4caf861d858c4d9e8452a2ad5c88cf2ba
+RTL8188EU_VERSION = f4af53305cb1e9a0d8d9957a042f7c01b7121bfc
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
