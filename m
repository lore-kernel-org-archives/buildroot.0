Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AC9CF3965
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A00D4416A4;
	Thu, 19 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABV8HaOezJOB; Thu, 19 Sep 2024 19:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BA8F415FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BA8F415FF;
	Thu, 19 Sep 2024 19:58:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CEE431BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75E742B15
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9SlyJNkpxJAc for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C3B042B1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C3B042B1A
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7505083CF7; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: bc473b79910504e79695c0a4e2eb0d8846e4d633
X-Git-Newrev: 81c5d9e6bad4ea074283f91d13dfae87bd2d8e59
X-Patchwork-Hint: ignore
Message-Id: <20240919195837.7505083CF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/keepalived: fix
 summarize typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=81c5d9e6bad4ea074283f91d13dfae87bd2d8e59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c21f235838f66a08f927570d398012297ffe251d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/keepalived/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index 2a0663fed0..98512912fd 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_KEEPALIVED
 	  checks. Keepalived implements a framework based on three
 	  family checks: Layer3, Layer4 & Layer5. This framework gives
 	  the daemon the ability of checking a LVS server pool
-	  states. Keepalived can be sumarize as a LVS driving daemon.
+	  states. Keepalived can be summarized as a LVS driving daemon.
 
 	  http://www.keepalived.org/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
