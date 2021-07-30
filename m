Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255C9C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 05:42:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A888760F48
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 05:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A888760F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FB3840335;
	Fri, 30 Jul 2021 05:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYzwVIMOSE8K; Fri, 30 Jul 2021 05:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57E67401B3;
	Fri, 30 Jul 2021 05:42:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFDC81BF3D8
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 05:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8DEC401B3
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 05:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DbAWdMkwKr4 for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 05:42:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 030A4400F8
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 05:42:44 +0000 (UTC)
Received: from fwd00.aul.t-online.de (fwd00.aul.t-online.de [172.20.26.147])
 by mailout05.t-online.de (Postfix) with SMTP id 47D59ABB0
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 07:42:41 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (V+iHqQZFZhuQoA2jFX3uP7L+X0uL-+igXDg27P+rM9evovrrjTShg8bufzI5ZjaQ5T@[79.214.207.209])
 by fwd00.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m9LHw-2Hsxay0; Fri, 30 Jul 2021 07:42:28 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:41728)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1m9LHw-0005fM-07
 for buildroot@buildroot.org; Fri, 30 Jul 2021 07:42:28 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 07:42:27 +0200
Message-Id: <20210730054227.12988-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: V+iHqQZFZhuQoA2jFX3uP7L+X0uL-+igXDg27P+rM9evovrrjTShg8bufzI5ZjaQ5T
X-TOI-EXPURGATEID: 150726::1627623748-00010D54-B756AD58/0/0 CLEAN NORMAL
X-TOI-MSGID: 69599857-1127-4fd9-bd44-b33e0c4b4d99
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.0.9
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

Changelog: https://www.php.net/ChangeLog-8.php#8.0.9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 46015ca2fb..1a1698eb9b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  dc1668d324232dec1d05175ec752dade92d29bb3004275118bc3f7fc7cbfbb1c  php-8.0.8.tar.xz
+sha256  71a01b2b56544e20e28696ad5b366e431a0984eaa39aa5e35426a4843e172010  php-8.0.9.tar.xz
 
 # License file
 sha256  a188db807d711536f71e27b7d36879d63480f7994dc18adc08e624b3c5430fff  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 968c43854e..6780b6a962 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.0.8
+PHP_VERSION = 8.0.9
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
