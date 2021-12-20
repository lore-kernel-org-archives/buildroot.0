Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00885C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B00A781757;
	Mon, 20 Dec 2021 22:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfv42H9KpqRP; Mon, 20 Dec 2021 22:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095438174C;
	Mon, 20 Dec 2021 22:43:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6498E1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C86E81501
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PxGytILDqrh0 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2114E815CD
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 17784828B8; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:06:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da6fbde369c74a6e04c486cc40e1058b203edba8
X-Git-Newrev: a3c2fe8ef19edc4266a179d53d452fd6accb3456
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.17784828B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/guile: drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3c2fe8ef19edc4266a179d53d452fd6accb3456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d8bee3950aa851620d6a954aebad1f984caa105a forgot to drop
--with-libltdl-prefix

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/guile/guile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index c74325252f..0f245fca76 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -64,7 +64,6 @@ GUILE_CONF_ENV += GUILE_FOR_BUILD=$(HOST_DIR)/bin/guile \
 	CFLAGS="$(TARGET_CFLAGS) $(GUILE_CFLAGS)"
 
 GUILE_CONF_OPTS += \
-	--with-libltdl-prefix=$(STAGING_DIR)/usr/lib \
 	--with-libgmp-prefix=$(STAGING_DIR)/usr/lib \
 	--with-libunistring-prefix=$(STAGING_DIR)/usr/lib
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
