Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D49DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E10B60724
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E10B60724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE44400C3;
	Tue,  3 Aug 2021 21:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPoFl0bQkHxS; Tue,  3 Aug 2021 21:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8FC4404A8;
	Tue,  3 Aug 2021 21:53:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6532B1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FA040249
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uUjob0dqubHf for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF15A40235
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4501B87B09; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 21:56:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f891c2e41616bacf215c49329146ef9981ea4ca
X-Git-Newrev: a4b5622a34ce89eae23005801ff60833145b60ac
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.4501B87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/php-memcached: bump
 version to 3.1.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a4b5622a34ce89eae23005801ff60833145b60ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/php-memcached/php-memcached.hash | 8 ++++----
 package/php-memcached/php-memcached.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/php-memcached/php-memcached.hash b/package/php-memcached/php-memcached.hash
index dd294f466a..7e918c17f6 100644
--- a/package/php-memcached/php-memcached.hash
+++ b/package/php-memcached/php-memcached.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 20786213ff92cd7ebdb0d0ac10dde1e9580a2f84296618b666654fd76ea307d4  memcached-3.1.3.tgz
-sha256 24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
-sha256 a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
-sha256 bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
+sha256  b288e45f839593e16c4d8508b241de51a86df4f7322153e6becb9e1c819021fd  memcached-3.1.5.tgz
+sha256  24e8e3a9529204ead9422fa17cf3ddd75d292a8763b87fdb20591964f2e6ebe0  LICENSE
+sha256  a453a7a272fbd24105b39959f76996d50dad80b22d1c310f6c67f74f62ae4054  fastlz/LICENSE
+sha256  bba8cb50c660842c5ca459c5004395bdef8f01c1b64f97a9978f1053f173cb82  g_fmt.h
diff --git a/package/php-memcached/php-memcached.mk b/package/php-memcached/php-memcached.mk
index 4607d099f3..068fbb786b 100644
--- a/package/php-memcached/php-memcached.mk
+++ b/package/php-memcached/php-memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_MEMCACHED_VERSION = 3.1.3
+PHP_MEMCACHED_VERSION = 3.1.5
 PHP_MEMCACHED_SOURCE = memcached-$(PHP_MEMCACHED_VERSION).tgz
 PHP_MEMCACHED_SITE = https://pecl.php.net/get
 PHP_MEMCACHED_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
