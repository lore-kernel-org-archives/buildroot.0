Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D47D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB8B61ADD;
	Thu, 27 Nov 2025 20:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MO1qgWP9kppL; Thu, 27 Nov 2025 20:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C0EA6177D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C0EA6177D;
	Thu, 27 Nov 2025 20:36:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B0BDE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB30A60ABB
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liJ_It4MssjS for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD69561750
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD69561750
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC33881847; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:24:27 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 2ca5bf309a6e62b7948fc9652df9105aeb3be073
X-Git-Newrev: 6ea56ca6e10938a4632516dda788db58be1626a7
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.AC33881847@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/psplash: drop
 'default n' for fullscreen mode
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ea56ca6e10938a4632516dda788db58be1626a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Commit a028f0a51de0ed ("package/psplash: add support for fullscreen config
option") added a 'default n' line to Config.in, but booleans default to 'n',
so we typically do not add such redundant lines.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b6cc7b874a97fbc709d1f9e619378bcbea259e47)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/psplash/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/psplash/Config.in b/package/psplash/Config.in
index ca39cd0ee3..118801e8ef 100644
--- a/package/psplash/Config.in
+++ b/package/psplash/Config.in
@@ -49,7 +49,6 @@ config BR2_PACKAGE_PSPLASH_STARTUP_MSG
 
 config BR2_PACKAGE_PSPLASH_FULL_SCREEN
 	bool "use fullscreen mode"
-	default n
 	help
 	  Enable displaying the psplash image in fullscreen mode.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
