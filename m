Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7084BC43219
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:25:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522AB61268
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 17:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 522AB61268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB6F360B4F;
	Thu, 11 Nov 2021 17:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJYde3L7eonu; Thu, 11 Nov 2021 17:25:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 559E0606D9;
	Thu, 11 Nov 2021 17:25:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2B06C1BF327
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B39281B25
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 17:25:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYoDPGTAcwOg for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 17:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A1D281B17
 for <buildroot@busybox.net>; Thu, 11 Nov 2021 17:25:03 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 2AD07440F32;
 Thu, 11 Nov 2021 19:24:44 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636651484;
 bh=mQ6XWeAE87Zmsw6u9tgvWzm04OdUYN/2muCYkz+tgRI=;
 h=From:To:Cc:Subject:Date:From;
 b=D/acDcc7jurT/Y+MeUY7UY89awPpooko1Ei9YP9gWiuoWN+3jU0Vg8Luj5wyjGggN
 Cg79y3tVXu9G/3D6RdwXQZUzHK6DhXUkvBZwIpFMzJyGznvHFCcw/yzga3ctNG+uUt
 fU1kK1Ft+YRdtKYdBLWVcxW7UXtipgZ9jrvpSsYx+y6GajLslBNubUTX9yuY/sVSfn
 RkOYz93t74frkwjoFMKE1L6Xzf7jkMrg4/TVpV/3sWLwTR7h95IsNDUEzYv/B5PGI0
 6j7F85X44utXNa9HBGdqFOXMPDITxL+AyHov3jfuqpTYLEKei10Tv6dbexuhbp2MV2
 LZmPLyMKcu7Ew==
To: buildroot@busybox.net
Date: Thu, 11 Nov 2021 19:24:53 +0200
Message-Id: <adb044a298649c2beb804cb69f0ae85004a9872f.1636651493.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libcurl: bump to version 7.80.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index b13f01c87424..c488df57b145 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-7.79.1.tar.xz.asc
+# https://curl.se/download/curl-7.80.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  0606f74b1182ab732a17c11613cbbaf7084f2e6cca432642d0e3ad7c224c3689  curl-7.79.1.tar.xz
+sha256  a132bd93188b938771135ac7c1f3ac1d3ce507c1fcbef8c471397639214ae2ab  curl-7.80.0.tar.xz
 sha256  6fd1a1c008b5ef4c4741dd188c3f8af6944c14c25afa881eb064f98fb98358e7  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index a70ebe411351..24591f2e0ac6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.79.1
+LIBCURL_VERSION = 7.80.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
