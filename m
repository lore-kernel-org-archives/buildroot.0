Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C696DE77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 19:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D7896059B;
	Sun, 29 Dec 2024 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk_OPAsZ8Poy; Sun, 29 Dec 2024 19:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D3656077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3656077D;
	Sun, 29 Dec 2024 19:53:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9F4E0B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 980E180D97
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxkkK-32ExrC for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 19:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE3B80D78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE3B80D78
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFF0C876F6; Sun, 29 Dec 2024 19:53:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:25:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b8025042d9495a15f5021e791d0f35bf2704afe
X-Git-Newrev: 306ed19f7293c5bbbf86455c7c40bf57e3406ae1
X-Patchwork-Hint: ignore
Message-Id: <20241229195346.CFF0C876F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tekui: drop directfb support
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
