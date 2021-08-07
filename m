Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A32C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB7B61078
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BB7B61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53BF883385;
	Sat,  7 Aug 2021 17:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LRGjySS5I-S1; Sat,  7 Aug 2021 17:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6C67831DA;
	Sat,  7 Aug 2021 17:20:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46E4E1BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346694029C
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqbXkGAJLBXk for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3084C40168
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7454E8CA2E; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:06:03 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: ef1feba3b2cbcdcaf03f6c295a23995356aaa704
X-Git-Newrev: e7d7b7aed9814e38e4442a2ac3e1480cdfc5900a
X-Patchwork-Hint: ignore
Message-Id: <20210807171927.7454E8CA2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/neard: update url
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7d7b7aed9814e38e4442a2ac3e1480cdfc5900a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

01.org url is permission denied. There seems to be no project page
anymore. Use kernel.org repo with cleaner https url.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 88556ef3b43b174684b45078e64b3fb15f808a59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neard/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/neard/Config.in b/package/neard/Config.in
index 277e467ced..a60fb3f8f6 100644
--- a/package/neard/Config.in
+++ b/package/neard/Config.in
@@ -13,9 +13,7 @@ config BR2_PACKAGE_NEARD
 	  daemon is a part of the NFC stack provided by the Linux NFC
 	  project.
 
-	  http://git.kernel.org/?p=network/nfc/neard.git;a=summary
-
-	  https://01.org/linux-nfc/
+	  https://git.kernel.org/pub/scm/network/nfc/neard.git
 
 if BR2_PACKAGE_NEARD
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
