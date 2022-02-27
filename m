Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65233C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E28360B12;
	Sun, 27 Feb 2022 17:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-FvX2ClanOL; Sun, 27 Feb 2022 17:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CA360D77;
	Sun, 27 Feb 2022 17:42:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B54D1BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1786C81C81
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2UjdAxrOi-G for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:41:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FD1081C11
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:41:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 39530832D1; Sun, 27 Feb 2022 17:33:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:40:59 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 49d3d2eea1238c369574e7f15d84698e7328f4fe
X-Git-Newrev: 953e0595f8f1e6a1c94d612dcde0027f89014692
X-Patchwork-Hint: ignore
Message-Id: <20220227173329.39530832D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/casync: fix zstd
 dependency to correct package name
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

commit: https://git.buildroot.net/buildroot/commit/?id=953e0595f8f1e6a1c94d612dcde0027f89014692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 807bf505f42997f98f8acb7c7046ca5f97df08bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/casync/casync.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/casync/casync.mk b/package/casync/casync.mk
index d74cb1bfe8..bb9bd8ccac 100644
--- a/package/casync/casync.mk
+++ b/package/casync/casync.mk
@@ -40,8 +40,8 @@ else
 CASYNC_CONF_OPTS += -Dudev=false
 endif
 
-ifeq ($(BR2_PACKAGE_LIBZSTD),y)
-CASYNC_DEPENDENCIES += libzstd
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+CASYNC_DEPENDENCIES += zstd
 CASYNC_CONF_OPTS += -Dlibzstd=enabled
 else
 CASYNC_CONF_OPTS += -Dlibzstd=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
