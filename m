Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93018C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56718400D8;
	Mon, 15 Jul 2024 14:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LfZYywwITelE; Mon, 15 Jul 2024 14:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 130A840608
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 130A840608;
	Mon, 15 Jul 2024 14:26:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C320D1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0F5060747
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KavRQJ369wiQ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9160160727
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9160160727
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:26:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 883DE86B51; Mon, 15 Jul 2024 14:26:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 16:25:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6889056f1eb4293de67c28b1ff6ee34be05d2ee4
X-Git-Newrev: 64fb66537bfddd197d09549b007a7f8b29a3507f
X-Patchwork-Hint: ignore
Message-Id: <20240715142630.883DE86B51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: fix make help
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
Content-Type: multipart/mixed; boundary="===============1953600543901653166=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1953600543901653166==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=64fb66537bfddd197d09549b007a7f8b29a3507f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing ' to fix `make help'.

This fixes the following error:

  /bin/bash: -c: line 1: unexpected EOF while looking for matching `''
  make: *** [Makefile:1180: help] Error 2

Fixes: ca6c896bdd75cf334ac9a02a6dd786415221f55e
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Steve Hay <me@stevenhay.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index faaf0f165c..0432a014ab 100644
--- a/Makefile
+++ b/Makefile
@@ -1177,7 +1177,7 @@ help:
 	@echo '  <pkg>-graph-rdepends   - Generate a graph of <pkg>'\''s reverse dependencies'
 	@echo '  <pkg>-graph-both-depends'
 	@echo '                         - Generate a graph of both <pkg>'\''s forward and'
-	@echo '                           reverse dependencies.
+	@echo '                           reverse dependencies.'
 	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
 	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
 	@echo '  <pkg>-rebuild          - Restart the build from the build step'

--===============1953600543901653166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1953600543901653166==--
