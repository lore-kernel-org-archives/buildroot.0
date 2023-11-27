Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C0C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9130B8184F;
	Mon, 27 Nov 2023 18:58:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9130B8184F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JjrkBZWnNv47; Mon, 27 Nov 2023 18:58:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03D1A81842;
	Mon, 27 Nov 2023 18:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03D1A81842
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A572E1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79E5560F35
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79E5560F35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAuwuzf2-ppB for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:58:12 +0000 (UTC)
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3F5560F34
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3F5560F34
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 7go5rYTEstiKZ7go5rbsUF; Mon, 27 Nov 2023 19:58:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 19:51:06 +0100
Message-Id: <20231127185106.2390761-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAA+mRwp82ojATkjc4uvsIuC54iUmANITR32/mSzhAFXyfUzLi9rAYej6b9mB7u/oMEVnBseycFRQTnL56nFDIBGH08qcWE9u+FO2llXHE2EbabhQFCy
 hgc59L0nnWz0h6++qQAkTtZT26cgADAFM4eSmYUVM1mZ3CGgPiUCKfeCoEtVhMDYawO13PM1ANRCr4IbajQFAypq9iu0gBBkAJZ8QFvc19u58Pc9GAm9OPtK
 V4OWlwHRQyZlriqFJAYounqZsnnJWXTMOpESQrpnbOXanxwevvz7LBrWYBjUdoZ8h2XSKH0lFL12Nersprt5lg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1701111489; bh=7EmS7sTwG12nt+A4c/mJoODwbJflBebM7Yo07G3KEHY=;
 h=From:To:Subject:Date:MIME-Version;
 b=BTOdx5qwDQ/U2tRfBDzVcAb9DM4D1EbOIyUlyyRb6nMezdGf0t6YvLl0Sqslm02Rj
 UZ495WaPG1izk3vK6IaGT/SmoQ2My/GWo+46Ut4kRtB92LsSmU6O+cdguZCdcZwO2e
 IK2YLOKEkksz8jT7fkORoM1BjrgIOZRRyjyl0pFTEl5D+Qamh/LUbWWFCL5cCQJl+V
 gbXY0WrSFE4eKp2d9aiZlJQ4uzAaykDBH1WqnqSG1jG1idLeUenxCn0t6L7tz00+l2
 uJVDus32Rji24mbY1a6lqVmRBjhmobVCHK9D6ac2c6QISybnNpUDlSge10FfKAhM/A
 Vt291nzxDQXBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BTOdx5qw
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.95
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
index 50889f8d13..046f0efcca 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_94_RTM/src/SHA256SUMS
-sha256  463ae180ee9e5ee9e3ad4f629326657e236780cc865572a930a16520abad9dd8  nss-3.94.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_95_RTM/src/SHA256SUMS
+sha256  469888e41e8a780051ce00edcd914e8a6bd38da88a82cfb84898dd388635822a  nss-3.95.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 51694c77bf..43645e26fc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.94
+LIBNSS_VERSION = 3.95
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
