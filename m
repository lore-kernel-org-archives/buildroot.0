Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCE0C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E2B760A46;
	Mon,  6 May 2024 20:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP4ZUr-ye1Vr; Mon,  6 May 2024 20:50:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D667D60A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D667D60A5E;
	Mon,  6 May 2024 20:50:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B285F1BF947
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A653A81EFC
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQfuOZorFjtF for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64C581EF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D64C581EF9
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:50:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C23ED8693D; Mon,  6 May 2024 20:50:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:45:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ba45833429c5d86a01917f68564ee9e620c771b2
X-Git-Newrev: 71e6b2765b0fec5cd55aab2fc2907d076a92ec17
X-Patchwork-Hint: ignore
Message-Id: <20240506205017.C23ED8693D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/php-xdebug: add
 zlib optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=71e6b2765b0fec5cd55aab2fc2907d076a92ec17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

zlib is an optional dependency (enabled by default) since bump to
version 3.2.0 in commit 8280400fbadde09e51ccff312d7a4ef6a386f589 and
https://github.com/xdebug/xdebug/commit/3954e5cd9e48eec0a8a2a0c6a2fc120bbe562656

Fixes: 8280400fbadde09e51ccff312d7a4ef6a386f589

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4b7aeee28ed2f62370084dac4a92bdef89046b41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-xdebug/php-xdebug.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 62ef3fa997..3bc197e556 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -25,4 +25,11 @@ endef
 
 PHP_XDEBUG_PRE_CONFIGURE_HOOKS += PHP_XDEBUG_PHPIZE
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PHP_XDEBUG_CONF_OPTS += --with-xdebug-compression
+PHP_XDEBUG_DEPENDENCIES += zlib
+else
+PHP_XDEBUG_CONF_OPTS += --without-xdebug-compression
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
