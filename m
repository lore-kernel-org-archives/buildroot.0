Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40959C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 17:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBA6C415D0;
	Thu, 26 Oct 2023 17:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBA6C415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_7g1IlcCS4L; Thu, 26 Oct 2023 17:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4546416A4;
	Thu, 26 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4546416A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 385B31BF955
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C68D416A4
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C68D416A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzxuwpoYfMrO for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 17:27:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEDC2415D0
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 17:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEDC2415D0
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EB9EA4C0C29
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 19:27:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57996)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw48X-00058m-0W
 for buildroot@buildroot.org; Thu, 26 Oct 2023 19:27:13 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 19:27:13 +0200
Message-Id: <20231026172713.4147295-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698341233;
 bh=d14Rb2TXdLhEQOPrb8CYBv9DGgdWt7rx09FtDtQ6n7s=;
 h=From:To:Subject:Date:From;
 b=dQrwZGj+JM6DkKi+vT+Nft/2hGGbiftNzS/iE46VVkXIWfWghM7+D1SgTLmKg5A8J
 n6afDT8IllOSZuenkcNOOeqpNVJyksORHrd7CPtVxe8FDtVVir4Wk3GbxCS8H3Lz5b
 9yMs3hgjbmg725ddbdxnvN9J6RAWLRTNbUZzpSvtt2XScqgJKmXc/2Ft3Un8P+D/5j
 UQc+LYD5bwIbcVdQcN4dQgyLdyaMRnMRWSyyBIchStXc2PF3PkSIGF2O4+wUkeUgoE
 zasz1lCXPeiQPEqWqBW2eDZZQXKKdohmZ94oGIXVWsiT+QYpWLT1BqpM1jf7Xkh/+j
 QvXfJKUbZQOeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dQrwZGj+
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.2.12
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

Changelog: https://www.php.net/ChangeLog-8.php#8.2.12
Release notes: https://www.php.net/releases/8_2_12.php

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e5f94a5e05..0f77f0082f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  29af82e4f7509831490552918aad502697453f0869a579ee1b80b08f9112c5b8  php-8.2.11.tar.xz
+sha256  e1526e400bce9f9f9f774603cfac6b72b5e8f89fa66971ebc3cc4e5964083132  php-8.2.12.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ee33000a6f..add46584c6 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.11
+PHP_VERSION = 8.2.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
