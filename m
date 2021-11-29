Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0D6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119E3818AC;
	Mon, 29 Nov 2021 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yefmQ8GhC0HS; Mon, 29 Nov 2021 21:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EA3781076;
	Mon, 29 Nov 2021 21:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9260B1BF38C
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE46E819ED
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bya5uwgixwJ9 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 21:35:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF79F81A29
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 21:35:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5C9FC912AB; Mon, 29 Nov 2021 21:31:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 22:33:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e5e5387bd3036587eaac251bb4aa6db563ac2fc
X-Git-Newrev: fdef53d4203aab3cb026d26aa83545c06fc18d27
X-Patchwork-Hint: ignore
Message-Id: <20211129213102.5C9FC912AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdef53d4203aab3cb026d26aa83545c06fc18d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
679585bd6185c57dc20fc460dd476aa30eb3c5e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/brltty/brltty.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 9e21018c0a..600bf596df 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -129,12 +129,12 @@ BRLTTY_POST_INSTALL_TARGET_HOOKS += BRLTTY_INSTALL_CONF
 
 define BRLTTY_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/brltty/S10brltty \
-		   $(TARGET_DIR)/etc/init.d/S10brltty
+		$(TARGET_DIR)/etc/init.d/S10brltty
 endef
 
 define BRLTTY_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/brltty/brltty.service \
-		   $(TARGET_DIR)/usr/lib/systemd/system/brltty.service
+		$(TARGET_DIR)/usr/lib/systemd/system/brltty.service
 endef
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
