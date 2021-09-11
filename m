Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12294C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668A16109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 668A16109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2B4B406AE;
	Sat, 11 Sep 2021 14:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9q2i7Kianf4; Sat, 11 Sep 2021 14:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00E384042F;
	Sat, 11 Sep 2021 14:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B07F1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8666680C91
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbBEMxBnI6Fn for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC7183E80
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B7A138902D; Sat, 11 Sep 2021 14:35:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:29:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b7be053b8b6f763b54a662020e84edc3b202d2b
X-Git-Newrev: f9985c5d5bfe5ac7864aeb96ff59ac8a9c40e012
X-Patchwork-Hint: ignore
Message-Id: <20210911143551.B7A138902D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: prune old smcroute
 compat script
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9985c5d5bfe5ac7864aeb96ff59ac8a9c40e012
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Long ago, before SMCRoute had yet become a proper daemon and standalone
control tool, it was both.  After the metamorphosis commands and options
had changed, a compat script was added to provide a smooth transition.

The compat script is still shipped in the tarball, and installed, but
only Debian still relies on it, so we prune it here to keep confusion
to a minimum, hopefully.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/smcroute/smcroute.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 9cce0acbbc..e8fc54bb42 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -24,4 +24,10 @@ define SMCROUTE_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S41smcroute
 endef
 
+define SMCROUTE_PRUNE_COMPAT_SCRIPT
+	rm -f $(TARGET_DIR)/usr/sbin/smcroute
+endef
+
+SMCROUTE_POST_INSTALL_TARGET_HOOKS += SMCROUTE_PRUNE_COMPAT_SCRIPT
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
