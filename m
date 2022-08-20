Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79322C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C6C41986;
	Sat, 20 Aug 2022 08:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C6C41986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auqS8yz4j0wn; Sat, 20 Aug 2022 08:10:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD0FA4193B;
	Sat, 20 Aug 2022 08:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD0FA4193B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14F2C1BF95D
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4CE54193B
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4CE54193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GQZyE4B8vdn for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95CFF41524
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CFF41524
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4FD7282641; Sat, 20 Aug 2022 07:55:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 10:08:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 713de9f90eba91581ba8d264e237205bfee1ac11
X-Git-Newrev: e48121750f084ff330e62e6110544b3e29921177
X-Patchwork-Hint: ignore
Message-Id: <20220820075531.4FD7282641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: be explicit about OpenGL ES
 options
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

commit: https://git.buildroot.net/buildroot/commit/?id=e48121750f084ff330e62e6110544b3e29921177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
