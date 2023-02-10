Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71600C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12EAD419CB;
	Fri, 10 Feb 2023 14:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12EAD419CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G5q52AHkehz2; Fri, 10 Feb 2023 14:15:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2893419C3;
	Fri, 10 Feb 2023 14:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2893419C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A0F631BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C38B41144
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C38B41144
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECXt8GEQpttz for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CB6400D1
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0CB6400D1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F5C384E86; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:10:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b4d7f6e13212b4c65ec2832681719fd960e75e6
X-Git-Newrev: c4543911494b2a485f159eae21bb703b676ec2c9
X-Patchwork-Hint: ignore
Message-Id: <20230210141450.9F5C384E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aubio: drop AUBIO_REMOVE_OLD_WAF
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4543911494b2a485f159eae21bb703b676ec2c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As that is now handled by the waf-package infrastructure.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
