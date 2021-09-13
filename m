Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D581AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17E1610A6
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A17E1610A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BE980F91;
	Mon, 13 Sep 2021 13:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnAuNlMEMTFk; Mon, 13 Sep 2021 13:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C309680F8A;
	Mon, 13 Sep 2021 13:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 747CA1BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64B5B80F6F
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 89iyE2fF2gie for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B825680F66
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1027F8A56B; Mon, 13 Sep 2021 13:41:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 11:34:09 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6d9e38c427b6a09d975a4ce96af466db6d72eb78
X-Git-Newrev: 1189d1d2153ba3664754c17e326f0c3a925e315f
X-Patchwork-Hint: ignore
Message-Id: <20210913134145.1027F8A56B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/swupdate: use
 package make install for target install
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1189d1d2153ba3664754c17e326f0c3a925e315f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This ensures all tools/libraries will be properly installed.

Update SWUPDATE_BUILD_CMDS param ordering for consistency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 08de8f500e6223a67df96eaf869766a97b4d039f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 10c5f2d1f9..12dafcc1a2 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -168,11 +168,12 @@ define SWUPDATE_KCONFIG_FIXUP_CMDS
 endef
 
 define SWUPDATE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) $(SWUPDATE_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) $(SWUPDATE_MAKE_OPTS)
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/swupdate $(TARGET_DIR)/usr/bin/swupdate
+	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	$(if $(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE), \
 		mkdir -p $(TARGET_DIR)/var/www/swupdate; \
 		cp -dpfr $(@D)/examples/www/v2/* $(TARGET_DIR)/var/www/swupdate)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
