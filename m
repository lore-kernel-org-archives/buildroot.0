Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAD5C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 22:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EBDA4055F;
	Sun,  4 Feb 2024 22:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EBDA4055F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZKEJrEPEI06; Sun,  4 Feb 2024 22:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AA9F4070B;
	Sun,  4 Feb 2024 22:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AA9F4070B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D88B1BF3A8
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 046FF60B70
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 22:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 046FF60B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9g37HqgnFH24 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D3A560B38
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D3A560B38
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BDE68696E; Sun,  4 Feb 2024 22:34:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:32:00 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 6a23af23dff20d858af4e8bc27588127b80e302a
X-Git-Newrev: 84d9bf5b1863fe5fbd0f9303fe12fed46185fed6
X-Patchwork-Hint: ignore
Message-Id: <20240204223444.2BDE68696E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/flutter-pi: Fix
 help text for gstreamer audio player
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

commit: https://git.buildroot.net/buildroot/commit/?id=84d9bf5b1863fe5fbd0f9303fe12fed46185fed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

The help text is currently copy and pasted from the gstreamer video
player plugin help text. Change it to reflect the text from the
CMakeLists.txt file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7437cad0183fbdc0c419547a0cf2cbe006e23814)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flutter-pi/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 72db3f400f..26ce75fa30 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -32,9 +32,8 @@ config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	help
-	  Include the gstreamer based video plugins in the finished
-	  binary. Allows for more stable, hardware accelerated
-	  video playback in flutter using gstreamer.
+	  Include the gstreamer based audio plugins in the finished
+	  binary.
 
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
 	bool "gstreamer video player"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
