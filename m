Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F23C27C5F
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A62614DE;
	Sat,  8 Jun 2024 14:02:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuAea7rpR2nq; Sat,  8 Jun 2024 14:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C238F615B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C238F615B9;
	Sat,  8 Jun 2024 14:02:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18BAE1BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89E33607DC
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4xJ8MRUexjY for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA5D7607A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA5D7607A7
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B69D58218A; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:55:57 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4b4becbd070375ee68c633929486df1eaa54bfe3
X-Git-Newrev: 03e4742cacd81bf9e9ad4d1711078fd4b7381cdd
X-Patchwork-Hint: ignore
Message-Id: <20240608140142.B69D58218A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/x11vnc: drop
 unrecognized options
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

commit: https://git.buildroot.net/buildroot/commit/?id=03e4742cacd81bf9e9ad4d1711078fd4b7381cdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

--without-{jpeg,sdl,zlib} are unrecognized since bump to version
0.9.14 in commit aeea662fb12e69073a233fe1058287212fbbca33 and
https://github.com/LibVNC/x11vnc/commit/d287ed9a77c647f35e85e0b10621a6661e911fad
because those dependencies were linked to libvncserver, not x11vnc

Fixes: aeea662fb12e69073a233fe1058287212fbbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3ead103f4640072b95923ea9bb15e115f14f4f0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11vnc/x11vnc.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index aa0f14c456..645ef40643 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -6,9 +6,6 @@
 
 X11VNC_VERSION = 0.9.16
 X11VNC_SITE = $(call github,LibVNC,x11vnc,$(X11VNC_VERSION))
-# sdl support is not used in x11vnc, but host include / library search paths
-# leak in if host has sdl-config
-X11VNC_CONF_OPTS = --without-sdl
 X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
@@ -25,12 +22,6 @@ else
 X11VNC_CONF_OPTS += --without-avahi
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
-X11VNC_DEPENDENCIES += jpeg
-else
-X11VNC_CONF_OPTS += --without-jpeg
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 X11VNC_DEPENDENCIES += openssl
 else
@@ -61,10 +52,4 @@ else
 X11VNC_CONF_OPTS += --without-xdamage
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-X11VNC_DEPENDENCIES += zlib
-else
-X11VNC_CONF_OPTS += --without-zlib
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
