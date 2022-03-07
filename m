Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC1C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75EAD60C19;
	Mon,  7 Mar 2022 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yHf-FXde60SK; Mon,  7 Mar 2022 21:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C55DC60BD1;
	Mon,  7 Mar 2022 21:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6868E1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57CF3812F5
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26ZEwP49eZY1 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B56B5812DC
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EDFE482DFB; Mon,  7 Mar 2022 21:15:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f439f7c60b3734d3920c32aee027c2cb73621682
X-Git-Newrev: 338acc3d440a5ade6c0d79b86a7b67342ea3f371
X-Patchwork-Hint: ignore
Message-Id: <20220307211545.EDFE482DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kf5/kf5-kcoreaddons: add python3
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=338acc3d440a5ade6c0d79b86a7b67342ea3f371
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is an optional dependency since the addition of the package in
commit bf48bf86295bc4628bcd14fd4ca415d6971c8ab8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 76be8876cc..9a034ba763 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -10,7 +10,10 @@ KF5_KCOREADDONS_SOURCE = kcoreaddons-$(KF5_KCOREADDONS_VERSION).tar.xz
 KF5_KCOREADDONS_LICENSE = LGPL-2.1
 KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
 
-KF5_KCOREADDONS_DEPENDENCIES = kf5-extra-cmake-modules qt5tools
+KF5_KCOREADDONS_DEPENDENCIES = \
+	kf5-extra-cmake-modules \
+	qt5tools \
+	$(if $(BR2_PACKAGE_PYTHON3),python3)
 KF5_KCOREADDONS_INSTALL_STAGING = YES
 
 KF5_KCOREADDONS_CXXFLAGS = $(TARGET_CXXFLAGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
