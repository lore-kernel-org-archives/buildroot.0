Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E0AC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB85839D8;
	Wed, 10 Jan 2024 22:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BB85839D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLexMLjNTRjB; Wed, 10 Jan 2024 22:46:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71E6583D39;
	Wed, 10 Jan 2024 22:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71E6583D39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA241BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CC342266
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55CC342266
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iacNn-xa8xL for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:46:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5FD342261
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FD342261
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 910BA85E3D; Wed, 10 Jan 2024 22:46:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:43:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a8371e37db63e7dd14ba6ba524df39ce2d58a2e
X-Git-Newrev: 1a2ae469d0c9d548c091f731748e01039dd4f2a4
X-Patchwork-Hint: ignore
Message-Id: <20240110224623.910BA85E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Config.in: move flutter-pi
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a2ae469d0c9d548c091f731748e01039dd4f2a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

flutter-pi was erroneously placed under the "Graphic libraries" section
of the menu "Graphic libraries and applications (graphic/text)" menu.
However, as flutter-pi is an application that runs graphic applicaitons
it is better suited to be placed under the "Graphic applications"
section.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 0009256298..bf5075fabc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,7 @@ comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/dmenu-wayland/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/foot/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
@@ -351,7 +352,6 @@ comment "Graphic libraries"
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
