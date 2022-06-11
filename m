Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFFFC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C5B42591;
	Sat, 11 Jun 2022 13:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSwwSkUSd8TE; Sat, 11 Jun 2022 13:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643C142588;
	Sat, 11 Jun 2022 13:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A30241BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB3F42588
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMpQ2xNMm1Cy for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 216E2419CD
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:18:50 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout11.t-online.de (Postfix) with SMTP id 3057F9311
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 15:18:48 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o010n-2En1ST0; Sat, 11 Jun 2022 15:18:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o010n-00061G-47
 for buildroot@buildroot.org; Sat, 11 Jun 2022 15:18:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:18:43 +0200
Message-Id: <20220611131845.2605483-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
References: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654953525-0142618F-631C5A98/0/0 CLEAN NORMAL
X-TOI-MSGID: e90cb257-29df-485c-9f31-381c99f26fa2
Subject: [Buildroot] [PATCH 2/4] package/php: simplify icu configure options
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

Since php-7.4 upstream switched to pkg-config to detect icu:
https://github.com/php/php-src/commit/20fa2e7b58c519cc148d9658456b695884b1ecf4

Remove all unneeded code from php.mk.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/php/php.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 39db9d3a7c..d9c2edd839 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -176,13 +176,8 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
-PHP_CONF_OPTS += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
-PHP_CXXFLAGS += "`$(STAGING_DIR)/usr/bin/icu-config --cxxflags`"
+PHP_CONF_OPTS += --enable-intl
 PHP_DEPENDENCIES += icu
-# The intl module is implemented in C++, but PHP fails to use
-# g++ as the compiler for the final link. As a workaround,
-# tell it to link libstdc++.
-PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
