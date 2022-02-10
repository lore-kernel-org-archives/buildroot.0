Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30108C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEF5C40647;
	Thu, 10 Feb 2022 21:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bj6WZN_v56MZ; Thu, 10 Feb 2022 21:39:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B5740571;
	Thu, 10 Feb 2022 21:39:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07E091BF2EC
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51794408BF
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcsFXYq5VEKS for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1900C40354
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:38:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E068482DE9; Thu, 10 Feb 2022 21:30:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 22:35:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cde834f4777be4a855755703a291452ed6a5b052
X-Git-Newrev: 5f703276e0713b746f2c937c4c4fc02ef6ad1d77
X-Patchwork-Hint: ignore
Message-Id: <20220210213036.E068482DE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gauche: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f703276e0713b746f2c937c4c4fc02ef6ad1d77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 11cb72be570409be77d4bb49c17b4a2feef31be7 forgot to drop
autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gauche/gauche.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 2520379369..fe0a613a9d 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -10,8 +10,6 @@ GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
-# We're patching configure.ac
-GAUCHE_AUTORECONF = YES
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
