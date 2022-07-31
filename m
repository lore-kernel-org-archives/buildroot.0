Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D69C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 06:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35BC241817;
	Sun, 31 Jul 2022 06:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35BC241817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUpm7JLVaUkK; Sun, 31 Jul 2022 06:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35534189E;
	Sun, 31 Jul 2022 06:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35534189E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5941BF5A0
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570A860E4D
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 06:27:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570A860E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZeJJrxQAEh15 for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 06:27:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C2D960B33
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 06:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C2D960B33
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ED10286ABD; Sun, 31 Jul 2022 06:13:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 08:25:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: a19bd265d59113cc6976e113fff55961a5c914e8
X-Git-Newrev: 135672d723a223f79ff3cedb4886ae552245c5e5
X-Patchwork-Hint: ignore
Message-Id: <20220731061318.ED10286ABD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/Config.in: move
 pipewire to 'Audio and video applications'
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

commit: https://git.buildroot.net/buildroot/commit/?id=135672d723a223f79ff3cedb4886ae552245c5e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The previous location 'Libraries / Graphics' does not fit the purpose
of this package, we display it next to Pulseaudio instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c38ea2e43a90b7cc5e0c6ab6c3c44513f94ff2e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 00f061015f..f7215f45dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -47,6 +47,8 @@ menu "Audio and video applications"
 	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
+	source "package/pipewire/Config.in"
+	source "package/pipewire-media-session/Config.in"
 	source "package/pulseaudio/Config.in"
 	source "package/sox/Config.in"
 	source "package/squeezelite/Config.in"
@@ -1557,8 +1559,6 @@ menu "Graphics"
 	source "package/openjpeg/Config.in"
 	source "package/pango/Config.in"
 	source "package/pangomm/Config.in"
-	source "package/pipewire/Config.in"
-	source "package/pipewire-media-session/Config.in"
 	source "package/pixman/Config.in"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
