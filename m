Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACFCC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E12ED60B3B;
	Sun, 18 Sep 2022 09:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E12ED60B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w_BDBK95aG9p; Sun, 18 Sep 2022 09:34:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE6660E2E;
	Sun, 18 Sep 2022 09:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE6660E2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60BBD1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 492CD4181D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492CD4181D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LELr71YdKbFi for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FD6E402B2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD6E402B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CF9484A5B; Sun, 18 Sep 2022 09:33:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:49:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: e8e4dbe915e5d7c6eb317d894e551e318b899a2a
X-Git-Newrev: 7d9e9e631cffbd6d195914bacc332d90efde01af
X-Patchwork-Hint: ignore
Message-Id: <20220918093346.2CF9484A5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/dhcpcd: fix pid
 path
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d9e9e631cffbd6d195914bacc332d90efde01af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

From the README:
    dhcpcd-9 defaults the run directory to `/var/run/dhcpcd` instead of
    `/var/run` and the prefix of dhcpcd has been removed from the files.

Make it so.

Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f73718ce5efe2cfda8bd3c8fc7cc72e30b2b10f1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
