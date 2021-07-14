Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31856C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE14460FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE14460FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2DD460A94;
	Tue,  3 Aug 2021 23:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXRsbp667i7D; Tue,  3 Aug 2021 23:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2098B60A3F;
	Tue,  3 Aug 2021 23:28:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D337D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DCF640E9E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLOpq7NCao4T for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D7E540E53
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D36A582A39; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 14 Jul 2021 10:28:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc0964504380960e4b26464cd9319ddb7046232d
X-Git-Newrev: 3fbeabd62012b5ce14dca2fcb9b6cf2d20419af0
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.D36A582A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8189fs: correct hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=3fbeabd62012b5ce14dca2fcb9b6cf2d20419af0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

While fixing up the spaces in the hash file of rtl8189fs in commit
5b88a0a57a9a590427d03719777c46f7ea5a6c43, Arnout accidentally removed a
digit of the hash. Fix that.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1422093322

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index ef040763a7..f42799b48e 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
+sha256  7d425e18ebc427b3df5ff31185b4dc29c6bfd54f8e167f57c2254cea341a26c6  rtl8189fs-62c31d577c385316bb99107f60e63169dacc37db.tar.gz
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
