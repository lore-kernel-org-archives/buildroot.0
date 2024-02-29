Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB96FC48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 21:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA1B82A95;
	Thu, 29 Feb 2024 21:59:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3EdyPd4j6iG; Thu, 29 Feb 2024 21:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD23D82B08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD23D82B08;
	Thu, 29 Feb 2024 21:59:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E40D71BF20F
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D118B82B08
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCve3zL6OO9c for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 21:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B3A782A95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B3A782A95
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 21:59:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 256EF87B4A; Thu, 29 Feb 2024 21:59:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 22:53:50 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a9c5e028edb648de8a9ce355d93973dd6c95fbd7
X-Git-Newrev: 9d8292c2291e6ba2741ccc3a166b572a8db64a0c
X-Patchwork-Hint: ignore
Message-Id: <20240229215915.256EF87B4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/sdl2: force arm
 mode instead of Thumb mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d8292c2291e6ba2741ccc3a166b572a8db64a0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix the following build failure in Thumb mode:

/home/autobuild/autobuild/instance-12/output-1/build/sdl2-2.28.5/src/atomic/SDL_atomic.c:292:2: error: #error This file should be built in arm mode so the mcr instruction is available for memory barriers
  292 | #error This file should be built in arm mode so the mcr instruction is available for memory barriers
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/70587e7c2452563d655d054a7623bb2fd969862e
 - http://autobuild.buildroot.org/results/2cb11b1f3c013c1f49e2b5383a11ba3f1db6a24c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ecedc4ae8c0632cdd9ba0bf63a64a51e67a1525b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 4646e7d1f8..42b4a433e8 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -54,6 +54,10 @@ SDL2_POST_INSTALL_STAGING_HOOKS += SDL2_FIX_SDL2_CONFIG_CMAKE
 # We must enable static build to get compilation successful.
 SDL2_CONF_OPTS += --enable-static
 
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+SDL2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 SDL2_DEPENDENCIES += udev
 SDL2_CONF_OPTS += --enable-libudev
@@ -76,7 +80,7 @@ endif
 ifeq ($(BR2_PACKAGE_SDL2_DIRECTFB),y)
 SDL2_DEPENDENCIES += directfb
 SDL2_CONF_OPTS += --enable-video-directfb
-SDL2_CONF_ENV = ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
+SDL2_CONF_ENV += ac_cv_path_DIRECTFBCONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 else
 SDL2_CONF_OPTS += --disable-video-directfb
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
