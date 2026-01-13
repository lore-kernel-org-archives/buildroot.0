Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F8D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B07EC61036;
	Tue, 13 Jan 2026 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6IyKZ0_aBvp; Tue, 13 Jan 2026 21:00:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1373661019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338019;
	bh=wm6u0xFwgoS2keYWl1Cyw5tzuluXaQOSvww52dlLd6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N6aFj3BzJLZaeaNo1Faccc/8xY2/LhFOh693mnFuoHmqdnnnFb0SHAgfsS4fLjSOE
	 CgbG+AND7H9Krgpzy0G0kgWrdTHAx/7VEmft8t4akXN0qSI3ieWk5Tpn6jucdlefwv
	 CCDbNmWkTDqJlOjl5Pf9/6keXo6l18tn/828V6XNPijm7gdQepTvxRBQHNOfBwR7Y2
	 E72FtQzxK2c2TbQEFaPd5xuhGIqjP7r5uF3EjTK21X/VLiPmEGr31dQEsB3eTqYWwu
	 U7aLPaUXrt3crcYe4z7V/HzyymlBDe8MGLSezGFhn6BRB5bEXFv3a2pXxmfa19y0p/
	 KwshUc7tXE8mA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1373661019;
	Tue, 13 Jan 2026 21:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22705231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EECA0407BD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzjTVqADGg3S for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D793040766
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D793040766
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D620281382; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf3c39af3423e38f80b09ddde4dcc6efe2c039bf
X-Git-Newrev: c77a2eb944159795f853e5e68b2f3c253196a33e
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.D620281382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_editres: bump version
 to 1.0.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c77a2eb944159795f853e5e68b2f3c253196a33e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003469.html

Switched _SITE to URL mentioned in latest release notes.

Added optional dependency to xlib_libxkbfile which was introduced by
upstream commit:
https://gitlab.freedesktop.org/xorg/app/editres/-/commit/80959deec664cd80cd5dbf84af86b52ded4eaee0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_editres/xapp_editres.hash |  6 +++---
 package/x11r7/xapp_editres/xapp_editres.mk   | 11 +++++++++--
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_editres/xapp_editres.hash b/package/x11r7/xapp_editres/xapp_editres.hash
index a1a8ab9005..73f97fb32a 100644
--- a/package/x11r7/xapp_editres/xapp_editres.hash
+++ b/package/x11r7/xapp_editres/xapp_editres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003139.html
-sha256  83cf5dffb1883635fd9c6a8dc48ff9e560f6c6d8ce1a0e929d5f409cba18b6f9  editres-1.0.8.tar.xz
-sha512  9a007ed7a02abf61af8b65a163a7289a1e960db390db401bdfad162aa642e0eb887ecf85be14093efd8567c68f5e01450bb8321403a203a00065fa21985c7922  editres-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003469.html
+sha256  cdfc3f7a6f0ecea417af785b1f46469d9c21a3543a765480a3090fd65e3db3c6  editres-1.0.9.tar.xz
+sha512  b1abf32cad8f881b8b98c8b4a3280b09f581fc3a86188e86d5d435801676ec75377d8a636b9479a335c5c2321d358841f1194861913b2c17803758b626517230  editres-1.0.9.tar.xz
 # Locally computed
 sha256  b1049cf96db2c00428b8313541ab333ec4e06f102955f3edd44f88ec43b0acd6  COPYING
diff --git a/package/x11r7/xapp_editres/xapp_editres.mk b/package/x11r7/xapp_editres/xapp_editres.mk
index bd1bce732c..e8d6e008cb 100644
--- a/package/x11r7/xapp_editres/xapp_editres.mk
+++ b/package/x11r7/xapp_editres/xapp_editres.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-XAPP_EDITRES_VERSION = 1.0.8
+XAPP_EDITRES_VERSION = 1.0.9
 XAPP_EDITRES_SOURCE = editres-$(XAPP_EDITRES_VERSION).tar.xz
-XAPP_EDITRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_EDITRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_EDITRES_LICENSE = MIT
 XAPP_EDITRES_LICENSE_FILES = COPYING
 XAPP_EDITRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
 XAPP_EDITRES_CONF_OPTS = --with-appdefaultdir=/usr/share/X11/app-defaults
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXKBFILE),y)
+XAPP_EDITRES_CONF_OPTS += --with-xkb
+XAPP_EDITRES_DEPENDENCIES += xlib_libxkbfile
+else
+XAPP_EDITRES_CONF_OPTS += --without-xkb
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
