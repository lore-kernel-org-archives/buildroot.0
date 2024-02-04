Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8D5C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0E84402F2;
	Sun,  4 Feb 2024 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0E84402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQmur6lF04A0; Sun,  4 Feb 2024 21:27:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B5940420;
	Sun,  4 Feb 2024 21:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B5940420
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A588E1BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E80B416FA
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E80B416FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ptcm88GxNIjr for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1ED416D8
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1ED416D8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BDC18693A; Sun,  4 Feb 2024 21:27:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:23:35 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e4fa5ebff17d899c3c0ef349b4eeb5af7b2aeb81
X-Git-Newrev: 892d471112cc8eef69fcd62653fbe51c775ee390
X-Patchwork-Hint: ignore
Message-Id: <20240204212703.9BDC18693A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opencv4-contrib:
 fix INSTALL_TARGET value
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

commit: https://git.buildroot.net/buildroot/commit/?id=892d471112cc8eef69fcd62653fbe51c775ee390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The variable should be a YES/NO value, FALSE is not a valid value.
E.g. the yesno-to-bool cmd does not translate a FALSE value and therefore returns invalid JSON.

Signed-off-by: Maximilian Senftleben <maximilian.senftleben@frogblue-tec.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9fa01e309781faec1395507405a128deb8f55c56)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv4-contrib/opencv4-contrib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 52d2682b26..f8c8cfd94c 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -6,7 +6,7 @@
 
 OPENCV4_CONTRIB_VERSION = 4.8.1
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
-OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
+OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
 OPENCV4_CONTRIB_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
