Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BBEC636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 348A7610B6;
	Wed,  8 Feb 2023 08:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 348A7610B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C_E-es2gTHrn; Wed,  8 Feb 2023 08:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CE27610BC;
	Wed,  8 Feb 2023 08:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CE27610BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44AB31BF95C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EB87408B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:56:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB87408B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2UJMCLRTsGD for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:56:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 169F4408A9
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 169F4408A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 005D7844B3; Wed,  8 Feb 2023 08:56:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 09:54:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9a92ea1cb1dd2aa9b3f9c83c04d7d01c1f6e148
X-Git-Newrev: 17be7d028c193dc1160a4cb9313efe37326e7aa9
X-Patchwork-Hint: ignore
Message-Id: <20230208085654.005D7844B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva: switch to meson
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17be7d028c193dc1160a4cb9313efe37326e7aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The time between version 2.17.0 being tagged and the release of its
tarball version containing autoconf scripts was three weeks now.
With the switch to meson we can directly use the github-generated
tarball while not needing to run autoreconf.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva/libva.hash |  4 +---
 package/libva/libva.mk   | 19 +++++++++----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 700ace0378..780c186069 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/libva/releases/download/2.17.0/libva-2.17.0.tar.bz2.sha1sum
-sha1  997f7b3111bc5a4d32ec72e9d7f9fcfca41e4923  libva-2.17.0.tar.bz2
 # Locally computed
-sha256  f3e5eb27c305e05a9bb62703d1915a127301cc0c4f9f209025767432230c4eac  libva-2.17.0.tar.bz2
+sha256  8940541980ef998a36cd8f6ad905e81838ea4ddf56dc479ed2bebd12711e6001  libva-2.17.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index c6b9f63b10..f50010d9fc 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LIBVA_VERSION = 2.17.0
-LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
-LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
+LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
 LIBVA_INSTALL_STAGING = YES
@@ -14,25 +13,25 @@ LIBVA_DEPENDENCIES = host-pkgconf libdrm
 
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
-	--enable-drm \
-	--with-drivers-path="/usr/lib/va"
+	-Ddisable_drm=false \
+	-Ddriverdir="/usr/lib/va"
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_CONF_OPTS += --enable-x11
+LIBVA_CONF_OPTS += -Dwith_x11=yes
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 LIBVA_DEPENDENCIES += libgl
-LIBVA_CONF_OPTS += --enable-glx
+LIBVA_CONF_OPTS += -Dwith_glx=yes
 endif
 else
-LIBVA_CONF_OPTS += --disable-glx --disable-x11
+LIBVA_CONF_OPTS += -Dwith_glx=no -Dwith_x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_CONF_OPTS += --enable-wayland
+LIBVA_CONF_OPTS += -Dwith_wayland=yes
 else
-LIBVA_CONF_OPTS += --disable-wayland
+LIBVA_CONF_OPTS += -Dwith_wayland=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
