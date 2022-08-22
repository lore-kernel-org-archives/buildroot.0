Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528AAC32772
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 14:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9DBD60EA0;
	Mon, 22 Aug 2022 14:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9DBD60EA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKvfXpbaasty; Mon, 22 Aug 2022 14:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0628C605E0;
	Mon, 22 Aug 2022 14:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0628C605E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F46C1BF232
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 14:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2865813D6
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 14:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2865813D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zG2g5e7lPKM4 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 14:38:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BB61813CB
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 14:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BB61813CB
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9958F87AA7; Mon, 22 Aug 2022 14:23:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 16:13:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b35ba00e715816231924d6dd20c164ab0229a32c
X-Git-Newrev: d6df46fb145c4211b0750b0362b6e3ca832e8231
X-Patchwork-Hint: ignore
Message-Id: <20220822142353.9958F87AA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sdl2: be explicit
 about OpenGL ES options
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6df46fb145c4211b0750b0362b6e3ca832e8231
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In addition to --enable-video-opengles, SDL2 configure script also
looks at --enable-video-opengles1 and --enable-video-opengles2. Since
all OpenGL ES providers in Buildroot provide at least up to OpenGL ES
2, enable both options when BR2_PACKAGE_SDL2_OPENGLES=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: split long lines]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2/sdl2.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index d255112ce9..dec25edf1b 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -155,10 +155,16 @@ SDL2_CONF_OPTS += --disable-video-opengl
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_OPENGLES),y)
-SDL2_CONF_OPTS += --enable-video-opengles
+SDL2_CONF_OPTS += \
+	--enable-video-opengles \
+	--enable-video-opengles1 \
+	--enable-video-opengles2
 SDL2_DEPENDENCIES += libgles
 else
-SDL2_CONF_OPTS += --disable-video-opengles
+SDL2_CONF_OPTS += \
+	--disable-video-opengles \
+	--disable-video-opengles1 \
+	--disable-video-opengles2
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
