Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319E5C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE9C480E70;
	Sun, 18 May 2025 17:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxhhO3Qxgl0G; Sun, 18 May 2025 17:41:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29DAD80ED9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29DAD80ED9;
	Sun, 18 May 2025 17:41:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B579B1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ADA84077C
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALCJbkFCWDNZ for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE40D4076A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE40D4076A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE40D4076A
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:41:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4978A4C13B8
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:40:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35504)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGi0Q-000000002vc-0mPP
 for buildroot@buildroot.org; Sun, 18 May 2025 17:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:40:58 +0200
Message-Id: <20250518174058.2148313-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747590058;
 bh=Q3tMymuaICX3wvlQLMA8sWwe2EL5eGi7dx+ro9Nz9cc=;
 h=From:To:Subject:Date:From;
 b=GsWzTF0bzVye8UXjdHbvlA2sTbyjusXA0Bg7Toth98np+JlppQ8jCdps3hAHFCgjo
 7K0PbRvHwu/sQpMD5qmKvsWX9Zc3rzk1bLY9WcoCsUtq3I7t88fu2MlMROuqZVy8gX
 QWyuNb1w3IFNGTZN1skIT+qxRhZClEUSAwEOE+k6CUDSstZpvB5E7sePOvDwg6pKXh
 I8PlKtl/j7zT+KLLST+Lu2i9lal6QGwxx/Sr5lXinhzj8HV+9YGfpaU04E6q7HuFKx
 eFqcFNY8qI0hrBB6U+xf+N1QrlJk2F/hMkqktWHXRnO4W8mw0zigKBVvodtvtpBXuh
 mHYqFIlPnWVww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=GsWzTF0b
Subject: [Buildroot] [PATCH 1/1] package/libheif: security bump version to
 1.19.8
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

Release notes: https://github.com/strukturag/libheif/releases

Version 1.19.6 fixes CVE-2025-43966 & CVE-2025-43967:
https://github.com/strukturag/libheif/releases/tag/v1.19.6

Updated license hash due to upstream commit:
https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 26b21e1897..99426ee8d0 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c4002a622bec9f519f29d84bfdc6024e33fd67953a5fb4dc2c2f11f67d5e45bf  libheif-1.18.2.tar.gz
-sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
+sha256  6c4a5b08e6eae66d199977468859dea3b5e059081db8928f7c7c16e53836c906  libheif-1.19.8.tar.gz
+sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 4783ada19e..1764671a39 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.18.2
+LIBHEIF_VERSION = 1.19.8
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
