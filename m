Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8517CC5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 547F06060E;
	Wed, 28 Feb 2024 16:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjiaChq8YayP; Wed, 28 Feb 2024 16:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 070BE60EAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 070BE60EAA;
	Wed, 28 Feb 2024 16:45:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F8FA1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D33B60E86
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7cs6ydPsYL5 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C74860E4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C74860E4D
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62DC087BFC; Wed, 28 Feb 2024 16:44:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:15:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: b9b7b9cf6f39f8766196dce8cfaaaef56effc206
X-Git-Newrev: 4848edca0d566482887465b7d7e1e89c3378cd89
X-Patchwork-Hint: ignore
Message-Id: <20240228164457.62DC087BFC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/webkitgtk: select
 wpebackend-fdo if wayland target is enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=4848edca0d566482887465b7d7e1e89c3378cd89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400

egl is mandatory if ENABLE_WAYLAND_TARGET
https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473

So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-By: Adrian Perez de Castro <aperez@igalia.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b9c0e48f68ffb3ffa5ffc9d23edafc89c6a4d41f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in    | 1 +
 package/webkitgtk/webkitgtk.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 927792b1e4..cb10784133 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -53,6 +53,7 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WOFF2
+	select BR2_PACKAGE_WPEBACKEND_FDO if BR2_PACKAGE_LIBGTK3_WAYLAND
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index bb6df3d592..cb7461ccbc 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -108,7 +108,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LI
 WEBKITGTK_DEPENDENCIES += libegl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
+ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO),y)
 WEBKITGTK_CONF_OPTS += -DUSE_WPE_RENDERER=ON
 WEBKITGTK_DEPENDENCIES += wpebackend-fdo
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
