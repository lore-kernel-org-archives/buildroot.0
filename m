Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADB8C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 09:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F9668137D;
	Sun, 14 Jul 2024 09:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1hf5WniHdCr; Sun, 14 Jul 2024 09:08:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D8F481380
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D8F481380;
	Sun, 14 Jul 2024 09:08:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25621BF23C
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FD5981393
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 09:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uByeUvAQu7WL for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A169A81374
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A169A81374
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC5486736; Sun, 14 Jul 2024 09:08:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 09:20:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2dd96f0eed99770c3e873284df397f134dc173e
X-Git-Newrev: a79adca86fc1ecad30cd9dcf1b513fb30a8eaeac
X-Patchwork-Hint: ignore
Message-Id: <20240714090820.8BC5486736@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic: split long,
 unreadable DOWNLOAD line
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

commit: https://git.buildroot.net/buildroot/commit/?id=a79adca86fc1ecad30cd9dcf1b513fb30a8eaeac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index af9a42c884..06d2c9560e 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -182,7 +182,12 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
+	$(if $($(PKG)_MAIN_DOWNLOAD), \
+		$(call DOWNLOAD, \
+			$($(PKG)_MAIN_DOWNLOAD), \
+			$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)) \
+		) \
+	)
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
