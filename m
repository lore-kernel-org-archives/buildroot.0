Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86386CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 10:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52FCC81AC1;
	Sat, 30 May 2026 10:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWFFu5xqPNG9; Sat, 30 May 2026 10:09:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81E37812E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780135789;
	bh=lt7lxYgQucWEo7uK6b0R8d6RCwJsKfvCELenbdQTz2Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c4i/bxfgUmL9rjH5e9ky+PgPIrv3hN2JcETCI0KhS0Rk81fwq+U+bR1e9vQykPCZQ
	 qGJJKCBhMxYDq5AeMj8K0mshZUL3avt3Pm2ec3Fqctsf59C4BlsnvtzglSHi2x/tvj
	 lnT0SafzEI5E2OPK1oma+w3FhCejGBZT5zu38VMchm1C8GB4vCN2KHOkfeyZd8ijvS
	 KxvuHfSOY7tSTfWYyrIIQrrfP2LpDnV1ah96S+NJaPi7lDu5MF0Js9xSQitKW/F/gb
	 msPwZPEfBtgP1yhG/8qA023QCOjHE5QStmnjJaNmYUSRNrtHOvIxUU7rQrAMP3y3dy
	 qOpxBsvwMF9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E37812E8;
	Sat, 30 May 2026 10:09:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BD4612F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1099812E8
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eORv8J2mJnEw for <buildroot@buildroot.org>;
 Sat, 30 May 2026 10:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C6B812A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45C6B812A1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48AD8870BC; Sat, 30 May 2026 10:09:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:59:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0540ff5317db497510a6b5beec0e406d09373cf
X-Git-Newrev: d22ff1628f4d0ba2ae6f24515e1a87fd3649a18d
X-Patchwork-Hint: ignore
Message-Id: <20260530100934.48AD8870BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: drop outdated comment about
 git tags format
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d22ff1628f4d0ba2ae6f24515e1a87fd3649a18d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 5bf0db998b ("package/icu: bump version to 78.1") dropped the
dash-to-dot conversion logic as upstream now uses dots in the tags names
(E.G.  release-78.1), but forgot to drop the comment explaining why we were
doing the conversion - So drop the now outdated comment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/icu/icu.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index ee1ede6f2c..9b97011f55 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -4,9 +4,6 @@
 #
 ################################################################################
 
-# Git tags (and therefore versions on release-monitoring.org) use the
-# XX-Y format, but the tarballs are named XX_Y and the containing
-# directories XX.Y.
 ICU_VERSION = 78.2
 ICU_SOURCE = icu4c-$(ICU_VERSION)-sources.tgz
 ICU_SITE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
