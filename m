Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C51381C6F;
	Tue, 22 Feb 2022 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykuxrzucYHfb; Tue, 22 Feb 2022 21:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4AFF81C21;
	Tue, 22 Feb 2022 21:33:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0271BF39A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 935D540168
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 21:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2i_jF0tpZRi for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 21:33:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D7CB404CF
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 21:33:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1DD3883837; Tue, 22 Feb 2022 21:25:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 17:55:03 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c61c94a84e0afeb48a9b672153bece6b49a70a28
X-Git-Newrev: ec034ba9dee122c51cb59703c85df839dc973a54
X-Patchwork-Hint: ignore
Message-Id: <20220222212515.1DD3883837@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gauche: drop
 autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec034ba9dee122c51cb59703c85df839dc973a54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 11cb72be570409be77d4bb49c17b4a2feef31be7 forgot to drop
autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5f703276e0713b746f2c937c4c4fc02ef6ad1d77)
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
