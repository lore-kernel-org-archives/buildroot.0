Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002CEC25B7C
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 12:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6470831FB;
	Fri, 24 May 2024 12:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVsdWGQIqzyd; Fri, 24 May 2024 12:40:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6F1C833CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6F1C833CA;
	Fri, 24 May 2024 12:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 20CAF1CF957
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BA3F4037A
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 12:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vruEcl3Lm7hE for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 12:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 198A640359
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 198A640359
 for <buildroot@buildroot.org>; Fri, 24 May 2024 12:39:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0258F875B5; Fri, 24 May 2024 12:39:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 14:37:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 544da0242f6ce0e1cc65339c384770ae3d3c4b74
X-Git-Newrev: 3ead103f4640072b95923ea9bb15e115f14f4f0d
X-Patchwork-Hint: ignore
Message-Id: <20240524123954.0258F875B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11vnc: drop unrecognized options
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ead103f4640072b95923ea9bb15e115f14f4f0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--without-{jpeg,sdl,zlib} are unrecognized since bump to version
0.9.14 in commit aeea662fb12e69073a233fe1058287212fbbca33 and
https://github.com/LibVNC/x11vnc/commit/d287ed9a77c647f35e85e0b10621a6661e911fad
because those dependencies were linked to libvncserver, not x11vnc

Fixes: aeea662fb12e69073a233fe1058287212fbbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
