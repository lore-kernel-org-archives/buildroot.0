Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D774C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9C9F81351;
	Tue, 23 Jul 2024 20:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jJDhHorOq5g; Tue, 23 Jul 2024 20:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9EA8134A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9EA8134A;
	Tue, 23 Jul 2024 20:18:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC8F11BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99EF640319
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Dqsv50RAKlO for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8411B400F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8411B400F6
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:18:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 685268753A; Tue, 23 Jul 2024 20:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce00b93d5ad9691b73bba1501847eac8679e3c01
X-Git-Newrev: b68fa4c31a3d7300e36a7b33ebbf537f04b66b59
X-Patchwork-Hint: ignore
Message-Id: <20240723201826.685268753A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gamin: remove stale Config.in
 include breaking build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b68fa4c31a3d7300e36a7b33ebbf537f04b66b59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous commit ce00b93d5 (package/gamin: drop package) forgot to
remove the package/gamin/Config include from package/Config.in, which
triggers the following error.

  package/Config.in:1645: can't open file "package/gamin/Config.in"
  make: *** [Makefile:1027: raspberrypi2_defconfig] Error 1

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 09347f7944..20585d53d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1642,7 +1642,6 @@ endif
 endmenu
 
 menu "Filesystem"
-	source "package/gamin/Config.in"
 	source "package/libconfig/Config.in"
 	source "package/libconfuse/Config.in"
 	source "package/libfuse/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
