Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FBBC4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4EBB4365B;
	Thu, 30 Nov 2023 23:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4EBB4365B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNFMnmpe97JT; Thu, 30 Nov 2023 23:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51AC843688;
	Thu, 30 Nov 2023 23:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51AC843688
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5619E1BF995
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 235EA846E6
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 235EA846E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_yxAfmglEli for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FC83846E3
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FC83846E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC8D8766F; Thu, 30 Nov 2023 23:04:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:41:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 178f44b18fe1ead04d32c4a5e3915e5a5ac4b8eb
X-Git-Newrev: be0ceaef5623ae67d69fa1b830dd4a35d21dc4f4
X-Patchwork-Hint: ignore
Message-Id: <20231130230401.1DC8D8766F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] docs/website: fix favicon
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

commit: https://git.buildroot.net/buildroot/commit/?id=be0ceaef5623ae67d69fa1b830dd4a35d21dc4f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

When the favicon image was added in f26e61319f3f (docs/website: add
favicon.png), it was added to a different directory then where the header's
icon link points. This causes the favicon to fail to load with 404.

While we are here, remove the "shortcut" rel attribute as it is non-standard
and it's recommended not to use it[1].

[1] https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rel#sect4

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ad1a2eaa5fa6c5eaa6614b007b968223e49448e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/header.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/header.html b/docs/website/header.html
index e1909291f6..548ed7ad53 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -6,7 +6,7 @@
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<meta name="Buildroot" content="">
 	<meta name="angelo.compagnucci@gmail.com" content="">
-	<link rel="shortcut icon" href="images/favicon.png">
+	<link rel="icon" href="favicon.png">
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
