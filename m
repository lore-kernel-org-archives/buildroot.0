Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB45CC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E096101C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56E096101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13E3140180;
	Sat,  7 Aug 2021 17:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nPN5RGe99ASz; Sat,  7 Aug 2021 17:19:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2414540168;
	Sat,  7 Aug 2021 17:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 380561BF964
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34AEB81BC2
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4E38v91Hpexg for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D1EB81BB2
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:19:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B9F158C9A8; Sat,  7 Aug 2021 17:19:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 19:05:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 5237d62e255ea13e978bd639ccc8cee5ae0218aa
X-Git-Newrev: 673fa600ac3951fd488be069a14d28795bb33b4c
X-Patchwork-Hint: ignore
Message-Id: <20210807171910.B9F158C9A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/neard: update url
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

commit: https://git.buildroot.net/buildroot/commit/?id=673fa600ac3951fd488be069a14d28795bb33b4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

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
