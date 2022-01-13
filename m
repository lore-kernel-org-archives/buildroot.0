Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA61C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7729141667;
	Thu, 13 Jan 2022 20:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiQwrFciWSXK; Thu, 13 Jan 2022 20:39:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFBA44165A;
	Thu, 13 Jan 2022 20:39:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 975B51BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FDEE41696
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xK6x1SNDdI1 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:38:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9C77415FB
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 532D383582; Thu, 13 Jan 2022 20:32:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:38:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a607efc6d3606e862babfbd17ca8e39398f7c2a5
X-Git-Newrev: e247f605e82fdfca6fbee6365baec982d1468071
X-Patchwork-Hint: ignore
Message-Id: <20220113203225.532D383582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: use backported ICU
 patch from upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=e247f605e82fdfca6fbee6365baec982d1468071
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use backported upstream ICU fix instead of adapted downstream patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...yStation-ICU-68.1-no-longer-exposes-FALS.patch} | 35 +++++++++++++++++-----
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch b/package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
similarity index 86%
rename from package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
rename to package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
index 11d0b7b248..0c3e8b3586 100644
--- a/package/qt5/qt5webkit/0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch
+++ b/package/qt5/qt5webkit/0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch
@@ -1,18 +1,39 @@
-From bf936a2bc8120f693f1effd3d9b130cddc6c4185 Mon Sep 17 00:00:00 2001
-From: Henri Roosen <henri.roosen@ginzinger.com>
-Date: Thu, 18 Mar 2021 11:53:57 +0100
-Subject: [PATCH] Fix ICU related compile failures from capital bool defines
+From 736e1d804d1efa2077c4f1fe0b9084927d82e249 Mon Sep 17 00:00:00 2001
+From: "stephan.szabo@sony.com"
+ <stephan.szabo@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
+Date: Tue, 3 Nov 2020 20:06:15 +0000
+Subject: [PATCH] [WinCairo/PlayStation] ICU 68.1 no longer exposes FALSE and
+ TRUE macros by default https://bugs.webkit.org/show_bug.cgi?id=218522
 
-See ICU-21267
+Reviewed by Don Olmstead.
 
-Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
+Source/WebCore:
+
+* platform/text/TextCodecICU.cpp: Replace use of TRUE with true
+
+Source/WebKit:
+
+* UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp: Replace FALSE with false
+
+Source/WTF:
+
+Replace uses of FALSE and TRUE with false and true.
+
+* wtf/text/icu/UTextProvider.h:
+* wtf/text/icu/UTextProviderLatin1.cpp:
+* wtf/text/icu/UTextProviderUTF16.cpp:
+
+Change-Id: I876cf2b10b8c858c3d265113c062d159749a2f3e
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@269325 268f45cc-cd09-0410-ab3c-d52691b4dbfc
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+736e1d804d1efa2077c4f1fe0b9084927d82e249]
 ---
  Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
  Source/WebCore/platform/text/icu/UTextProvider.h   |  8 ++++----
  .../platform/text/icu/UTextProviderLatin1.cpp      | 14 +++++++-------
  .../platform/text/icu/UTextProviderUTF16.cpp       |  4 ++--
- 4 files changed, 14 insertions(+), 14 deletions(-)
+ 7 files changed, 45 insertions(+), 14 deletions(-)
 
 diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebCore/platform/text/TextCodecICU.cpp
 index dd6ff0675bb1..e0f4bd718828 100644
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
