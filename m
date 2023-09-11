Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7ADCA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 654BB4187D;
	Mon, 11 Sep 2023 20:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 654BB4187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tgYI38CavJ52; Mon, 11 Sep 2023 20:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17001418D6;
	Mon, 11 Sep 2023 20:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17001418D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D1851BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8975C60590
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8975C60590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaXXV0oqOxXp for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93C7E6105D
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C7E6105D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 831FE86D42; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:53:57 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1125ede416e39f433b0ac728dd28dd8f80789a0f
X-Git-Newrev: 575aa623698f83c3ba942236e46e6c8570c146fa
X-Patchwork-Hint: ignore
Message-Id: <20230911205823.831FE86D42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/mpv: fix x11 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=575aa623698f83c3ba942236e46e6c8570c146fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

xlib_libXpresent is needed with x11 to avoid the following build failure
raised since bump to version 0.35.1 in commit
61ba55e9cce6884295e47fdf33554e6877bd0747 and
https://github.com/mpv-player/mpv/commit/3d459832a88a9bd2835b339cf6ca98f84aad0115:

Checking for X11: no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >= 1.0.0 xpresent >= 1.0.0 xrandr >= 1.2.0' not found)
You manually enabled the feature 'x11', but the autodetection check failed.

Fixes:
 - http://autobuild.buildroot.org/results/1aace6210ba966bb4979d935c08507b2a34e0460

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a0fdd17ec254ecaca28b40254e0679e24078c5e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpv/Config.in | 1 +
 package/mpv/mpv.mk    | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 8efb353c33..5c32f593fe 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_MPV
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXPRESENT if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index e368b25736..cf37091186 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -205,7 +205,13 @@ endif
 # xlib_libXrandr, xlib_libXScrnSaver.
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MPV_CONF_OPTS += --enable-x11
-MPV_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXinerama xlib_libXrandr xlib_libXScrnSaver
+MPV_DEPENDENCIES += \
+	xlib_libX11 \
+	xlib_libXext \
+	xlib_libXinerama \
+	xlib_libXpresent \
+	xlib_libXrandr \
+	xlib_libXScrnSaver
 # XVideo
 ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
 MPV_CONF_OPTS += --enable-xv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
