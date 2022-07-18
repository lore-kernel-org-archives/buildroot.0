Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD8FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 07:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EA4C40298;
	Mon, 18 Jul 2022 07:14:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EA4C40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKEfOivF_rpS; Mon, 18 Jul 2022 07:14:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CA1A40162;
	Mon, 18 Jul 2022 07:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA1A40162
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF1661BF30E
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 07:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA74282FC9
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 07:14:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA74282FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T24hN2zFw-Hj for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 07:14:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E58B082FA5
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 07:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E58B082FA5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 00CA883C0D; Mon, 18 Jul 2022 07:01:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 09:12:01 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6832b9b28398e64c34bd5522fadacd42a9c57ab7
X-Git-Newrev: c46c686e9fc6ccd04baa2a59c3e91cfd171c38fc
X-Patchwork-Hint: ignore
Message-Id: <20220718070110.00CA883C0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/php: remove wddx
 extension
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c46c686e9fc6ccd04baa2a59c3e91cfd171c38fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Upstream removed the wddx extension with version 7.4:
https://github.com/php/php-src/commit/6bbb18a0b6bef11222caaa55c00abdbcbb55d54b

and moved it to pecl: https://pecl.php.net/package/wddx

The pecl package is unmaintained however so we do not add it as a new
package to buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 07044207ed610d3f26deaeddff4749140ad8ec75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy       | 6 ++++++
 package/php/Config.ext | 7 -------
 package/php/php.mk     | 5 -----
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6724865232..97d6197aeb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PHP_EXT_WDDX
+	bool "php wddx removed"
+	select BR2_LEGACY
+	help
+	  The WDDX extension was removed from php.
+
 config BR2_sh2a
 	bool "sh2a architecture support removed"
 	select BR2_LEGACY
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
