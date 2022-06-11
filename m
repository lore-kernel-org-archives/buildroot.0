Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20D2C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 13:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED1D4259C;
	Sat, 11 Jun 2022 13:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myj_UrbuHZ7I; Sat, 11 Jun 2022 13:19:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC87F42590;
	Sat, 11 Jun 2022 13:19:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F37E51BF2A5
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE0B411F4
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 13:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-JkfFL7hIDs for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 13:18:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7AAE404F0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 13:18:53 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout06.t-online.de (Postfix) with SMTP id CC3101A153
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 15:18:51 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o010n-0moBE10; Sat, 11 Jun 2022 15:18:45 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:54090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o010n-00061G-29
 for buildroot@buildroot.org; Sat, 11 Jun 2022 15:18:45 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 15:18:42 +0200
Message-Id: <20220611131845.2605483-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654953525-01421A9A-1A569202/0/0 CLEAN NORMAL
X-TOI-MSGID: bd8fa212-9701-44a4-9137-e43bd4201b5f
Subject: [Buildroot] [PATCH 1/4] package/php: remove wddx extension
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

Upstream removed the wddx extension with version 7.4:
https://github.com/php/php-src/commit/6bbb18a0b6bef11222caaa55c00abdbcbb55d54b

and moved it to pecl: https://pecl.php.net/package/wddx

The pecl package is unmaintained however so we do not add it as a new
package to buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       | 8 ++++++++
 package/php/Config.ext | 7 -------
 package/php/php.mk     | 5 -----
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 853a8917be..9d7bdfab10 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2022.08"
+
+config BR2_PACKAGE_PHP_EXT_WDDX
+	bool "php wddx removed"
+	select BR2_LEGACY
+	help
+	  The WDDX extension was removed from php.
+
 comment "Legacy options removed in 2022.05"
 
 config BR2_PACKAGE_KTAP
diff --git a/package/php/Config.ext b/package/php/Config.ext
index 1c2af9fd15..d5f8659016 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -385,13 +385,6 @@ config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 	help
 	  SimpleXML support
 
-config BR2_PACKAGE_PHP_EXT_WDDX
-	bool "WDDX"
-	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_PHP_EXT_LIBXML2
-	help
-	  WDDX support
-
 config BR2_PACKAGE_PHP_EXT_XML
 	bool "XML Parser"
 	select BR2_PACKAGE_PHP_EXT_LIBXML2
diff --git a/package/php/php.mk b/package/php/php.mk
index f649a9bb8b..39db9d3a7c 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -150,11 +150,6 @@ PHP_CONF_OPTS += --with-libxml
 PHP_DEPENDENCIES += libxml2
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_WDDX),y)
-PHP_CONF_OPTS += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
-PHP_DEPENDENCIES += expat
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
 PHP_DEPENDENCIES += libzip
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
