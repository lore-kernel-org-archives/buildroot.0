Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002A3C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BB460F42
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89BB460F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529FF60788;
	Mon, 26 Jul 2021 05:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmcojeQ30WDh; Mon, 26 Jul 2021 05:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3E86060E;
	Mon, 26 Jul 2021 05:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65A171BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 553EA40133
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:55:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2z2nahtrFkdI for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23A584012F
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 05:55:01 +0000 (UTC)
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout02.t-online.de (Postfix) with SMTP id 4B5B614CF7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 07:54:16 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (ECOY8kZUohpGaNIsSNh3OPKxK8ZMKeiSio5ndYsRLpvmo2ae0e-XLAXiXd97Hc3Zcf@[91.58.13.189])
 by fwd21.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m7tZ8-15q85Q0; Mon, 26 Jul 2021 07:54:14 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:38016)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1m7tZ7-0007Ls-GE
 for buildroot@buildroot.org; Mon, 26 Jul 2021 07:54:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 07:54:13 +0200
Message-Id: <20210726055413.209564-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: ECOY8kZUohpGaNIsSNh3OPKxK8ZMKeiSio5ndYsRLpvmo2ae0e-XLAXiXd97Hc3Zcf
X-TOI-EXPURGATEID: 150726::1627278854-00002A54-942D9700/0/0 CLEAN NORMAL
X-TOI-MSGID: 9dfea096-5345-4a9b-9987-ae1d5d9f42fb
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.0.8
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Changelog: https://www.php.net/ChangeLog-8.php#8.0.8

Fixes CVE-2021-21704 & CVE-2021-217045.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index b1cb8f045e..46015ca2fb 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  d5fc2e4fc780a32404d88c360e3e0009bc725d936459668e9c2ac992f2d83654  php-8.0.7.tar.xz
+sha256  dc1668d324232dec1d05175ec752dade92d29bb3004275118bc3f7fc7cbfbb1c  php-8.0.8.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index af0b073d84..968c43854e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.7
+PHP_VERSION = 8.0.8
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
