Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 11:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18D764052B;
	Sat, 15 Jan 2022 11:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LfNQxyQwKVY; Sat, 15 Jan 2022 11:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C5CD400C8;
	Sat, 15 Jan 2022 11:02:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FD6F1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DE7140183
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 11:01:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmBqenx8Jarz for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 11:01:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEB3240131
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F327C82911; Sat, 15 Jan 2022 10:55:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:39:38 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 7bfd519b796cb98c5d4eee2e2e251121689dd604
X-Git-Newrev: 9bdea4db4ba8df19b50e5ac72217336b1d4e2316
X-Patchwork-Hint: ignore
Message-Id: <20220115105521.F327C82911@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/alsa-utils: fix
 install rule for alsactl
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bdea4db4ba8df19b50e5ac72217336b1d4e2316
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

The copy command for /usr/share/alsa missing an asterisk cause it to copy to
/usr/share/alsa/alsa instead of /usr/share/alsa where it should be.

Signed-off-by: Khoa Hoang <admin@khoahoang.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 6c71b52235d88cd8d38b4fd02c87f791aaa8eff3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 427280c1e6..2603e52f18 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -77,7 +77,7 @@ define ALSA_UTILS_INSTALL_TARGET_CMDS
 	fi
 	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/; \
-		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
+		cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/; \
 	fi
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
