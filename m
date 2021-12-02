Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA0C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEA7A401B0;
	Thu,  2 Dec 2021 17:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gyxEQ76PVczf; Thu,  2 Dec 2021 17:16:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1BF540A4C;
	Thu,  2 Dec 2021 17:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E94E51BF3F9
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3B6983F02
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhWu90chPoXY for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517EF83EF4
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2CC7C92281; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:09:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3ce8fecac7cd813c3b867947596a5823a6293ff
X-Git-Newrev: f9f0bc279d8c4093fc01f7f9f083a2498b79715d
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.2CC7C92281@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linenoise: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9f0bc279d8c4093fc01f7f9f083a2498b79715d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
d87847203f3b1b6af51515978563f0dee737b6fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linenoise/linenoise.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index f51e2871e7..a8fe7674c2 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -19,9 +19,12 @@ define LINENOISE_BUILD_CMDS
 endef
 
 define LINENOISE_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(STAGING_DIR)/usr/include/linenoise.h
-	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(STAGING_DIR)/usr/lib/liblinenoise.a
-	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
+	$(INSTALL) -m 644 -D $(@D)/linenoise.h \
+		$(STAGING_DIR)/usr/include/linenoise.h
+	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a \
+		$(STAGING_DIR)/usr/lib/liblinenoise.a
+	$(INSTALL) -m 755 -D $(@D)/linenoise_example \
+		$(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
