Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F51C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4627A406F5;
	Tue, 19 Mar 2024 12:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MlL9PNpve1-z; Tue, 19 Mar 2024 12:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32929406EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32929406EE;
	Tue, 19 Mar 2024 12:22:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1845D1BF95F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0599E40BAC
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UePHPXuMueDi for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 496D640192
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 496D640192
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34B0682BDB; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:05:39 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c96e497fa212e9af4bfa00970aea12217c2f3cd2
X-Git-Newrev: 0f15942e9094ca4d200ba8a7e1e799a566282dcb
X-Patchwork-Hint: ignore
Message-Id: <20240319122222.34B0682BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/sdl2: drop
 video-x11-{xinerama, vm}
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f15942e9094ca4d200ba8a7e1e799a566282dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Support has been dropped since the major release 2.24.0:
https://github.com/libsdl-org/SDL/commit/7d7ec9c95146c44d4b4643ed552796bf07937057

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1692f2514a48ee369e09753007e9c67ff90daaf3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 42b4a433e8..eb5042e3cd 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -112,13 +112,6 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-xcursor
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
-SDL2_DEPENDENCIES += xlib_libXinerama
-SDL2_CONF_OPTS += --enable-video-x11-xinerama
-else
-SDL2_CONF_OPTS += --disable-video-x11-xinerama
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 SDL2_DEPENDENCIES += xlib_libXi
 SDL2_CONF_OPTS += --enable-video-x11-xinput
@@ -140,13 +133,6 @@ else
 SDL2_CONF_OPTS += --disable-video-x11-scrnsaver
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
-SDL2_DEPENDENCIES += xlib_libXxf86vm
-SDL2_CONF_OPTS += --enable-video-x11-vm
-else
-SDL2_CONF_OPTS += --disable-video-x11-vm
-endif
-
 else
 SDL2_CONF_OPTS += --disable-video-x11 --without-x
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
