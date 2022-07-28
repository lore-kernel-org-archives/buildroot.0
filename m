Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1362CC04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 21:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A567440534;
	Thu, 28 Jul 2022 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A567440534
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1pT9-LnoJ6Sg; Thu, 28 Jul 2022 21:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B91CD404F5;
	Thu, 28 Jul 2022 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B91CD404F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9D301BF3C2
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2C8760B00
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2C8760B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTPbOpzcl5xY for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 21:12:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F08FE60ACD
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 21:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F08FE60ACD
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C71818681E; Thu, 28 Jul 2022 20:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 23:05:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebe5d9edfe8d07eafd7b61c4f77ce509bb98a0ad
X-Git-Newrev: 64f1603bb805cd651d34a7cfe1a1c12c4242fed7
X-Patchwork-Hint: ignore
Message-Id: <20220728205852.C71818681E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: enable checking of hash spacing
 in check-package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=64f1603bb805cd651d34a7cfe1a1c12c4242fed7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all hash files have been fixed, enable checking of hash
spacing in check-package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e30e778346..bf101ff770 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,7 +1253,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob --exclude=HashSpaces {} +
+		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
