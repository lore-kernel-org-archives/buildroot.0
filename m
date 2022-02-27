Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05835C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64D6408C5;
	Sun, 27 Feb 2022 17:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwthzWSgbAgA; Sun, 27 Feb 2022 17:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A922B40898;
	Sun, 27 Feb 2022 17:41:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 682F01BF285
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6450E60ABE
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 17:41:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DPw6Lfn6gpd for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 17:41:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B986D60AA3
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 17:41:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 80EBE813A8; Sun, 27 Feb 2022 17:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 18:41:10 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b52ed0eaf493393d1646756f5b1ace27c18f9df6
X-Git-Newrev: 1b949740731be09fba6c1c5a90a07ecf68ede60e
X-Patchwork-Hint: ignore
Message-Id: <20220227173324.80EBE813A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/casync: fix zstd
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b949740731be09fba6c1c5a90a07ecf68ede60e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
