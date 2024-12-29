Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58217C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 543E64FD1E;
	Fri, 28 Feb 2025 16:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlNxMoWMsR5I; Fri, 28 Feb 2025 16:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B434FD17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B434FD17;
	Fri, 28 Feb 2025 16:47:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0408B68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3B8542E1C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK5jBodTmUVz for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D68E42581
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D68E42581
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A9C85B5E; Fri, 28 Feb 2025 16:29:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6b8025042d9495a15f5021e791d0f35bf2704afe
X-Git-Newrev: 306ed19f7293c5bbbf86455c7c40bf57e3406ae1
X-Patchwork-Hint: ignore
Message-Id: <20250228162952.70A9C85B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tekui: drop directfb
 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=306ed19f7293c5bbbf86455c7c40bf57e3406ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove the DirectFB package, let's drop DirectFB
support in tekui.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tekui/tekui.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 3cb7ff51e5..2ec8a58487 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -42,13 +42,6 @@ TEKUI_MAKE_OPTS += \
 	X11_DEFS="-D_XOPEN_SOURCE -DENABLE_XFT -DENABLE_XVID -I$(STAGING_DIR)/usr/include/freetype2 -I$(STAGING_DIR)/usr/include/fontconfig" \
 	DISPLAY_DRIVER=x11
 else
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-TEKUI_DEPENDENCIES += directfb
-TEKUI_MAKE_OPTS += \
-	DIRECTFB_LIBS="-lfreetype -ldirectfb -lpthread" \
-	DIRECTFB_DEFS="-D_REENTRANT -I$(STAGING_DIR)/usr/include/directfb -I$(STAGING_DIR)/usr/include/freetype2" \
-	DISPLAY_DRIVER=directfb
-else
 TEKUI_MAKE_OPTS += \
 	FREETYPE_LIBS=-lfreetype \
 	FREETYPE_DEFS="-I$(STAGING_DIR)/usr/include/freetype2" \
@@ -56,7 +49,6 @@ TEKUI_MAKE_OPTS += \
 	RAWFB_SUB_DEFS="-DDEF_FONTDIR=\\\"$(TEKUI_FONTDIR)\\\"" \
 	DISPLAY_DRIVER=rawfb
 endif
-endif
 
 define TEKUI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
