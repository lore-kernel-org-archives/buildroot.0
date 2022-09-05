Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE5ECAAD3
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 19:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66A458140C;
	Mon,  5 Sep 2022 19:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A458140C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFEuNOOfCz-2; Mon,  5 Sep 2022 19:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77F45813DE;
	Mon,  5 Sep 2022 19:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77F45813DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8CE1BF37E
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55D4C40253
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 19:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55D4C40253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dEa95REAmQt8 for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 19:05:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 709CF40162
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 19:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 709CF40162
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C4C6B8822D; Mon,  5 Sep 2022 18:50:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Sep 2022 21:00:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc9cac446e606c4fcb5a4c86fbe99e48a76eae5
X-Git-Newrev: f73718ce5efe2cfda8bd3c8fc7cc72e30b2b10f1
X-Patchwork-Hint: ignore
Message-Id: <20220905185023.C4C6B8822D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcpcd: fix pid path
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

commit: https://git.buildroot.net/buildroot/commit/?id=f73718ce5efe2cfda8bd3c8fc7cc72e30b2b10f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the README:
    dhcpcd-9 defaults the run directory to `/var/run/dhcpcd` instead of
    `/var/run` and the prefix of dhcpcd has been removed from the files.

Make it so.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dhcpcd/S41dhcpcd      | 2 +-
 package/dhcpcd/dhcpcd.service | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/S41dhcpcd b/package/dhcpcd/S41dhcpcd
index 3e5c22f715..55794f4075 100644
--- a/package/dhcpcd/S41dhcpcd
+++ b/package/dhcpcd/S41dhcpcd
@@ -5,7 +5,7 @@
 
 DAEMON=/sbin/dhcpcd
 CONFIG=/etc/dhcpcd.conf
-PIDFILE=/var/run/dhcpcd.pid
+PIDFILE=/var/run/dhcpcd/pid
 
 [ -f $CONFIG ] || exit 0
 
diff --git a/package/dhcpcd/dhcpcd.service b/package/dhcpcd/dhcpcd.service
index e648092c9b..4da49818a7 100644
--- a/package/dhcpcd/dhcpcd.service
+++ b/package/dhcpcd/dhcpcd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 EnvironmentFile=-/etc/default/dhcpcd
-PIDFile=/run/dhcpcd.pid
+PIDFile=/run/dhcpcd/pid
 ExecStart=/sbin/dhcpcd $DAEMON_ARGS
 Restart=always
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
