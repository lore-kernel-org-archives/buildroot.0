Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353F4ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 06:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCEBE4018F;
	Sat, 17 Sep 2022 06:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCEBE4018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qBJkuZsJVpaG; Sat, 17 Sep 2022 06:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA0C94018B;
	Sat, 17 Sep 2022 06:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA0C94018B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1911BF846
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39A4341B37
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 06:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39A4341B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jaorfp0CHbgB for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 06:55:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EE0A41CD1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 06:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE0A41CD1
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0C73483EB4; Sat, 17 Sep 2022 06:55:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 08:47:10 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 73a4d44238cfad6afc8d132c7ab4c2d0a24e462a
X-Git-Newrev: 253c3b032b1dd0e80727c0059ebfdf297370aad5
X-Patchwork-Hint: ignore
Message-Id: <20220917065504.0C73483EB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/sdl2: be explicit
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

commit: https://git.buildroot.net/buildroot/commit/?id=253c3b032b1dd0e80727c0059ebfdf297370aad5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

In addition to --enable-video-opengles, SDL2 configure script also
looks at --enable-video-opengles1 and --enable-video-opengles2. Since
all OpenGL ES providers in Buildroot provide at least up to OpenGL ES
2, enable both options when BR2_PACKAGE_SDL2_OPENGLES=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: split long lines]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e48121750f084ff330e62e6110544b3e29921177)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2/sdl2.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 94533fa9b4..8167cd5eac 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -138,10 +138,16 @@ SDL2_CONF_OPTS += --disable-video-opengl
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
