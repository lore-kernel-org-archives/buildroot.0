Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2F3C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 14:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96C180F3A;
	Sun,  1 Jun 2025 14:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8PWwmn_jFK9l; Sun,  1 Jun 2025 14:49:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35DCB80E27
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35DCB80E27;
	Sun,  1 Jun 2025 14:49:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A154E127
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92C3360B0B
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4wKzzsXb76M for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 14:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C605B60AEE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C605B60AEE
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 14:49:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1D4087817; Sun,  1 Jun 2025 14:49:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Jun 2025 16:47:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b877b8379fd3569dce94d0b0248cd2591ce4a71c
X-Git-Newrev: 4ee019524109f6246d592befb0b0d8f6efb306f5
X-Patchwork-Hint: ignore
Message-Id: <20250601144914.B1D4087817@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: fix path for crond binary
 in S50crond during stop
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ee019524109f6246d592befb0b0d8f6efb306f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
