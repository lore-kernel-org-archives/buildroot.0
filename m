Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02641C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0226401F9;
	Wed,  7 Aug 2024 09:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGK_OAH8hzAN; Wed,  7 Aug 2024 09:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95B91404D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95B91404D7;
	Wed,  7 Aug 2024 09:25:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13F4D1BF2CE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CE346071F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEWzRL3cgcUv for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C502606E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C502606E0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 489C184457; Wed,  7 Aug 2024 09:25:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 10:53:46 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: ea84f13bb067398a5293127e709d49c2af1f25cc
X-Git-Newrev: cb131ede84f33418afcf9f607edbcabc2fab56ba
X-Patchwork-Hint: ignore
Message-Id: <20240807092530.489C184457@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/pkg-generic.mk:
 remove double colon in .stamp_built
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb131ede84f33418afcf9f607edbcabc2fab56ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

This issue was introduced back in 2009 with commit
e11fe847b2f545446fc3300dd2ba88fd5da05756 that created the generic
package infrastructure.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit bd0d5498ea00c29b22bb8c87b8f593b356deb469)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2749320c3..c7419b00fb 100644
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
