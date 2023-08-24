Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAD1C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 21:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAFAF41D88;
	Thu, 24 Aug 2023 21:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAFAF41D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rLFvJlSBdxYC; Thu, 24 Aug 2023 21:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB4241D7D;
	Thu, 24 Aug 2023 21:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB4241D7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF23F1BF84C
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C5841667
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 21:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95C5841667
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUkNzPV7NdSE for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 21:17:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC0A415ED
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 21:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC0A415ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD41E86277; Thu, 24 Aug 2023 21:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 23:11:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: abbf59f643b5f67eb36fa3e0eadf52bc86802f6c
X-Git-Newrev: 46f1cd6fe3b6a0f066e6217dec19ea8eb96d3923
X-Patchwork-Hint: ignore
Message-Id: <20230824211744.CD41E86277@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/Config.in: make QT
 libraries entries visible with Qt6
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

commit: https://git.buildroot.net/buildroot/commit/?id=46f1cd6fe3b6a0f066e6217dec19ea8eb96d3923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For now the "QT libraries and helper libraries" section was only made
visible when BR2_PACKAGE_QT5 was enabled. In preparation for enabling
some of those libraries with Qt6, we now show this section when
BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6.

All of the 8 packages in this section already had a (redundant)
"depends on BR2_PACKAGE_QT5" in their own Config.in file, so the only
functional change of this commit is that the comment "QT libraries and
helper libraries" now becomes visible with Qt6, but it is not followed
by any selectable option. This will be changed in a following commit
enabling one of those libraries with Qt6.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 0378566305..3ce869f310 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -372,7 +372,8 @@ comment "Graphic libraries"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
-if BR2_PACKAGE_QT5
+	source "package/qt6/Config.in"
+if BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
 comment "QT libraries and helper libraries"
 	source "package/cutelyst/Config.in"
 	source "package/grantlee/Config.in"
@@ -383,7 +384,6 @@ comment "QT libraries and helper libraries"
 	source "package/qwt/Config.in"
 	source "package/simple-mail/Config.in"
 endif
-	source "package/qt6/Config.in"
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
