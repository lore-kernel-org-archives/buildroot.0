Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D812C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 19:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145E542972;
	Thu,  6 Jan 2022 19:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_Obcafj3O9K; Thu,  6 Jan 2022 19:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B1CE4296F;
	Thu,  6 Jan 2022 19:10:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2961BF2A9
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76FF26FC25
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 19:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPaoe9ZHd68Y for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 19:10:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2ABF60D93
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 19:10:31 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5Y9enzOD3R1a15Y9en6BI0; Thu, 06 Jan 2022 20:10:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641496230; bh=VgJx9Glz4gHRi15Uqvr0pN2K6/Dg/QslFeg1GBTNIsE=;
 h=From:To:Subject:Date:MIME-Version;
 b=KWzJOBK+uSGWFYD7QX6u4RkbykrHMGhj3eXTxTg77bI/OKFBWuZrow/kyRUWJBE+r
 /TR8yo8eCoWpEmaWVEclW5CsusPEsGiRyyfNcMsNhJ2vnYwWDI8oNoFQzc6xpjiWmX
 TR9Ibm+unWc7+P2g2Syk4AewmE2i7F9/f2QYztKGDT+XrVjScKlNZSOlHje/GRQaoC
 sH8fwteB4z2S2nsj8Rg1x3+uxjdfp8S4Sa6EzjMHQU3OhoxORP+ltmbvgD1cRGVr7E
 6Zzt49q/yq7R9ueTe0c/TU7J8mtrULma4FbvH/3KDOm+eU5Z1+X3spHECsWcfSoZAU
 4t7sajIVrrnoQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 20:10:28 +0100
Message-Id: <20220106191028.146979-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP1bTsHM/jNGBt9B3UTd8cmXiyc5Dshkgyfg0qn/IrIdiN+PygcTbMLEVuJQS6djnjIfRlGLGdnM7opXRZ3LcmpPBVGVMG9BnxSs/vWt9sG8gKp2j482
 lKDlMxAySGa1WGOswp9fpKtmL6E2ZnEqNXjWuCt3vZlg4J6/YyXrsu+joLxQUZkn51K7uMdUYYfwfKIVe/5IyvvHYdmz4/wljBD7cg96BjmnKbyFn4NRzqTY
 oD9QCm9YZpuBW5FnoKQJ8aThg57C+U8ueuo+GeSvI1mxm8LRVTrKvjscoi3STYSl
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.74
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
index 100d2d7870..819c272a30 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_1_RTM/src/SHA256SUMS
-sha256  c768f9fe3129e8bcc2e9679456d7edd9453a225784a8fc7dc4501806f1fe9abe  nss-3.73.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_74_RTM/src/SHA256SUMS
+sha256  88928811f9f40f87d42e2eaccdf6e454562e51486067f2ddbe90aa47ea6cd056  nss-3.74.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index b6279fa921..537f6dd9b6 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.73.1
+LIBNSS_VERSION = 3.74
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
