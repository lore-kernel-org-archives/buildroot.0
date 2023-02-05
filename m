Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD57FC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76DE360701;
	Sun,  5 Feb 2023 12:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76DE360701
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opsYh5AlqCZ6; Sun,  5 Feb 2023 12:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 891A5606CB;
	Sun,  5 Feb 2023 12:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891A5606CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68E3B1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 509CF40894
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509CF40894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dXnHrPQmMMQ for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:17:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6855340878
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6855340878
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52D3A83747; Sun,  5 Feb 2023 12:17:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:15:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bb962724e3a76112b7c374ae6a1c4521f97cc65
X-Git-Newrev: 2e1b425a810981c3394426f09842518d9ee445ae
X-Patchwork-Hint: ignore
Message-Id: <20230205121750.52D3A83747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gst1-vaapi: fix x11 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e1b425a810981c3394426f09842518d9ee445ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The x11 feature needs libx11 and libxrandr support.

Select and depend on these when x11 is enabled.

Fixes:
gst1-vaapi-1.22.0/meson.build:96:0: ERROR: Dependency "xrandr" not found, tried pkgconfig and cmake

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 2 ++
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index ade8b83a5f..a1062097ed 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_GST1_VAAPI
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  gstreamer-vaapi consists in a collection of VA-API based
 	  plugins for GStreamer and helper libraries.
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 3d9eb91ffb..9533cdf2b6 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -43,8 +43,9 @@ else
 GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11)$(BR2_PACKAGE_XLIB_LIBXRANDR),yy)
 GST1_VAAPI_CONF_OPTS += -Dx11=enabled
+GST1_VAAPI_DEPENDENCIES += xlib_libX11 xlib_libXrandr
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 GST1_VAAPI_CONF_OPTS += -Dglx=enabled
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
