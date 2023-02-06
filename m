Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3DEC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5A47000F;
	Tue, 21 Feb 2023 01:31:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5A47000F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSGFE6s2Gh99; Tue, 21 Feb 2023 01:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7659B6FB57;
	Tue, 21 Feb 2023 01:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7659B6FB57
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 929A01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433116FC17
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433116FC17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rs-SpSjdunmp for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84F466FBF9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84F466FBF9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 831AA81979; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 11:59:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 06646238303b974e4bce81143a6c022fdf790568
X-Git-Newrev: 101b05a37479c31e397cdabad06e346665c93eba
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.831AA81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: better recent
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
