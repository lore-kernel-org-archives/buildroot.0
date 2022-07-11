Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA1C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 06:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C23828B5;
	Mon, 11 Jul 2022 06:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C23828B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faMOCu-zupB6; Mon, 11 Jul 2022 06:49:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED7D828D1;
	Mon, 11 Jul 2022 06:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED7D828D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454BB1BF9A3
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 06:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2034360A89
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 06:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2034360A89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2Ram1JLPZuv for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 06:48:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6961060A6B
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 06:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6961060A6B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8F5D183670; Mon, 11 Jul 2022 06:35:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 08:46:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16e2b05ff1b293ece8210d1ee6bac2af0208f039
X-Git-Newrev: c38ea2e43a90b7cc5e0c6ab6c3c44513f94ff2e3
X-Patchwork-Hint: ignore
Message-Id: <20220711063546.8F5D183670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/Config.in: move pipewire to 'Audio
 and video applications'
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

commit: https://git.buildroot.net/buildroot/commit/?id=c38ea2e43a90b7cc5e0c6ab6c3c44513f94ff2e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous location 'Libraries / Graphics' does not fit the purpose
of this package, we display it next to Pulseaudio instead.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f09da05be0..230aa7a2c2 100644
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
@@ -1559,8 +1561,6 @@ menu "Graphics"
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
