Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA56C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 22:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F025402F2;
	Sun,  4 Feb 2024 22:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F025402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o7BYLmHgtWpw; Sun,  4 Feb 2024 22:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E6B6408AF;
	Sun,  4 Feb 2024 22:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6B6408AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6AB281BF3A8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50165402F2
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50165402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wt4_TCfoEDw7 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32C234070B
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32C234070B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FAA78696D; Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:31:45 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: eefe041de30eacce5c0b6e0dcf977b4594819d19
X-Git-Newrev: 6a23af23dff20d858af4e8bc27588127b80e302a
X-Patchwork-Hint: ignore
Message-Id: <20240204223444.1FAA78696D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/flutter-pi:
 remove libgles requirement for gstreamer audio plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a23af23dff20d858af4e8bc27588127b80e302a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 99a50a8c9804 (package/flutter-pi: new package) erroneously made
the gstreamer-based audio plugin depend on GLES, although there is no
such requirement defined in the CMakeLists. This error was likely due to
a copy/paste mistake.

Remove the requirement.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 07c1329814baea1057355525394d51c290acc4c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-pi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index ecebfad89b..72db3f400f 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -25,7 +25,6 @@ comment "plugins"
 
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
