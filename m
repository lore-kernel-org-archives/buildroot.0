Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6FFC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 13:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22015817A3;
	Mon, 24 Jun 2024 13:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kb7F9nZFVka3; Mon, 24 Jun 2024 13:53:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A0C81854
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A0C81854;
	Mon, 24 Jun 2024 13:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5FE9A1BF479
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD0281145
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 13:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAenSB1YtRLD for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8252A8190B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8252A8190B
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F09582B33; Mon, 24 Jun 2024 13:53:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 13:56:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25254458bde6befcbf93b746d994f94665741c42
X-Git-Newrev: ffd1ca4ad5c1ac481ff5844591000b39b05cd6f8
X-Patchwork-Hint: ignore
Message-Id: <20240624135304.6F09582B33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xz: enable year2038 option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ffd1ca4ad5c1ac481ff5844591000b39b05cd6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All our up-to-date libc variants now support Y2038, so we can turn this
on unconditionally.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/xz/xz.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index dff4ec4be9..fa4f6dbda9 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -39,7 +39,7 @@ XZ_CONF_OPTS = \
 	--enable-unaligned-access=auto \
 	--disable-unsafe-type-punning \
 	--disable-werror \
-	--disable-year2038
+	--enable-year2038
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 XZ_CONF_OPTS += --enable-nls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
