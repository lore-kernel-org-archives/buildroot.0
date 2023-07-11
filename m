Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30CCEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 08:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 860B840272;
	Tue, 11 Jul 2023 08:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 860B840272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q27TwdujlDW9; Tue, 11 Jul 2023 08:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC70D40528;
	Tue, 11 Jul 2023 08:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC70D40528
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E07B31BF294
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 08:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C766C81CAF
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 08:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C766C81CAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHDMZ7jjVA7D for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 08:12:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0690A81C93
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 08:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0690A81C93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E8A86DDB; Tue, 11 Jul 2023 08:12:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 10:12:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b23dff9e71786191797d3b41ce80afe659f0396
X-Git-Newrev: 89ffd9a47901b2361ca8581640b829bbbdad90e2
X-Patchwork-Hint: ignore
Message-Id: <20230711081240.E2E8A86DDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove qt5wayland
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=89ffd9a47901b2361ca8581640b829bbbdad90e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch has been dropped in commit
6b23dff9e71786191797d3b41ce80afe659f0396, which forgot to update
.checkpackageignore.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4629552432

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 3d8924c4e8..c75d0f80d2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1303,7 +1303,6 @@ package/qt5/qt5enginio/0001-Do-not-use-deprecated-QLinkedList.patch Upstream
 package/qt5/qt5location/0001-3rdparty-mapbox-gl-native-fix-musl-compile-pthread_g.patch Upstream
 package/qt5/qt5script/0001-Detect-32-bits-armv8-a-architecture.patch Upstream
 package/qt5/qt5tools/0001-Disable-designer-tool-fixes-configure-error.patch Upstream
-package/qt5/qt5wayland/0001-Add-missing-define-guards.patch Upstream
 package/qt5/qt5webengine-chromium/0001-Add-python3-build-support.patch Upstream
 package/qt5/qt5webengine-chromium/0002-Don-t-rebase-sysroot-path.patch Upstream
 package/qt5/qt5webengine/0001-gn.pro-don-t-link-statically-with-libstc.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
