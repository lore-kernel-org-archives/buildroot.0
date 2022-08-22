Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBADECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 09:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391A261091;
	Sun, 11 Sep 2022 09:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 391A261091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1J-_WTn57Bb7; Sun, 11 Sep 2022 09:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D5BD61075;
	Sun, 11 Sep 2022 09:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D5BD61075
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 154821BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93FAF6FAE2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93FAF6FAE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1qZ1Evn8vT9 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 651D060B2C
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 651D060B2C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A76483621; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 16:13:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3b2bc21d52fc949ac62964bc4c628c5143e4954
X-Git-Newrev: b35ba00e715816231924d6dd20c164ab0229a32c
X-Patchwork-Hint: ignore
Message-Id: <20220911084825.4A76483621@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=b35ba00e715816231924d6dd20c164ab0229a32c
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
