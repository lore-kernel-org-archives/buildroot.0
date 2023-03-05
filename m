Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999F0C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 10:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D7F60E66;
	Sun,  5 Mar 2023 10:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D7F60E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agd_5u7aEWSz; Sun,  5 Mar 2023 10:31:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F67360C30;
	Sun,  5 Mar 2023 10:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F67360C30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8E11BF35F
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 283EB60E66
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 10:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 283EB60E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lgaSiYe-UEP for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44458605A7
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44458605A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3435F861FE; Sun,  5 Mar 2023 10:31:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 11:19:36 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 869cd715f748e8a289dc75852198d978cb69ebeb
X-Git-Newrev: 4bd484ee5df9868dad0e81618fb71ad60ed61f28
X-Patchwork-Hint: ignore
Message-Id: <20230305103136.3435F861FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 package/glslsandbox-player: add wayland-protocols optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=4bd484ee5df9868dad0e81618fb71ad60ed61f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

wayland-protocols is an optional dependency which is enabled by default
resulting in the following wayland build failure since the addition of
the package in commit f201ca9d0d25b491ec5e1ed4e1d02fd52d027997:

checking for wayland_client... yes
checking for wayland_egl... yes
configure: Wayland EGL support enabled
checking for wayland_protocols... no
configure: error: Package requirements (wayland-protocols >= 1.12) were not met:

Package 'wayland-protocols', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables wayland_protocols_CFLAGS
and wayland_protocols_LIBS to avoid the need to call pkg-config.

Fixes:
 - http://autobuild.buildroot.org/results/865af860f9e52fe5311bb0c6a246ff871ae5a989

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ee13e3fb41dc7c0c001127733b5a599c1e509747)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glslsandbox-player/Config.in             | 5 ++++-
 package/glslsandbox-player/glslsandbox-player.mk | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 132705584e..530c158fc3 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -111,8 +111,11 @@ endchoice
 if BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_IVI
 	bool "Wayland IVI shell support"
-endif
 
+config BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_XDG
+	bool "Wayland XDG shell support"
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+endif
 endif
 
 comment "glslsandbox-player needs openGL ES and EGL driver"
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index f0a9475aa6..241f3475d2 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -72,6 +72,12 @@ GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-ivi
 else
 GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-ivi
 endif
+ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_WL_XDG),y)
+GLSLSANDBOX_PLAYER_DEPENDENCIES += wayland-protocols
+GLSLSANDBOX_PLAYER_CONF_OPTS += --enable-wlxdg
+else
+GLSLSANDBOX_PLAYER_CONF_OPTS += --disable-wlxdg
+endif
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_X11),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += xlib_libX11
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=x11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
