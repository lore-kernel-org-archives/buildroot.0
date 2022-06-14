Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B33CCA47A
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 18:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7CE8831DA;
	Tue, 14 Jun 2022 18:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tIS2CaAdexgg; Tue, 14 Jun 2022 18:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D98DD828DF;
	Tue, 14 Jun 2022 18:49:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24A1F1BF306
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3CD140A02
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 18:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pIy6Bo0dJFWz for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4C6740E46
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:48:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B30DA870DF; Tue, 14 Jun 2022 18:36:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 20:10:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d0c0f1a431de6b5066f7362b119963c8ac4be9e
X-Git-Newrev: 07044207ed610d3f26deaeddff4749140ad8ec75
X-Patchwork-Hint: ignore
Message-Id: <20220614183634.B30DA870DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: remove wddx extension
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

commit: https://git.buildroot.net/buildroot/commit/?id=07044207ed610d3f26deaeddff4749140ad8ec75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed the wddx extension with version 7.4:
https://github.com/php/php-src/commit/6bbb18a0b6bef11222caaa55c00abdbcbb55d54b

and moved it to pecl: https://pecl.php.net/package/wddx

The pecl package is unmaintained however so we do not add it as a new
package to buildroot.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
