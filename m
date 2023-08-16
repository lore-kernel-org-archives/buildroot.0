Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38D9C19F4F
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 19:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209B1613F6;
	Wed, 16 Aug 2023 19:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 209B1613F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bvJfZWkriIE0; Wed, 16 Aug 2023 19:59:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63A2C60F72;
	Wed, 16 Aug 2023 19:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63A2C60F72
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 616D51BF239
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 19:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 374F181E79
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 19:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 374F181E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ApbcprqiOAA for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 19:59:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7D7381E6F
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 19:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7D7381E6F
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ADB73A4C0824
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 21:59:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35576)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWMg6-0002X7-1D
 for buildroot@buildroot.org; Wed, 16 Aug 2023 21:59:38 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 16 Aug 2023 21:59:38 +0200
Message-Id: <20230816195938.1352733-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692215978;
 bh=fM7DQgma1gfiptrkjhbTewMCeMtJCDTPohTtubyoltA=;
 h=From:To:Subject:Date:From;
 b=lyjVS4R0bLR/kUjhQ/M8X/PYNjUtlkzk/8jVsJHF5oSlhQakNAOr3AnwD5kWxvUaj
 8msZsB3JK40+nLiC6qr4q6/8WaV0+SZtE3syBMNGj3e7dqWp2SWEX/H0dtKRcY+FlZ
 4THrK1VNWHYpq65Y0iTdOKxscZoSemDG10sVkY3JOF+nK2u0/uU3pypm48Ws+DH0iI
 xDXCb1o36tfCTo99qVsfnLHKMK7zqVi+AP8mIRsIifjRZ3zzUNG3ay5IWLLskOdfTR
 QjRrPEdQCAFfPp6S4yfKh6KvW1iDFcLjMaZRxsppCyMEp8HeG0cchvoLtlFAEl6UTQ
 QhsU4Lya01tUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=lyjVS4R0
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.2.9
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

Changelog: https://www.php.net/ChangeLog-8.php#8.2.9
Release notes: https://www.php.net/releases/8_2_9.php

Fixes CVE-2023-3823 & CVE-2023-3824.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 9fb4aebec1..02cc1e6c7a 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  cfe1055fbcd486de7d3312da6146949aae577365808790af6018205567609801  php-8.2.8.tar.xz
+sha256  1e6cb77f997613864ab3127fbfc6a8c7fdaa89a95e8ed6167617b913b4de4765  php-8.2.9.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 691436926b..836949a917 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.8
+PHP_VERSION = 8.2.9
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
