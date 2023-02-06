Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F8C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 856054160B;
	Mon,  6 Feb 2023 11:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 856054160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsdttdnb-tc3; Mon,  6 Feb 2023 11:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 897B64159F;
	Mon,  6 Feb 2023 11:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 897B64159F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 90CC61BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A2A81760
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68A2A81760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z5OOzBwr8aNu for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:00:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEAA08175E
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEAA08175E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F06883987; Mon,  6 Feb 2023 11:00:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06646238303b974e4bce81143a6c022fdf790568
X-Git-Newrev: 101b05a37479c31e397cdabad06e346665c93eba
X-Patchwork-Hint: ignore
Message-Id: <20230206110019.9F06883987@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: better recent
 commits/discussions output
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

commit: https://git.buildroot.net/buildroot/commit/?id=101b05a37479c31e397cdabad06e346665c93eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing the "[Buildroot]" and the "Re:" from messages title to have a
cleaner look on the "news" boxes.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 288e3e745c..b2975fb609 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -19,6 +19,8 @@ function display_activity(result, activity) {
         let link = document.createElement("a");
         let d = new Date(entry.updated);
         let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
+        data = data.replace("Re: ","");
+        data = data.replace("[Buildroot] ","");
         let text = document.createTextNode(data);
         link.appendChild(text);
         link.title = entry.title;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
