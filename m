Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46959C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 955A8404E7;
	Sat, 20 Jan 2024 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955A8404E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYPz0oSeYYYv; Sat, 20 Jan 2024 21:43:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B98DA402AB;
	Sat, 20 Jan 2024 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B98DA402AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FC371BF861
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A6C160F2D
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6C160F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvbMZj_cAoq2 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46C5B60B45
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46C5B60B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CBD986306; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:41:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37809258fc014d743f7becbc5ba256234d807bd7
X-Git-Newrev: 4eb0fd66a87cdbc76495dfcdf1de29bed98db739
X-Patchwork-Hint: ignore
Message-Id: <20240120214300.2CBD986306@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: add
 standard_method_codec.h to keyboard manager plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=4eb0fd66a87cdbc76495dfcdf1de29bed98db739
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The keyboard manager plugin is also missing the flutter/standard_method_codec.h
header.

  - Add shell/plugins/keyboard_manager/keyboard_manager.h to the patch.

  - Rename the patch to
    0001-add-missing-headers-to-the-audio-players-and-keyboar.patch

Upstream pull request updated as well.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...headers-to-the-audio-players-and-keyboar.patch} | 26 ++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
similarity index 77%
rename from package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
rename to package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
index c26fdba7f2..0d308b786b 100644
--- a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
+++ b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
@@ -1,7 +1,8 @@
 From 7e35ea4fbd94a1604907069bb9cc2e2dff4b43c7 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <adam.duskett@amarulasolutions.com>
 Date: Sat, 6 Jan 2024 14:18:56 -0700
-Subject: [PATCH] add missing headers to the audio-players plugin
+Subject: [PATCH] add missing headers to the audio-players and keyboard_manager
+ plugin
 
 Fixes flutter::StandardMethodCodec not being declared on the following lines:
 plugins/audio_players/audio_players_registry.cc:83
@@ -9,6 +10,7 @@ plugins/audio_players/audio_players_registry.cc:94
 plugins/audio_players/audio_players_registry.cc:152
 plugins/audio_players/audio_player.cc:257
 plugins/audio_players/audio_player.cc:623
+plugins/keyboard_manager/keyboard_manager.cc:25
 
 Upstream: https://github.com/toyota-connected/ivi-homescreen/pull/133
 
@@ -17,7 +19,8 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  shell/plugins/audio_players/audio_player.cc           | 3 ++-
  shell/plugins/audio_players/audio_players.cc          | 4 +++-
  shell/plugins/audio_players/audio_players_registry.cc | 3 ++-
- 3 files changed, 7 insertions(+), 3 deletions(-)
+ shell/plugins/keyboard_manager/keyboard_manager.h     | 3 ++-
+ 4 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/shell/plugins/audio_players/audio_player.cc b/shell/plugins/audio_players/audio_player.cc
 index 56027eb..a85e9ae 100644
@@ -77,6 +80,25 @@ index 6c9ef33..00c4f45 100644
 -}  // namespace Plugins
 \ No newline at end of file
 +}  // namespace Plugins
+diff --git a/shell/plugins/keyboard_manager/keyboard_manager.h b/shell/plugins/keyboard_manager/keyboard_manager.h
+index 74b4e8d..cae1954 100644
+--- a/shell/plugins/keyboard_manager/keyboard_manager.h
++++ b/shell/plugins/keyboard_manager/keyboard_manager.h
+@@ -17,6 +17,7 @@
+ #pragma once
+ 
+ #include "flutter/fml/macros.h"
++#include <flutter/standard_method_codec.h>
+ 
+ #include <shell/platform/embedder/embedder.h>
+ 
+@@ -45,4 +46,4 @@ class KeyboardManager {
+ 
+  private:
+   static constexpr char kGetKeyboardState[] = "getKeyboardState";
+-};
+\ No newline at end of file
++};
 -- 
 2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
