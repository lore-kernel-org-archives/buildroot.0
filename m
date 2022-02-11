Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E67C433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 22:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F0A983E85;
	Fri, 11 Feb 2022 22:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8skhPUyroubj; Fri, 11 Feb 2022 22:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9567783E83;
	Fri, 11 Feb 2022 22:27:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81C0C1BF34E
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 22:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F4D74019C
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 22:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30ymDbg5y-_W for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 22:27:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4959400C4
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 22:27:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0DC4C82DDC; Fri, 11 Feb 2022 22:20:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 23:26:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6ff83722f96f71c8b883c63dde37fe9867c1bdc
X-Git-Newrev: 807bf505f42997f98f8acb7c7046ca5f97df08bb
X-Patchwork-Hint: ignore
Message-Id: <20220211222017.0DC4C82DDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/casync: fix zstd dependency to
 correct package name
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

commit: https://git.buildroot.net/buildroot/commit/?id=807bf505f42997f98f8acb7c7046ca5f97df08bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
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
