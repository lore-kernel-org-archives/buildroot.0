Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8FFCD11DB
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F71940B2C;
	Sun, 24 Mar 2024 15:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXtWhx4F2E8l; Sun, 24 Mar 2024 15:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA0B4062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFA0B4062A;
	Sun, 24 Mar 2024 15:55:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF481BF4DD
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 035CA6077A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 15:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvMgaSzId0I7 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 15:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B5060725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30B5060725
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 15:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E44A783B95; Sun, 24 Mar 2024 15:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 16:18:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf3dc5b84cf9586406d1ff6aa87860eb28d037a
X-Git-Newrev: 748fc4be21ed46e2c562735bffed1ea67dbbc7b9
X-Patchwork-Hint: ignore
Message-Id: <20240324155537.E44A783B95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils.mk: remove trailing
 slash in pkgdir definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=748fc4be21ed46e2c562735bffed1ea67dbbc7b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
[Arnout: move to definition of pkgdir instead of PKGDIR]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 723bbe4e24..6181ae7a99 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -42,7 +42,7 @@ KCONFIG_DISABLE_OPT = $(Q)$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(SHARP_SIGN) $
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *-package macros to
 # automagically find where the package is located.
-pkgdir = $(dir $(lastword $(MAKEFILE_LIST)))
+pkgdir = $(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))
 pkgname = $(lastword $(subst /, ,$(pkgdir)))
 
 # Helper to build the extension for a package archive, based on various
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
