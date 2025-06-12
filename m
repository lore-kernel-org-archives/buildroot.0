Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1708C71149
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 875DF40B94;
	Thu, 12 Jun 2025 20:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkvKnlm-tExE; Thu, 12 Jun 2025 20:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B76C740B8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B76C740B8A;
	Thu, 12 Jun 2025 20:13:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01C9B1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A22E4097F
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTT8fjO50rAM for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9851B4097B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9851B4097B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 967B78354A; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 190426a830ca0c9bc15dd4dce2772483a058c1fd
X-Git-Newrev: 77eda2778ddca5b93e1122934d3bf10e0b87bccc
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.967B78354A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/busybox: fix path
 for crond binary in S50crond during stop
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

commit: https://git.buildroot.net/buildroot/commit/?id=77eda2778ddca5b93e1122934d3bf10e0b87bccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4ee019524109f6246d592befb0b0d8f6efb306f5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/busybox/S50crond | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/S50crond b/package/busybox/S50crond
index 74a0c0849b..7083a36cb0 100644
--- a/package/busybox/S50crond
+++ b/package/busybox/S50crond
@@ -36,7 +36,7 @@ stop() {
 		echo "FAIL"
 	fi
 	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
-		--exec "/sbin/$DAEMON"; do
+		--exec "/usr/sbin/$DAEMON"; do
 		sleep 0.1
 	done
 	rm -f "$PIDFILE"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
