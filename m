Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F4FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE2ED60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE2ED60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A95756F94F;
	Wed,  4 Aug 2021 00:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2uy6ZFn3iGc; Wed,  4 Aug 2021 00:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0327A6F94A;
	Wed,  4 Aug 2021 00:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE9E01BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0097D40EAD
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhwsjUir6oka for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38D2740EB2
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A88087C2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b61c0830c3b4bd6f6a64be543ce6f13f88bb4fa7
X-Git-Newrev: 88556ef3b43b174684b45078e64b3fb15f808a59
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.7A88087C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neard: update url
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

commit: https://git.buildroot.net/buildroot/commit/?id=88556ef3b43b174684b45078e64b3fb15f808a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

01.org url is permission denied. There seems to be no project page
anymore. Use kernel.org repo with cleaner https url.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
