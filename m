Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C06C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 00:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6564099B;
	Tue,  5 Apr 2022 00:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OB2SImpRnRom; Tue,  5 Apr 2022 00:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE36040991;
	Tue,  5 Apr 2022 00:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3B11BF3C1
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 00:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BBB782612
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 00:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_43nD7GpmLW for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 00:22:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp1.osuosl.org (Postfix) with ESMTP id 942DB825FE
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 00:22:05 +0000 (UTC)
Received: from localhost.localdomain ([146.241.18.114])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bWxPnQngw79nYbWxPnTOnO; Tue, 05 Apr 2022 02:22:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1649118123; bh=I0wsutubtmjge8lzUTRPOTWEFU6rFr1RvkudlPBy+GQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=edNfLKB+mrm3Sp8f9cUBGSRkdVCaARZWKVWKmU2TQMHgVQHRkqCRfnmXav9HrQzOh
 ZEsI4ChZhCoqPfJDZ1jfmq74pKaWjuoGdPTgVVDbrgO8a7492KiQi9NbVXe3KJ+exN
 +LryQY2KxMJRsnVS2jIQwdv1ow+LZgZldkierG8A0iPBVM+c8zO/eNRl7wOcs8y6JU
 bFBWdHjihnUsNs9/fZLyEefORKBc4sjQtxU+AocQMzhDVA8woFn+itM9Jwdh8Hmwfe
 x9UOKiIJpvx4x1MEfdd0Cdfcn3PKQei6S0Vu315EcWhMsfxklBrCO7AcocsxAei/R8
 e0766dOxp6ayA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 02:22:02 +0200
Message-Id: <20220405002202.1772332-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPZUARP53eGswPh76DgXBe1bKFLGaviStOQ7A9mS3qI3fPcQSWPHILdSKv7nHsw8f+j2EJoIItSOjltWJ/jlsa2uXdScMi5F0Or6BmmNM0ZaLVQt0+cz
 drXK8YOyaOf8oSrvOHB6UAnEh+232TGadF0HJ9Rc/wAwwO1SRnpG6108XLAwTVonUS+Wb3WVeNPSW22OHYO21p00DvXHAQ1XDN/z8BMffLKhArXilUW6lkdz
 VE2FCJK64V4ZeNXWYMP6i7Wd2HuQ8/ypc2+4cuz8LMGZohN5Rpc80zZifuuEuzzPfPE3rrboV5FgG5EKR5wPYQ==
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.77
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
index b4b8be11f6..04e81e6b84 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_76_RTM/src/SHA256SUMS
-sha256  1b8e0310add364d2ade40620cde0f1c37f4f00a6999b2d3e7ea8dacda4aa1630  nss-3.76.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_77_RTM/src/SHA256SUMS
+sha256  825edf5a2fd35b788a23ff80face591f82919ae3ad2b8f77d424a450d618dedd  nss-3.77.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2f7a265136..57df104d6c 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.76
+LIBNSS_VERSION = 3.77
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
