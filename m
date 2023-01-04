Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6589C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:07:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538A34EF15;
	Tue, 21 Feb 2023 00:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 538A34EF15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojA5l3MqC__X; Tue, 21 Feb 2023 00:06:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03CC74EF69;
	Tue, 21 Feb 2023 00:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03CC74EF69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9C5A1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928706FA94
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 928706FA94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UInYjDnE7_yx for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4EA96F9E8
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4EA96F9E8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9566286495; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:27:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aa2b795b2e48663cb2924a35e22fb47071ef9531
X-Git-Newrev: 3e41117c64cada4a06fcb20fd17517354a42e948
X-Patchwork-Hint: ignore
Message-Id: <20230220205224.9566286495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/minetest{-game}: bump
 to version 5.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e41117c64cada4a06fcb20fd17517354a42e948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release announcement:
5.6.0: https://forum.minetest.net/viewtopic.php?f=18&t=28511
5.6.1: https://forum.minetest.net/viewtopic.php?f=18&t=28703

minetest:
- Update license file hash due to new image file in the project sources.
- IrrlichtMt 1.9.0mt8 is required to build Minetest >= 5.6.1.
- Add xlib_libXi dependency for xinput2 support enabled by default for Linux.
- Remove xlib_libXxf86vm dependency previously used by gamma ramp code [1].

[1] https://github.com/minetest/irrlicht/commit/538c9e5cde425ecee1e802fd53344111683b60be

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minetest-game/minetest-game.hash | 2 +-
 package/minetest-game/minetest-game.mk   | 2 +-
 package/minetest/Config.in               | 2 +-
 package/minetest/minetest.hash           | 6 +++---
 package/minetest/minetest.mk             | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/minetest-game/minetest-game.hash b/package/minetest-game/minetest-game.hash
index 2b7eeffd8f..629871edbe 100644
--- a/package/minetest-game/minetest-game.hash
+++ b/package/minetest-game/minetest-game.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5a24fec4ed838744906f020096c35616e7ba76eeec2b93b980a40af011107e7c  minetest-game-5.5.1.tar.gz
+sha256  5dc857003d24bb489f126865fcd6bf0d9c0cb146ca4c1c733570699d15abd0e3  minetest-game-5.6.1.tar.gz
 
 sha256  f8a254e8d5f6b3ca3873f990986e86c864f943aa5dc9bf56808c5f4bfa509db0  LICENSE.txt
 sha256  ed2afed388c470e08edc1104e4ff6d12b68a32a76b8c52d760a99d4d2d7716f3  mods/beds/license.txt
diff --git a/package/minetest-game/minetest-game.mk b/package/minetest-game/minetest-game.mk
index e5ee45b6ab..ec8d5bff26 100644
--- a/package/minetest-game/minetest-game.mk
+++ b/package/minetest-game/minetest-game.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_GAME_VERSION = 5.5.1
+MINETEST_GAME_VERSION = 5.6.1
 MINETEST_GAME_SITE = $(call github,minetest,minetest_game,$(MINETEST_GAME_VERSION))
 MINETEST_GAME_LICENSE = LGPL-2.1+ (code), CC-BY-SA-2.0, CC-BY-SA-3.0, \
 	CC-BY-SA-4.0, MIT, CC0 1.0, CC-BY-2.0 (mods)
diff --git a/package/minetest/Config.in b/package/minetest/Config.in
index 3e331dff7e..4e139ac3e2 100644
--- a/package/minetest/Config.in
+++ b/package/minetest/Config.in
@@ -28,7 +28,7 @@ config BR2_PACKAGE_MINETEST_CLIENT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_XLIB_LIBXXF86VM
+	select BR2_PACKAGE_XLIB_LIBXI
 	help
 	  Build Minetest client.
 
diff --git a/package/minetest/minetest.hash b/package/minetest/minetest.hash
index e78f865969..ec67d4136d 100644
--- a/package/minetest/minetest.hash
+++ b/package/minetest/minetest.hash
@@ -1,6 +1,6 @@
 # Locally calculated
-sha256  dc0ae5188ef351db85c38b27f38f8549b133ed82aa46daea6deee148aa3454f4  minetest-5.5.1.tar.gz
-sha256  6d38dd7f3e3c8d768e1f5776b98dd5359b184c2e6740ddf733f4dc8615191bef  irrlicht-1.9.0mt5.tar.gz
+sha256  1440603e19dca70e2691e86a74c822ee2c4a36fceee32b2d85ae74772149e9a3  minetest-5.6.1.tar.gz
+sha256  27594242da8c7cc1e5ef45922e1dfdd130c37d77719b5d927359eb47992051e0  irrlicht-1.9.0mt8.tar.gz
 
-sha256  d1d8a63f7f70d89a3a899f3b9fb5ca1ea7dbbd4eb449be2a7b2ff861b1f09192  LICENSE.txt
+sha256  b38c8d428ceddf8e9b49dca63610c74499d952895d756b7eab5f5d4cef2954f6  LICENSE.txt
 sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  lib/irrlichtmt/doc/irrlicht-license.txt
diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 6d56c3222f..3904bd687c 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINETEST_VERSION = 5.5.1
+MINETEST_VERSION = 5.6.1
 MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))
 MINETEST_LICENSE = LGPL-2.1+ (code), CC-BY-SA-3.0 (textures and sounds), Zlib (irrlicht)
 MINETEST_LICENSE_FILES = LICENSE.txt lib/irrlichtmt/doc/irrlicht-license.txt
@@ -12,7 +12,7 @@ MINETEST_CPE_ID_VENDOR = minetest
 
 MINETEST_DEPENDENCIES = gmp jsoncpp luajit sqlite zlib zstd
 
-MINETEST_IRRLICHTMT_VERSION = 1.9.0mt5
+MINETEST_IRRLICHTMT_VERSION = 1.9.0mt8
 MINETEST_EXTRA_DOWNLOADS = $(call github,minetest,irrlicht,$(MINETEST_IRRLICHTMT_VERSION))/irrlicht-$(MINETEST_IRRLICHTMT_VERSION).tar.gz
 
 define MINETEST_IRRLICHTMT_EXTRACT
@@ -36,7 +36,7 @@ MINETEST_CONF_OPTS = \
 	-DBUILD_UNITTESTS=OFF
 
 ifeq ($(BR2_PACKAGE_MINETEST_CLIENT),y)
-MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXxf86vm
+MINETEST_DEPENDENCIES += bzip2 freetype jpeg libgl libpng xlib_libXi
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=ON
 else
 MINETEST_CONF_OPTS += -DBUILD_CLIENT=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
