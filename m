Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98FAC25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 427C84060B;
	Sat, 20 Aug 2022 08:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427C84060B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmL9OL835yuM; Sat, 20 Aug 2022 08:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69C9A404D8;
	Sat, 20 Aug 2022 08:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69C9A404D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136921BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D539683E83
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D539683E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMeabJ0E0lhH for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:10:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF4183E65
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF4183E65
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4351583DFD; Sat, 20 Aug 2022 07:55:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 10:06:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 167cbd76eea17d5995f6e4f88e34d8b3f795cc33
X-Git-Newrev: 713de9f90eba91581ba8d264e237205bfee1ac11
X-Patchwork-Hint: ignore
Message-Id: <20220820075531.4351583DFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: be more explicit in
 disabling optional features
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

commit: https://git.buildroot.net/buildroot/commit/?id=713de9f90eba91581ba8d264e237205bfee1ac11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add many more explicit --disable-<foo>, as we have for example seen
video-vivante being autodetected when not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2/sdl2.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 94533fa9b4..d255112ce9 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -20,7 +20,24 @@ SDL2_CONF_OPTS += \
 	--disable-esd \
 	--disable-dbus \
 	--disable-pulseaudio \
-	--disable-video-wayland
+	--disable-video-vivante \
+	--disable-video-cocoa \
+	--disable-video-metal \
+	--disable-video-wayland \
+	--disable-video-dummy \
+	--disable-video-offscreen \
+	--disable-video-vulkan \
+	--disable-ime \
+	--disable-ibus \
+	--disable-fcitx \
+	--disable-joystick-mfi \
+	--disable-directx \
+	--disable-xinput \
+	--disable-wasapi \
+	--disable-hidapi-joystick \
+	--disable-hidapi-libusb \
+	--disable-joystick-virtual \
+	--disable-render-d3d
 
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
