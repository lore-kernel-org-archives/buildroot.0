Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AE2EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D1D640BE2;
	Mon, 21 Aug 2023 20:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D1D640BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIPTHpgJaXOG; Mon, 21 Aug 2023 20:07:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7349C40BDA;
	Mon, 21 Aug 2023 20:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7349C40BDA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743051BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12E1C81D21
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E1C81D21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbDHfDrh-th0 for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F2D81AC1
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52F2D81AC1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4317486028; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 19:21:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd5a01eee30404d95fc442eaf6a017b2754b4a37
X-Git-Newrev: 503cfb40c74bcb8bd6be9bcd977c9dbd1b22d0ed
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.4317486028@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/composer: add
 COMPOSER_CPE_ID_VENDOR
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
Content-Type: multipart/mixed; boundary="===============3944171973283789273=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3944171973283789273==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=503cfb40c74bcb8bd6be9bcd977c9dbd1b22d0ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:getcomposer:composer is a valid identifier for
this package:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=getcomposer

Signed-off-by: Clément Ramirez <clement.ramirez@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/composer/composer.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index fde5b48951..9bfabc28af 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -13,6 +13,7 @@ BASE_SITE = https://getcomposer.org/download/$(COMPOSER_VERSION)/composer.phar
 COMPOSER_SITE = $(BASE_SITE)?n=f/$(COMPOSER_SOURCE)
 COMPOSER_LICENSE = MIT
 COMPOSER_LICENSE_FILES = LICENSE
+COMPOSER_CPE_ID_VENDOR = getcomposer
 
 HOST_COMPOSER_DEPENDENCIES = host-php
 HOST_COMPOSER_EXTRACT_DEPENDENCIES = host-php

--===============3944171973283789273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3944171973283789273==--
