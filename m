Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F61C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 23:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47FF843668;
	Thu, 30 Nov 2023 23:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47FF843668
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PBiNiF_MKYJ; Thu, 30 Nov 2023 23:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2335A4365B;
	Thu, 30 Nov 2023 23:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2335A4365B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B544B1BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C2916FA3B
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 23:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C2916FA3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LK69-aY1Jmiy for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B868960A77
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B868960A77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6270876B2; Thu, 30 Nov 2023 23:09:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 23:41:46 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 66acf3992eafb85bab31d3070ed41336f4482d79
X-Git-Newrev: 69f4ee8c5a33854f850adbe8c0814d94bf426a86
X-Patchwork-Hint: ignore
Message-Id: <20231130230901.A6270876B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] docs/website: fix favicon
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

commit: https://git.buildroot.net/buildroot/commit/?id=69f4ee8c5a33854f850adbe8c0814d94bf426a86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
