Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854FCC46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 09:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26EB5820C8;
	Wed, 11 Jan 2023 09:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26EB5820C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nY_BuNtVYXQ9; Wed, 11 Jan 2023 09:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B410820B2;
	Wed, 11 Jan 2023 09:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B410820B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB341BF95E
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BF1E402B8
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF1E402B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Poamn2niMGK2 for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EA3E402E7
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EA3E402E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D7B5878DF; Wed, 11 Jan 2023 09:33:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 11 Jan 2023 08:09:48 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 60d393d8617d8249703dde1eb32f10402a083f34
X-Git-Newrev: acbedb79c779ff85b0c12d278ef6d820483445fa
X-Patchwork-Hint: ignore
Message-Id: <20230111093332.4D7B5878DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/tekui: really
 disable parallel build
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

commit: https://git.buildroot.net/buildroot/commit/?id=acbedb79c779ff85b0c12d278ef6d820483445fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit "c80789c917 tekui: disable parallel build" added TEKUI_MAKE but
that is not a symbol used by the generic package infra.

Ensure -j1 is passed to the build and install commands by using
TEKUI_MAKE explicitly.

Fixes:
http://autobuild.buildroot.net/results/c6cd0d488581013a8b215b0ee2fd8f549a868d4b

Cc: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 93036af53fbbd566a800a12fa8979000ea4fa31f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tekui/tekui.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 13000edd3e..3cb7ff51e5 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -59,11 +59,11 @@ endif
 endif
 
 define TEKUI_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
+	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
 endef
 
 define TEKUI_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
