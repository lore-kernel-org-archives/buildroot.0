Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F86CC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 13:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE0B760C0A;
	Mon,  5 Dec 2022 13:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0B760C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11z1-K_6gKTE; Mon,  5 Dec 2022 13:20:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BDB460BCC;
	Mon,  5 Dec 2022 13:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BDB460BCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0ACA1BF3E5
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 13:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C09C4047D
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 13:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C09C4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QW2k9T6PGYcE for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 13:20:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04AF440125
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 13:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04AF440125
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E565385C5A; Mon,  5 Dec 2022 13:20:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 14:18:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac96a65a29c73456b7cc8fd707b405e6ca67ac20
X-Git-Newrev: 2313f68e4c56faf9d5366bc3c61d03cf814f5a43
X-Patchwork-Hint: ignore
Message-Id: <20221205132000.E565385C5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2_ttf: fix legal-info after
 bump to 2.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2313f68e4c56faf9d5366bc3c61d03cf814f5a43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 93d8b71371962 (package/sdl2_ttf: bump version to 2.20.1) dropped the
hash for COPYING.txt and added a hash for LICENSE.txt but forgot to adjust
SDL2_TTF_LICENSE_FILES, breaking legal-info:

>>> sdl2_ttf 2.20.1 Collecting legal info
ERROR: No hash found for COPYING.txt
cp: cannot stat '/path/to/output/build/sdl2_ttf-2.20.1/COPYING.txt': No such file or directory
make[1]: *** [package/sdl2_ttf/sdl2_ttf.mk:38: sdl2_ttf-legal-info] Error 1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_ttf/sdl2_ttf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
index 4b44b0fc41..f859d097ff 100644
--- a/package/sdl2_ttf/sdl2_ttf.mk
+++ b/package/sdl2_ttf/sdl2_ttf.mk
@@ -8,7 +8,7 @@ SDL2_TTF_VERSION = 2.20.1
 SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
 SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
 SDL2_TTF_LICENSE = Zlib
-SDL2_TTF_LICENSE_FILES = COPYING.txt
+SDL2_TTF_LICENSE_FILES = LICENSE.txt
 SDL2_TTF_INSTALL_STAGING = YES
 SDL2_TTF_DEPENDENCIES = sdl2 freetype host-pkgconf
 SDL2_TTF_CONF_OPTS = --disable-freetype-builtin --disable-harfbuzz-builtin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
