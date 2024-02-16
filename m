Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEFCC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A0160E60;
	Fri, 16 Feb 2024 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOoOCA9lHUqA; Fri, 16 Feb 2024 20:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3043661160
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3043661160;
	Fri, 16 Feb 2024 20:59:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13F071BF284
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00FD984089
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDCzdqfMb3dl for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 20:59:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8ED4D81F19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED4D81F19
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8ED4D81F19
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 20:59:07 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b5IWrQaBZuLAqb5IXrmUlV; Fri, 16 Feb 2024 21:59:05 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 21:59:04 +0100
Message-Id: <20240216205904.242339-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDAW5LyyOTFIappxajILyK/5Ngl/LX+OQFVdiEUav9e6vqfdn4bq+sQsixVSwe4Fuag8KUdjyFZTO12+NX7L4HjwT+v7Z1ZTMXSaIGIKbmhm0z1J7ULK
 fWuKgraoYcmRfUsp31DFUiFMnoMyQyU/1n6TmCdM4BCMnsoc9n2biASGW3MJEyMbCFLTQ7uRPXp/c68DxyuA/0wO7kb98o33d3Zmf1Yf7NMmwhBJFKldgT8a
 LS+wtmdw3DfMkhHb5cW6t8OSmK3fVe5Q4P2ys6a8t6K29BaoEoedK+/CY3dM1PwXXFzr+Pbzeyxib1XN7aC/WQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708117145; bh=J22zgCYz55cBKuxc98BKf1CzNEHXUcJiPtkaAqgANXU=;
 h=From:To:Subject:Date:MIME-Version;
 b=gsDZC49YQqNNcL7664su42cSP3aN3nCNup4Yin5Y3sLauWAwrLP1Pi75LTE3bB9kB
 zCKu/EC5AdvDMPZJaTYcMw7acjuulTnlt9anKsn7VEm0Rjg/q020icDOQLG5qSk6vi
 hp4Kikc9I+IfBj6f/6Tt74CAiIR3UZTTpdYRLGZ7Qh0yx5dSp84t8sISALihZVlUhA
 xAuIcGmQ1ClOb+TjysvQnCpTZWIwXproLdfiGaUMtkZxnENq2VIGkR10Imn3BhYKi4
 8RUDL92RWVjqJO6PW+9Z7MvNeVuZ+EQHM+bTnQDfzHw2f0xRSpQlKN5YImy+9QcIrp
 qiH+lLYLKGNAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gsDZC49Y
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.98
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
index fdfe9773d2..51701724ed 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_97_RTM/src/SHA256SUMS
-sha256  078efb8393f32e40b1fb4bf6930fff7f1aabed01287fcc5fe58aba736765fa0a  nss-3.97.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_98_RTM/src/SHA256SUMS
+sha256  f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce  nss-3.98.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 60a33456b0..90e66ca885 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.97
+LIBNSS_VERSION = 3.98
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
