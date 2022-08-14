Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2536AC6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:51:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C45D260E0F;
	Sun, 11 Sep 2022 08:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C45D260E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X61qIWt9REPS; Sun, 11 Sep 2022 08:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E232460B8F;
	Sun, 11 Sep 2022 08:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E232460B8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 075441BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD2D6409BB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD2D6409BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzA3Sn_0Ccr8 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCBC9409C6
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBC9409C6
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AD3F083621; Sun, 11 Sep 2022 08:48:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 17:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8e3bfa2f5662160290dc97d6fb0b943cf894bec
X-Git-Newrev: d4afac3ab11ea4b8c2d45312f70dadb63d17d628
X-Patchwork-Hint: ignore
Message-Id: <20220911084823.AD3F083621@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: fix typo in variable name
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4afac3ab11ea4b8c2d45312f70dadb63d17d628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7ff21f8d4b94 (package/binutils: handle gprofng as an optional
feature) introduced the typo. Although it was noticed, the commit was
not amended before being pushed...

Fix that now...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/binutils/binutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index e4cb19896d..1ef7ee57d2 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -94,9 +94,9 @@ HOST_BINUTILS_CONF_OPTS = \
 
 ifeq ($(BR2_BINUTILS_GPROFNG),y)
 HOST_BINUTILS_DEPENDENCIES += host-bison
-HOST_INBUTILS_CONF_OPTS += --enable-gprofng
+HOST_BINUTILS_CONF_OPTS += --enable-gprofng
 else
-HOST_INBUTILS_CONF_OPTS += --disable-gprofng
+HOST_BINUTILS_CONF_OPTS += --disable-gprofng
 endif
 
 # binutils run configure script of subdirs at make time, so ensure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
