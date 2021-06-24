Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2715AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E505B60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E505B60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0F004051D;
	Tue,  3 Aug 2021 23:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0zDZwb75_tR; Tue,  3 Aug 2021 23:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EDF4404A8;
	Tue,  3 Aug 2021 23:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 576AD1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23D0540695
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfwM0f1ACx52 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06E940669
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 43AB88827E; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 24 Jun 2021 13:55:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f42a500e41ff294aaed3800b159d0cc4b966d999
X-Git-Newrev: d1a445621e8f2f5b96e7814e152bf8b237ea28a5
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.43AB88827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tor: security bump
 version to 0.4.5.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1a445621e8f2f5b96e7814e152bf8b237ea28a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://blog.torproject.org/node/2041

Fixes CVE-2021-34548 (TROVE-2021-003), TROVE-2021-004, CVE-2021-34549
(TROVE-2021-005) & CVE-2021-34550 (TROVE-2021-006).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dd20bbc92e..8622281c2c 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  57ded091e8bcdcebb0013fe7ef4a4439827cb169358c7874fd05fa00d813e227  tor-0.4.5.8.tar.gz
+sha256  f304e456102ed26c39e5f16ece2115585398cdb4e67455139c86ea43cdf70856  tor-0.4.5.9.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4a16967d42..e7e791a10a 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.8
+TOR_VERSION = 0.4.5.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
