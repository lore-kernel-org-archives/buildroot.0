Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A05C3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 08:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 882F640C82;
	Wed, 17 Jul 2024 08:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edeGQ-rSGd9E; Wed, 17 Jul 2024 08:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7707340C20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7707340C20;
	Wed, 17 Jul 2024 08:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B68A01BF3A6
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 08:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0DFB40778
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 08:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MJZCkFt69mat for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 08:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A637540395
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A637540395
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 08:56:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 236C486A0C; Wed, 17 Jul 2024 08:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 10:55:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dc115478e77998488aa88eaac152022ac9fce36
X-Git-Newrev: cd7c8a2528cf81cef27b4fa7170f6f1f880bf148
X-Patchwork-Hint: ignore
Message-Id: <20240717085605.236C486A0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: fix typo in init script
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd7c8a2528cf81cef27b4fa7170f6f1f880bf148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that the sshd init script is nice & new & shiny, fix an ancient
typo, introduced with commit e0fc615 (add runlevel script for later use)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/S50sshd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 56db6ebff9..7e5ccf079d 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -6,7 +6,7 @@
 DAEMON="sshd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-# Make sure the ssh-keygen progam exists
+# Make sure the ssh-keygen program exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
 umask 077
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
