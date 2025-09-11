Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D5CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E736A6F5C9;
	Thu, 11 Sep 2025 20:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDdqIuP9kvWz; Thu, 11 Sep 2025 20:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26BD9616FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BD9616FD;
	Thu, 11 Sep 2025 20:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0B2B92E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE38161C78
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jPGNGFVyQYP0 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3085561667
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3085561667
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EF1E84426; Thu, 11 Sep 2025 20:28:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:22:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0fd437511ea0ddb38765fe21de960988bc87cf3b
X-Git-Newrev: a7480c610137f59532b8f2bcacbb31cd6b3c36ce
X-Patchwork-Hint: ignore
Message-Id: <20250911202824.1EF1E84426@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: drop optional dependency on
 libgtk2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7480c610137f59532b8f2bcacbb31cd6b3c36ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove libgtk2, we need to drop the optional
dependency of putty on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/putty/putty.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 617518e647..ec65991f41 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -14,8 +14,6 @@ PUTTY_CONF_OPTS = -DPUTTY_GSSAPI=OFF
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 PUTTY_DEPENDENCIES += libgtk3
-else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-PUTTY_DEPENDENCIES += libgtk2
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
