Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFDCC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BDA60F9B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1BDA60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E2C605EB;
	Mon, 26 Jul 2021 21:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DVWhoKfvx82; Mon, 26 Jul 2021 21:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2266607B9;
	Mon, 26 Jul 2021 21:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE051BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89BED831D6
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7DWZ_Q5hgah for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB0DA830C0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 103A989016; Mon, 26 Jul 2021 21:08:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:42:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5278e4304c1d9f4706cb5babd527545e24f1c1d5
X-Git-Newrev: c19c8861a1c492a1ed5a03e0013d1243fd3fe937
X-Patchwork-Hint: ignore
Message-Id: <20210726210854.103A989016@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brickd: bump to version 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c19c8861a1c492a1ed5a03e0013d1243fd3fe937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix a build failure raised since bump of vala to version
0.52.4 in commit a6855bb94a815de820374d5ee95d6a4a0af66b3d

https://github.com/ev3dev/brickd/releases/tag/v1.2.2

Fixes:
 - http://autobuild.buildroot.org/results/c162e518ad614a4c21346a3ad44e2f5c6622c889

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/brickd/brickd.hash | 2 +-
 package/brickd/brickd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index e9be1b10b0..be9ad9ed90 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256  205f581103512599cb10992275da8c7207ed732e1a686600877c51b7a742de73  brickd-ev3dev-stretch_1.2.1-br1.tar.gz
+sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
index 7fe28daf78..f42b3c9956 100644
--- a/package/brickd/brickd.mk
+++ b/package/brickd/brickd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRICKD_VERSION = ev3dev-stretch/1.2.1
+BRICKD_VERSION = v1.2.2
 BRICKD_SITE = https://github.com/ev3dev/brickd
 BRICKD_SITE_METHOD = git
 BRICKD_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
