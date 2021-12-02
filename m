Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1CFC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 17:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 152AF40A44;
	Thu,  2 Dec 2021 17:15:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uG9oNZHTHLdB; Thu,  2 Dec 2021 17:15:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32AB5401B0;
	Thu,  2 Dec 2021 17:15:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6C01BF9D1
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BF6240A43
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 17:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ScZwnKBmKCcJ for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 483C1400D7
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 17:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1FF0592280; Thu,  2 Dec 2021 17:10:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 Dec 2021 18:09:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaf7b2c9c6847c487af46e023dae3497efdd652f
X-Git-Newrev: d3ce8fecac7cd813c3b867947596a5823a6293ff
X-Patchwork-Hint: ignore
Message-Id: <20211202171048.1FF0592280@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: drop spurious spaces
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3ce8fecac7cd813c3b867947596a5823a6293ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious spaces added by commit
14989d0be59762a354e7c5c15a2eeb4826d8040b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tvheadend/tvheadend.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 6000e82a6f..3c1764c478 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -194,8 +194,10 @@ TVHEADEND_POST_INSTALL_TARGET_HOOKS += TVHEADEND_CLEAN_SHARE
 #    to the other users (because there will be crendentials in there)
 
 define TVHEADEND_INSTALL_INIT_SYSV
-	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
-	$(INSTALL) -D package/tvheadend/S99tvheadend          $(TARGET_DIR)/etc/init.d/S99tvheadend
+	$(INSTALL) -D package/tvheadend/etc.default.tvheadend \
+		$(TARGET_DIR)/etc/default/tvheadend
+	$(INSTALL) -D package/tvheadend/S99tvheadend \
+		$(TARGET_DIR)/etc/init.d/S99tvheadend
 endef
 
 define TVHEADEND_USERS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
