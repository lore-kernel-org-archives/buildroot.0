Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2576C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 15:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A48F41D8C;
	Mon, 15 May 2023 15:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A48F41D8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nd-ies7Ppevv; Mon, 15 May 2023 15:53:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA3F441D9D;
	Mon, 15 May 2023 15:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA3F441D9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2021BF573
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7E9D83B67
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7E9D83B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hm6-8HLBKMxN for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 15:53:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1046783B65
 for <buildroot@buildroot.org>; Mon, 15 May 2023 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1046783B65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0A4A86704; Mon, 15 May 2023 15:53:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 17:51:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb6fe5ddf613faf8b6278fdf8ece6059ea825932
X-Git-Newrev: 4f4fb695a47cb50a0645a68aa03e27bdb3d73afe
X-Patchwork-Hint: ignore
Message-Id: <20230515155320.F0A4A86704@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_mixer: fix license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f4fb695a47cb50a0645a68aa03e27bdb3d73afe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

b1b8d5b ("package/sdl2_mixer: bump version to 2.6.3") forgot to update
the hash of the license file.
In 2021 the file was renamed from COPYING.txt to LICENSE.txt in two
commits ([0] and [1]). The copyright year was subsequently updated for
2022 [2] and 2023 [3].
License is still Zlib - no changes there.

[0]: https://github.com/libsdl-org/SDL_mixer/commit/0f84f242643a913ba81bd6c260c39064c432afd3
[1]: https://github.com/libsdl-org/SDL_mixer/commit/371bf1575913828c46212e9220d4a4685ed66bb5
[2]: https://github.com/libsdl-org/SDL_mixer/commit/3f5a0502e0394aa967179d53e180f31cf038e032
[3]: https://github.com/libsdl-org/SDL_mixer/commit/6fdd4d469b4065ddfb701530d2ea602efaa772b2

Fixes:
 - http://autobuild.buildroot.net/results/302cbd0adc2c6190d8923b9449e26a3c519d2326

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_mixer/sdl2_mixer.hash | 2 +-
 package/sdl2_mixer/sdl2_mixer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_mixer/sdl2_mixer.hash b/package/sdl2_mixer/sdl2_mixer.hash
index 98c5fda6af..4592014d7f 100644
--- a/package/sdl2_mixer/sdl2_mixer.hash
+++ b/package/sdl2_mixer/sdl2_mixer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  7a6ba86a478648ce617e3a5e9277181bc67f7ce9876605eea6affd4a0d6eea8f  SDL2_mixer-2.6.3.tar.gz
-sha256  113727180e7956cb9718b03b41da85b63ea54743a33047071a623bf672895a10  COPYING.txt
+sha256  1852c8549e3d154687197d46abababd3e8faae035f19991b2ca850fa3a43ad57  LICENSE.txt
diff --git a/package/sdl2_mixer/sdl2_mixer.mk b/package/sdl2_mixer/sdl2_mixer.mk
index 425380bf5d..074e282205 100644
--- a/package/sdl2_mixer/sdl2_mixer.mk
+++ b/package/sdl2_mixer/sdl2_mixer.mk
@@ -8,7 +8,7 @@ SDL2_MIXER_VERSION = 2.6.3
 SDL2_MIXER_SOURCE = SDL2_mixer-$(SDL2_MIXER_VERSION).tar.gz
 SDL2_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL2_MIXER_LICENSE = Zlib
-SDL2_MIXER_LICENSE_FILES = COPYING.txt
+SDL2_MIXER_LICENSE_FILES = LICENSE.txt
 SDL2_MIXER_INSTALL_STAGING = YES
 SDL2_MIXER_DEPENDENCIES = sdl2 host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
