Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CACCCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0910A605CA;
	Wed, 10 Apr 2024 21:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYV3LNTBuLLl; Wed, 10 Apr 2024 21:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0DB060E8D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0DB060E8D;
	Wed, 10 Apr 2024 21:12:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6E561BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF3B60E90
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lmhp4SvlOjnu for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11039605CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11039605CA
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 071A085F2E; Wed, 10 Apr 2024 21:11:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Apr 2024 23:10:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c245b37190f18d1f0551dd95027b2b65fa63e704
X-Git-Newrev: 98ee9f8b49ebd7aa6d9dc2c726030ec396910f6c
X-Patchwork-Hint: ignore
Message-Id: <20240410211159.071A085F2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-xdebug: drop unrecognized
 variable
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=98ee9f8b49ebd7aa6d9dc2c726030ec396910f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-xdebug is not recognized since the addition of the package in
commit 7b7dffd0984e1b274273f5638a975165606384f9:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --with-xdebug

Fixes: 7b7dffd0984e1b274273f5638a975165606384f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-xdebug/php-xdebug.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index c5a1e10ebc..62ef3fa997 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -14,8 +14,7 @@ PHP_XDEBUG_LICENSE_FILES = LICENSE
 PHP_XDEBUG_DEPENDENCIES = php host-autoconf
 PHP_XDEBUG_CONF_OPTS = \
 	--enable-xdebug \
-	--with-php-config=$(STAGING_DIR)/usr/bin/php-config \
-	--with-xdebug=$(STAGING_DIR)/usr
+	--with-php-config=$(STAGING_DIR)/usr/bin/php-config
 
 define PHP_XDEBUG_PHPIZE
 	(cd $(@D); \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
