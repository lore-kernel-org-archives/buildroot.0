Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF5C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FADD84ACE;
	Sat,  8 Jun 2024 19:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itQ4Dl0-J_Wp; Sat,  8 Jun 2024 19:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83B8B84AFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B8B84AFD;
	Sat,  8 Jun 2024 19:16:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB4E81BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24ED04099D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZBliHjuE0qAj for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DB35409A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DB35409A4
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4937E814F1; Sat,  8 Jun 2024 19:15:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 20:06:12 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 90b9302e8357f9ef8266f9491b6c7a1f5bb32e01
X-Git-Newrev: 0b880085c9b9e12c53b707c139362ca3f6925553
X-Patchwork-Hint: ignore
Message-Id: <20240608191500.4937E814F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/doom-wad: drop
 reference to ftp.idsoftware.com
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b880085c9b9e12c53b707c139362ca3f6925553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The server was decommisioned in 2017 and is unlikely to ever come back, so
drop the reference:

https://www.doomworld.com/forum/topic/96999-rip-ftpidsoftwarecom/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a1d5e366b5bb42e2655113f02256caeb17983218)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doom-wad/doom-wad.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/doom-wad/doom-wad.mk b/package/doom-wad/doom-wad.mk
index f348fc2207..5d37a6a6d4 100644
--- a/package/doom-wad/doom-wad.mk
+++ b/package/doom-wad/doom-wad.mk
@@ -7,7 +7,6 @@
 DOOM_WAD_VERSION = 1.9
 DOOM_WAD_SOURCE = doom$(subst .,,$(DOOM_WAD_VERSION))s.zip
 # Official server currently unavailable
-# DOOM_WAD_SITE = ftp://ftp.idsoftware.com/idstuff/doom
 DOOM_WAD_SITE = http://www.jbserver.com/downloads/games/doom/misc/shareware
 
 define DOOM_WAD_EXTRACT_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
