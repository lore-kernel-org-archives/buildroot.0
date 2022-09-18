Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B62ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBAB607B0;
	Sun, 18 Sep 2022 16:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DBAB607B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzXQqcM5EGke; Sun, 18 Sep 2022 16:08:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE4A160B08;
	Sun, 18 Sep 2022 16:08:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE4A160B08
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30A331BF3FB
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1644C83F85
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1644C83F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bg77UHAlGK5L for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:08:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F21083F6D
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F21083F6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38A45852B4; Sun, 18 Sep 2022 16:08:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 18:06:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa538315dc02ad011edf6a2a9e25f8589100f15f
X-Git-Newrev: b153345beca555164a11dae4f2c77862d4fb76b6
X-Patchwork-Hint: ignore
Message-Id: <20220918160809.38A45852B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/busybox: add -O staticroutes
 options to udhcpc
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

commit: https://git.buildroot.net/buildroot/commit/?id=b153345beca555164a11dae4f2c77862d4fb76b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

udhcpc default script can handle staticroutes but it is missing from the
default ifupdown options.

Signed-off-by: Remi Jouannet <remi.jouannet@outscale.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 137e44c870..e7f628ca6d 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -A3 -b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -A3 -b -R -O search -O staticroutes"
 
 #
 # Print Utilities
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
