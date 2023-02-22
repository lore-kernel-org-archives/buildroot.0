Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44373C64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED995416F9;
	Wed, 22 Feb 2023 16:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED995416F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCpFT28Rp4gf; Wed, 22 Feb 2023 16:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6D04416FA;
	Wed, 22 Feb 2023 16:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6D04416FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748B81BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F72B416F6
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F72B416F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGXSo0Tla7bn for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94B5F416F9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B5F416F9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EAB9867CB; Wed, 22 Feb 2023 16:35:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:28:55 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 45f5c85ee5eae562467b84a88b067fc57232952f
X-Git-Newrev: a3fd22e80cdf15465cf2297e8a1817ea79e638fb
X-Patchwork-Hint: ignore
Message-Id: <20230222163531.7EAB9867CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/netopeer2: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3fd22e80cdf15465cf2297e8a1817ea79e638fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

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
