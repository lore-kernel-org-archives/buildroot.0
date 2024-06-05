Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5CDC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFA6D408C0;
	Wed,  5 Jun 2024 21:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVQFxndi74fF; Wed,  5 Jun 2024 21:54:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 953B541671
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 953B541671;
	Wed,  5 Jun 2024 21:54:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 771C91BF954
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6167684219
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMYX59isboch for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7B038420F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7B038420F
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90B7887BF8; Wed,  5 Jun 2024 21:54:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 23:31:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fb9d71bfcbe6854b9c5a4a7d9b5d3acabbdf192
X-Git-Newrev: c6ee0ea47c1dddcafa41a00cb99790321fb60e3f
X-Patchwork-Hint: ignore
Message-Id: <20240605215430.90B7887BF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cvs: use appropriate TAR
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c6ee0ea47c1dddcafa41a00cb99790321fb60e3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/cvs/cvs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 64c15f16fe..cf9127fc3a 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -31,7 +31,7 @@ CVS_CONF_OPTS += --with-external-zlib
 endif
 
 define CVS_BZIP_UNPACK
-	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
