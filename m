Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581D2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D75B84664;
	Fri, 12 Jul 2024 19:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ujQJAJ-A2dhs; Fri, 12 Jul 2024 19:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 457E7840E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457E7840E5;
	Fri, 12 Jul 2024 19:53:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 194331BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FEEC84664
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qyd8zYyIn4-Z for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54066845F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54066845F0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E0388617F; Fri, 12 Jul 2024 19:53:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:53:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 408352207c18084c331b23aa739cde98cd52d000
X-Git-Newrev: bd0d5498ea00c29b22bb8c87b8f593b356deb469
X-Patchwork-Hint: ignore
Message-Id: <20240712195345.3E0388617F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic.mk: remove double
 colon in .stamp_built
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd0d5498ea00c29b22bb8c87b8f593b356deb469
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This issue was introduced back in 2009 with commit
e11fe847b2f545446fc3300dd2ba88fd5da05756 that created the generic
package infrastructure.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e1c16b7343..132bdb9680 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -276,7 +276,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(Q)touch $@
 
 # Build
-$(BUILD_DIR)/%/.stamp_built::
+$(BUILD_DIR)/%/.stamp_built:
 	@$(call step_start,build)
 	@$(call MESSAGE,"Building")
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
