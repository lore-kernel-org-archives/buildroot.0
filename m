Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D6EC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 857B860A58;
	Mon,  6 May 2024 20:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvRIvWu4hsdM; Mon,  6 May 2024 20:50:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F94E60A6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F94E60A6E;
	Mon,  6 May 2024 20:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F99A1BF3E8
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D26981EFC
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fD79P4Ylrfw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD52A81EF7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD52A81EF7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:50:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B67668693C; Mon,  6 May 2024 20:50:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:45:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e11b804443d4e3bf5cbe447096a888fa825681a4
X-Git-Newrev: ba45833429c5d86a01917f68564ee9e620c771b2
X-Patchwork-Hint: ignore
Message-Id: <20240506205017.B67668693C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php-xdebug: drop
 unrecognized variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba45833429c5d86a01917f68564ee9e620c771b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

--with-xdebug is not recognized since the addition of the package in
commit 7b7dffd0984e1b274273f5638a975165606384f9:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --with-xdebug

Fixes: 7b7dffd0984e1b274273f5638a975165606384f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 98ee9f8b49ebd7aa6d9dc2c726030ec396910f6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
