Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B62DC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AE981E39;
	Mon,  3 Jul 2023 19:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AE981E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RG_HuMdcTxHO; Mon,  3 Jul 2023 19:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0969381DAB;
	Mon,  3 Jul 2023 19:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0969381DAB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEB7A1BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43AF60AB9
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D43AF60AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MlL78rh00cW1 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:16:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368CD60AAD
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 368CD60AAD
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:16:21 +0000 (UTC)
Received: from localhost.localdomain ([146.241.103.145])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GP22qXlySDAUdGP22qwwhM; Mon, 03 Jul 2023 21:16:19 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 21:16:16 +0200
Message-Id: <20230703191617.1338283-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMIfhXRklOmqRoVjl386vc2kHf5TmsYTDvZh4+7MIritEe2E6+cTAClNcINdsUbzJX3iuTtp+wfKQ7XaOeI7giVOJoBTWhuMcL3gqc+u4kRH1tpKbaXg
 PuEgYmcy79AAt6fxixCtq7vEPgPUjCyEIA+jNr/vA4ajdMn5O6sR+pzlhcDhRGoabESMVOCiIsLc7Ty75YKyWcPlRbnlKYAc9Y1tNufpipcCQ89kKGCTgauS
 z6jMmit4DOUJuDJ+h03IODvpZsFGS6CVPb36V4wMnGuTI3IzELvkFIpAAky3UKwtm/bmd54pGLkLMs0Krz3ziLN4oZLUTeqEDGL8FEHq5pnD08NPB9lxhHEz
 Jk7dUykK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688411779; bh=iUZiDLWBNR3aaF4RbGOX+BfAEPEkNfowVahiFY8Veac=;
 h=From:To:Subject:Date:MIME-Version;
 b=Qp9n/Nmf5WSdfvup1k/URqeXSbVCcxnyg+EQRRcHs41wRtwukmX1mJwHdtbYSAMJD
 CJXtcj1YtIdSr9XoGU3pS34bGQzVmTlEBMcSjkzlALZ0XPgUAXAh4UgUYOcdPQHznY
 clhzeDO7HSnBHOv9Oz4Myq2ShVwl0HHLVl34yEEckyzF/g8wX5BKrUa+ls9rL+6E6p
 bZxMi0RnCGH59inT5pjUoromB40CVokaLDCGeL1ETmnRhAvfDEqLe6BkPhcSEgdxpK
 r0Ly2NUDc2BKrGYzPZtn6rHxXiNm7MBHFblMMkjcxY2DAvs1rXOYNtVxjTgvzvZq3a
 /5dlHrNeZh58Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Qp9n/Nmf
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: bump to version
 2023-07-03
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
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version fix build failure on Linux version < 5.15.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ed75b09816..f2de2e04b5 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3545efb56ecba757e1e27a5479653835e3f5be4f5b49eb9e1e4ff87cbeb6e783  rtl8812au-aircrack-ng-35308f4dd73e77fa572c48867cce737449dd8548.tar.gz
+sha256  0dd60b2b6f14ea4639c05e3b4071403a1c37d415538f692e04379591f371a29f  rtl8812au-aircrack-ng-9dc4a4c9a2637df74692542aa01ba63f6fad6f5a.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index a666757449..a27b4353da 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = 35308f4dd73e77fa572c48867cce737449dd8548
+RTL8812AU_AIRCRACK_NG_VERSION = 9dc4a4c9a2637df74692542aa01ba63f6fad6f5a
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
