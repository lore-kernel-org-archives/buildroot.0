Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F683C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAE9E60ED6;
	Sat, 13 Jan 2024 20:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAE9E60ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtTlZnsPRI2v; Sat, 13 Jan 2024 20:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5F160BAA;
	Sat, 13 Jan 2024 20:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5F160BAA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC4C71BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A1D83B69
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A1D83B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JitNpZZAPf8D for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC9B983B40
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC9B983B40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCC148605F; Sat, 13 Jan 2024 20:33:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 21:16:49 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 58a3ae71a65685a81d1b5a445cb1030ad605df05
X-Git-Newrev: 005014ccf3868eb8213da21a41660546a2123d5a
X-Patchwork-Hint: ignore
Message-Id: <20240113203307.CCC148605F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/Config.in: move
 flutter-pi
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

commit: https://git.buildroot.net/buildroot/commit/?id=005014ccf3868eb8213da21a41660546a2123d5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

flutter-pi was erroneously placed under the "Graphic libraries" section
of the menu "Graphic libraries and applications (graphic/text)" menu.
However, as flutter-pi is an application that runs graphic applicaitons
it is better suited to be placed under the "Graphic applications"
section.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1a2ae469d0c9d548c091f731748e01039dd4f2a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 5a3410d758..4bf55d21ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
@@ -346,7 +347,6 @@ comment "Graphic libraries"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/flutter-gallery/Config.in"
-	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
