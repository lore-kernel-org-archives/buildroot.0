Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4420C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884F540708;
	Tue, 19 Mar 2024 12:23:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxIOkYPPUPLJ; Tue, 19 Mar 2024 12:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39CAE4072F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39CAE4072F;
	Tue, 19 Mar 2024 12:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF7E1BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2BCD81E7A
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X5a3O52ekF4S for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 821AC81E76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821AC81E76
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 706EB835A4; Tue, 19 Mar 2024 12:23:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:05:30 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9acadac3e74004a34de185d607df67c516fe67c9
X-Git-Newrev: b726ccc0c9ab479ec1b889e6b6e304e9c2539655
X-Patchwork-Hint: ignore
Message-Id: <20240319122332.706EB835A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sdl2: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=b726ccc0c9ab479ec1b889e6b6e304e9c2539655
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 4e7494b3d2..768decce35 100644
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
