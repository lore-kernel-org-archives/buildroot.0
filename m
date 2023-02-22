Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD27C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A733E416FF;
	Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A733E416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PHKMt0dTzbBK; Wed, 22 Feb 2023 16:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE7F416F6;
	Wed, 22 Feb 2023 16:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEE7F416F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB00A1BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A232D611E4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A232D611E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fk9ioy10i58N for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:35:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C32DD611E3
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C32DD611E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB933867CA; Wed, 22 Feb 2023 16:35:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:29:07 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 39d4aaf32f4147ac2bccc8fe290753e3e6761b43
X-Git-Newrev: 9292cf956b1ef5f7cda75fc3cbf140611360640c
X-Patchwork-Hint: ignore
Message-Id: <20230222163514.AB933867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/netopeer2: fix
 sysv init script, does not start
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

commit: https://git.buildroot.net/buildroot/commit/?id=9292cf956b1ef5f7cda75fc3cbf140611360640c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- The netopeer server forks to background by default, no need for '-b'
 - The path to the daemon is /usr/sbin, not /usr/bin

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Acked-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ddc29708d3c82f2f6055b596e484a6d963a6eae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netopeer2/S52netopeer2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2
index cf53a8f109..cadd6b9feb 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2
@@ -8,7 +8,7 @@ NETOPEER2_SERVER_ARGS=""
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 
-	start-stop-daemon -S -b -q -p $PIDFILE -x "/usr/bin/$DAEMON" \
+	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
