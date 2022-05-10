Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66218C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15D508143E;
	Tue, 10 May 2022 19:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tna5FoWQoPyX; Tue, 10 May 2022 19:38:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B1CD81422;
	Tue, 10 May 2022 19:38:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 335AD1BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20F764022C
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZHyvda92YIe for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F6094012D
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 43C2385CD9; Tue, 10 May 2022 19:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e15ce8b04d5fa36c51690fbbf8a015e5fee026a1
X-Git-Newrev: 76da59d6c541c2fcac73932615d775130b6c0588
X-Patchwork-Hint: ignore
Message-Id: <20220510192737.43C2385CD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcusdk: drop trailing backslash
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

commit: https://git.buildroot.net/buildroot/commit/?id=76da59d6c541c2fcac73932615d775130b6c0588
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e15ce8b04d5fa36c51690fbbf (package/bcusdk: fix build with
argp-standalone and NLS) added a trailing backslash.  Drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bcusdk/bcusdk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index 8006b265b9..f14b23c7cc 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -21,7 +21,7 @@ BCUSDK_CONF_OPTS = \
 	--without-pth-test \
 	--with-pth=$(STAGING_DIR)/usr
 
-BCUSDK_DEPENDENCIES = libpthsem \
+BCUSDK_DEPENDENCIES = libpthsem
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
