Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C886BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:14:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D92C61206
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D92C61206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54F6740459;
	Sat, 11 Sep 2021 14:14:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9D9VEbv4Afl; Sat, 11 Sep 2021 14:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 819F640550;
	Sat, 11 Sep 2021 14:13:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 929471BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94BFE40457
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ijqwems-9K5A for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:12:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B630B40459
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AA59288FE7; Sat, 11 Sep 2021 14:10:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:11:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25b0645aa4f6a6457942b50161e7e0c05b4222d3
X-Git-Newrev: daa46718e0642a92c59edb166ced1ff1911b0043
X-Patchwork-Hint: ignore
Message-Id: <20210911141045.AA59288FE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: prevent systemd from
 removing swupdate tmp folders
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

commit: https://git.buildroot.net/buildroot/commit/?id=daa46718e0642a92c59edb166ced1ff1911b0043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure these folders are excluded from being cleaned up by systemd.

Fixes:
[ERROR] : SWUPDATE failed [0] ERROR : I cannot open /tmp/scripts/format.lua 2
[ERROR] : SWUPDATE failed [0] ERROR : extracting script to /tmp/scripts/ failed
[ERROR] : SWUPDATE failed [1] Installation failed !

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
