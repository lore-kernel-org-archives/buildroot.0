Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7383E732FD
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 17:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8259542221;
	Thu, 28 Sep 2023 17:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8259542221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRrx04oW3EGO; Thu, 28 Sep 2023 17:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92F6C42222;
	Thu, 28 Sep 2023 17:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92F6C42222
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 577AF1BF255
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32341827D9
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 17:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32341827D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BaKMrOVR7U-b for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 17:26:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD7DA82393
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 17:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD7DA82393
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9F0AA4C0AFB
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 19:26:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53364)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qlum6-0006bZ-1f
 for buildroot@buildroot.org; Thu, 28 Sep 2023 19:26:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 19:26:06 +0200
Message-Id: <20230928172606.222711-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695921966;
 bh=5oXR9k6ZGWnGl+qmmUO5lymXphpu5W+W5GzwsL/ukjE=;
 h=From:To:Subject:Date:From;
 b=fIEO+45+bRh3GYjek4rckJPRWHim5rcnGSM02PdekUPhb7NoClCEQ8WN1ViyHNKiR
 YFIQLo9uDIyslY4pBa9vwC0IGz7dJ6lGN26pZ0FXBMYqxElZehBahGL6nAHVJ3TxWU
 a4LGDo0lDx69mU3u/S/DbtN4QScNSx0qWQp+NlneQhtU52s5oJ80wxvc9mfODW0JkK
 tX2d3SSgVUXdIfjTthwB0+sQSIlmyFYisfFD/jHOiwAgoNwmmC1uxNXA4rRjhSa9QO
 Fd8ioRLdpNAyGrWaKNYPDQ/x3Pu5tZF4ojhW0G58RCMZGT1G3lMZJYlKCHBzhpTK84
 BRuLmb4QfzA0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fIEO+45+
Subject: [Buildroot] [PATCH] package/php: bump version to 8.2.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://www.php.net/ChangeLog-8.php#8.2.11
Release notes: https://www.php.net/releases/8_2_11.php

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index b8ff7ccc5c..e5f94a5e05 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  561dc4acd5386e47f25be76f2c8df6ae854756469159248313bcf276e282fbb3  php-8.2.10.tar.xz
+sha256  29af82e4f7509831490552918aad502697453f0869a579ee1b80b08f9112c5b8  php-8.2.11.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ede0980629..ee33000a6f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.10
+PHP_VERSION = 8.2.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
