Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B77C54E60
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B8C8406EE;
	Tue, 19 Mar 2024 12:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kjik0EBMfo3f; Tue, 19 Mar 2024 12:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58CD740704
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CD740704;
	Tue, 19 Mar 2024 12:22:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAA61BF976
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17DD360ACD
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuTDDzEVCQdq for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 528A860AA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 528A860AA8
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E1D98354D; Tue, 19 Mar 2024 12:22:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:08:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c9e929651d4f4db1d5e59db7da89a7410b049279
X-Git-Newrev: 257c3d0e0f1ed958b00f65b95fa33e9c4c599aff
X-Patchwork-Hint: ignore
Message-Id: <20240319122222.4E1D98354D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/gstreamer1/gst1-vaapi: fix wayland build
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

commit: https://git.buildroot.net/buildroot/commit/?id=257c3d0e0f1ed958b00f65b95fa33e9c4c599aff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

wayland-protocols is a mandatory dependency with wayland since
bump to version 1.22.0 in commit
33d4c226e582f6c0086431c4d9154e462cb3cf34 and
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3c713cc16ee1d374213cb2b47a3127e14e5ff8a5:

Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)

../output-1/build/gst1-vaapi-1.22.0/meson.build:111:0: ERROR: Dependency "wayland-protocols" not found, tried pkgconfig and cmake

Fixes: 33d4c226e582f6c0086431c4d9154e462cb3cf34
 - http://autobuild.buildroot.org/results/b5e79d4e10fdf24c3fd43ab742d9d14a5d07824b
 - http://autobuild.buildroot.org/results/ad624cd11d5a1b3346974000ae2b61f4261af02c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 9d74e5af7189a50d891b5ffc3acc55ff795abdf1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-vaapi/Config.in     | 1 +
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gstreamer1/gst1-vaapi/Config.in b/package/gstreamer1/gst1-vaapi/Config.in
index a1062097ed..d6a1542ad3 100644
--- a/package/gstreamer1/gst1-vaapi/Config.in
+++ b/package/gstreamer1/gst1-vaapi/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GST1_VAAPI
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BAD # gstreamer-codecparsers
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 4b04d1bb72..d934bab233 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -39,6 +39,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 GST1_VAAPI_CONF_OPTS += -Dwayland=enabled
+GST1_VAAPI_DEPENDENCIES += wayland wayland-protocols
 else
 GST1_VAAPI_CONF_OPTS += -Dwayland=disabled
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
