Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842EFC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4C46111F;
	Wed,  8 Feb 2023 18:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4C46111F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFpvj4xUqB4D; Wed,  8 Feb 2023 18:19:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C8F61170;
	Wed,  8 Feb 2023 18:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18C8F61170
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 717AD1BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C6FC40C7B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C6FC40C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EVNxByBVhb3Z for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:19:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A81BD40184
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A81BD40184
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:19:46 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C0A9C240009;
 Wed,  8 Feb 2023 18:19:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPp2g-00GT9v-EU; Wed, 08 Feb 2023 19:19:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:19:29 +0100
Message-Id: <20230208181933.3925279-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208181933.3925279-1-peter@korsgaard.com>
References: <20230208181933.3925279-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/aubio: drop AUBIO_REMOVE_OLD_WAF
 hook
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As that is now handled by the waf-package infrastructure.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aubio/aubio.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index c995fdfac7..64174a113d 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -21,12 +21,6 @@ AUBIO_CONF_OPTS = \
 # https://github.com/jackaudio/jack2/issues/898
 AUBIO_NEEDS_EXTERNAL_WAF = YES
 
-# The old waf script bundled in aubio 0.4.9 need to be removed first.
-define AUBIO_REMOVE_OLD_WAF
-	$(RM) -fr $(@D)/waf $(@D)/waflib
-endef
-AUBIO_POST_EXTRACT_HOOKS = AUBIO_REMOVE_OLD_WAF
-
 # Add --notests for each build step to avoid running unit tests on the
 # build machine.
 AUBIO_WAF_OPTS = --notests
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
