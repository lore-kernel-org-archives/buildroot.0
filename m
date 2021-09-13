Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F303BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:44:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6DCA61B2F
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6DCA61B2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 984C64036D;
	Mon, 13 Sep 2021 13:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CG-GWQEnaY5A; Mon, 13 Sep 2021 13:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86DD401F6;
	Mon, 13 Sep 2021 13:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D073E1BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9905400F0
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Civw0BDzon72 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70A4401CD
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F27218A52D; Mon, 13 Sep 2021 13:41:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:26:10 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 2fb201cbec258683518fbfb3bd2cf649ae6e8f14
X-Git-Newrev: 73550db1d60ea62bac5e437af6bf374a6ad3a7fd
X-Patchwork-Hint: ignore
Message-Id: <20210913134134.F27218A52D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/swupdate: prevent
 systemd from removing swupdate tmp folders
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

commit: https://git.buildroot.net/buildroot/commit/?id=73550db1d60ea62bac5e437af6bf374a6ad3a7fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Ensure these folders are excluded from being cleaned up by systemd.

Fixes:
[ERROR] : SWUPDATE failed [0] ERROR : I cannot open /tmp/scripts/format.lua 2
[ERROR] : SWUPDATE failed [0] ERROR : extracting script to /tmp/scripts/ failed
[ERROR] : SWUPDATE failed [1] Installation failed !

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit daa46718e0642a92c59edb166ced1ff1911b0043)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk            | 2 ++
 package/swupdate/tmpfiles-swupdate.conf | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index cf3607a661..4bcdb96602 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -248,6 +248,8 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
 define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
new file mode 100644
index 0000000000..4743672fcc
--- /dev/null
+++ b/package/swupdate/tmpfiles-swupdate.conf
@@ -0,0 +1,2 @@
+X /tmp/datadst
+X /tmp/scripts
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
