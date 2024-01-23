Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CF8C47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 20:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 226F1419B5;
	Tue, 23 Jan 2024 20:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 226F1419B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN9keeNigGsp; Tue, 23 Jan 2024 20:34:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61B7040642;
	Tue, 23 Jan 2024 20:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61B7040642
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0625A1BF95C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0DED405D8
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DED405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QddkEqGlok0 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 20:34:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7DAB40445
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 20:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7DAB40445
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2B9E86432; Tue, 23 Jan 2024 20:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 21:28:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b8b1125adcdb3563a8392e802f0fb5266142e93
X-Git-Newrev: 07c1329814baea1057355525394d51c290acc4c3
X-Patchwork-Hint: ignore
Message-Id: <20240123203442.C2B9E86432@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-pi: remove libgles
 requirement for gstreamer audio plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=07c1329814baea1057355525394d51c290acc4c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 99a50a8c9804 (package/flutter-pi: new package) erroneously made
the gstreamer-based audio plugin depend on GLES, although there is no
such requirement defined in the CMakeLists. This error was likely due to
a copy/paste mistake.

Remove the requirement.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-pi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index bb0e3702c1..95b5525806 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -47,7 +47,6 @@ config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
 
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	bool "gstreamer audio player"
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
