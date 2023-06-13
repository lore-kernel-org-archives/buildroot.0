Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6C8EB64D7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 21:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D854097F;
	Tue, 13 Jun 2023 21:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29D854097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPH12KKcLIzR; Tue, 13 Jun 2023 21:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BDA34098F;
	Tue, 13 Jun 2023 21:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BDA34098F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B84D71BF2A6
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9106D61100
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 21:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9106D61100
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPzkOKURnXzO for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6132760A9F
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6132760A9F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F04782D95; Tue, 13 Jun 2023 21:51:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 23:31:58 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 98e72152960472723f7e041615ec54c0c8d25a02
X-Git-Newrev: 1e2f14d750ff4115f20ae5c2543b0002503da71d
X-Patchwork-Hint: ignore
Message-Id: <20230613215158.4F04782D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sdl2_mixer: fix
 license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=1e2f14d750ff4115f20ae5c2543b0002503da71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 4f4fb695a47cb50a0645a68aa03e27bdb3d73afe)
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
