Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE142C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:21:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68FE961278
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68FE961278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447FB60B34;
	Sun,  3 Oct 2021 20:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEDw-Wb7eXd8; Sun,  3 Oct 2021 20:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D0D605D9;
	Sun,  3 Oct 2021 20:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AE3A1BF973
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3984940169
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PLIUf1_QHyfY for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27AF84000B
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6E15388707; Sun,  3 Oct 2021 20:18:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 641beb3217ce1686772c80ac9e2cf815d72f1624
X-Git-Newrev: 349b0a08f6def2c400055bd53a1ad86c72f59f0f
X-Patchwork-Hint: ignore
Message-Id: <20211003201806.6E15388707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: bump to version 3.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=349b0a08f6def2c400055bd53a1ad86c72f59f0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated COPYING file to remove the PLPA exemption (appendix 2)
With this change the license is now GPLv2 without any additional wording.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.hash | 4 ++--
 package/htop/htop.mk   | 7 +------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 34d95eb7a1..8123923405 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  123476d56a5e6a219654eebb6b2ec747dfa364f39c01a6475bf8030a25c81bff  htop-ce6d60e7def146c13d0b8bca4642e7401a0a8995.tar.gz
-sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING
+sha256  200a4f9331d0e5048bf9bda6a8dee38248c557e471b9e57ff3784853efd613a9  htop-3.1.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index bb2bcb29ae..22cc739e20 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,12 +4,7 @@
 #
 ################################################################################
 
-# This commit hash corresponds to version 3.0.5.
-# htop sources were moved from bintray to github and the sources tar archive
-# was also changed (the build process requires `HTOP_AUTORECONF = YES` now). We
-# use commit hash instead of git tag here to avoid breaking existing source
-# caches
-HTOP_VERSION = ce6d60e7def146c13d0b8bca4642e7401a0a8995
+HTOP_VERSION = 3.1.0
 HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
