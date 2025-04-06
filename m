Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A7DC36002
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 15:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC2140910;
	Sun,  6 Apr 2025 15:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jWekkZkEiQY; Sun,  6 Apr 2025 15:16:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95107408F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95107408F0;
	Sun,  6 Apr 2025 15:16:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B8C9FDA
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98CFE405CC
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L2N0PFDSdgxD for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 15:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C624640ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C624640ADD
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C624640ADD
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 15:16:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 227613530141; Sun,  6 Apr 2025 17:16:53 +0200 (CEST)
Date: Sun, 6 Apr 2025 17:16:53 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Z_Ka5QrOUlcfuPF6@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.1.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1743952613; bh=llBeLFYG5ESihVHPdC75w6Z8Emj6/Arxlr29eXHDx1s=;
 h=Date:From:To:Subject:From;
 b=IakWxtAXDJkAtCso6fAWMIAtdczuZBs1XQHwBOFBUose0pf1CdbUDJk8zrZiO/8w+
 nyXqxbYfOM7Va6XTaoMVDrkTbnx7G73G3edGfWc6RU9v19xZZ9oL/GrUkeuz62CQSt
 gMrIFOvmuwk0Uxyuepj0UWWid6ILUdCV1tAKuWz9DedtJfoCtSoc09KFl7nyCCiA9Y
 mdUOKfNf19LcayM+Xj9iGdU9QjRgMbMbDVAo2xpmey5+wEQgAdlsH7cbTlls2RzFHj
 KYJT5DFH5FlByGqj9rwKaI0+LxWelcX+HP2o7knOGWpYzLFqEVgq1da/vTJj0TLE6s
 pWTea9P65/cpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=IakWxtAX
Subject: [Buildroot] [PATCH] package/uclibc: update to 1.0.52
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See here for release notes:
https://mailman.openadk.org/mailman3/hyperkitty/list/devel@uclibc-ng.org/thread/AGJRU33MT2GMXFNOUDXHISFQIVRYRYXO/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 398a1c04c4..35a4b4b962 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.51/uClibc-ng-1.0.51.tar.xz.sha256
-sha256  3484c8c7a0503c08f7e5fa7473c987414050726f31e8593d02d984f512d1a0cb  uClibc-ng-1.0.51.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.52/uClibc-ng-1.0.52.tar.xz.sha256
+sha256  881da473784f95cc8290bb0780c0afc810ca28d575e33d5afd5e7153b29aa136  uClibc-ng-1.0.52.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 12b597f03b..eb36de8e95 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.51
+UCLIBC_VERSION = 1.0.52
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
