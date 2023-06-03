Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA964C77B73
	for <buildroot@archiver.kernel.org>; Sat,  3 Jun 2023 10:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB8BC4090E;
	Sat,  3 Jun 2023 10:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8BC4090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQa3QCFf7O_l; Sat,  3 Jun 2023 10:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A51D40541;
	Sat,  3 Jun 2023 10:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A51D40541
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 426AC1BF4D7
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 10:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB0F408CA
 for <buildroot@lists.busybox.net>; Sat,  3 Jun 2023 10:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AB0F408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ipkfl3vyS2j for <buildroot@lists.busybox.net>;
 Sat,  3 Jun 2023 10:23:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAAFF40861
 for <buildroot@buildroot.org>; Sat,  3 Jun 2023 10:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAAFF40861
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 966D68414F; Sat,  3 Jun 2023 10:23:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jun 2023 12:18:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7d40576fad6784164b668776d81547edd8fafdd
X-Git-Newrev: e2f4ac35fe338e5adc36b0644ed9040574595496
X-Patchwork-Hint: ignore
Message-Id: <20230603102317.966D68414F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_net: fix license hash after
 2.2.0 bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2f4ac35fe338e5adc36b0644ed9040574595496
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/37e5075a5c790d5c96bdc72c44d4362a16ae00bb/

Commit b41ff7dd46c5 (package/sdl2_net: bump version to 2.2.0) forgot to
update the license hash / filename, breaking the build.

Upstream renamed COPYING.txt to LICENSE.txt, changed white space and updated
the copyright years, so update the hash to match:

diff -uw sdl2_net-2.0.1/COPYING.txt sdl2_net-2.2.0/LICENSE.txt
--- sdl2_net-2.0.1/COPYING.txt  2016-01-03 08:57:09.000000000 +0100
+++ sdl2_net-2.2.0/LICENSE.txt  2022-08-17 18:55:22.000000000 +0200
@@ -1,6 +1,4 @@
-/*
-  SDL_net:  An example cross-platform network library for use with SDL
-  Copyright (C) 1997-2016 Sam Lantinga <slouken@libsdl.org>
+Copyright (C) 1997-2022 Sam Lantinga <slouken@libsdl.org>

   This software is provided 'as-is', without any express or implied
   warranty.  In no event will the authors be held liable for any damages
@@ -17,4 +15,4 @@
   2. Altered source versions must be plainly marked as such, and must not be
      misrepresented as being the original software.
   3. This notice may not be removed or altered from any source distribution.
-*/
+

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_net/sdl2_net.hash | 2 +-
 package/sdl2_net/sdl2_net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
index c614aee255..eac0ac707f 100644
--- a/package/sdl2_net/sdl2_net.hash
+++ b/package/sdl2_net/sdl2_net.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb  SDL2_net-2.2.0.tar.gz
-sha256  f09845a238245402a8b8388db6634d8a5b2c3e1dc098f16f9d8c74a276ef4594  COPYING.txt
+sha256  fcb07e07ac6bc8b2fcf047b50431ef4ebe5b619d7ca7c82212018309a9067426  LICENSE.txt
diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
index 6adf8eb779..85676af081 100644
--- a/package/sdl2_net/sdl2_net.mk
+++ b/package/sdl2_net/sdl2_net.mk
@@ -8,7 +8,7 @@ SDL2_NET_VERSION = 2.2.0
 SDL2_NET_SOURCE = SDL2_net-$(SDL2_NET_VERSION).tar.gz
 SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
 SDL2_NET_LICENSE = Zlib
-SDL2_NET_LICENSE_FILES = COPYING.txt
+SDL2_NET_LICENSE_FILES = LICENSE.txt
 SDL2_NET_INSTALL_STAGING = YES
 SDL2_NET_DEPENDENCIES = sdl2 host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
