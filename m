Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDE1C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753264ECAD;
	Mon, 20 Feb 2023 21:53:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753264ECAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNCVwSXgkQpc; Mon, 20 Feb 2023 21:53:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D52C4ECA3;
	Mon, 20 Feb 2023 21:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D52C4ECA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5131BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F90610CC
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38F90610CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0T4VaVkmKkbN for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 535046110E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 535046110E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D2498648F; Mon, 20 Feb 2023 20:51:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:32:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e708680a43bdd4bc6cb5b84544a98bc27ccc8d55
X-Git-Newrev: 42c8fe191473193c0854bd8a641c046d4f149a97
X-Patchwork-Hint: ignore
Message-Id: <20230220205157.4D2498648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_xdm: bump
 version to 1.1.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=42c8fe191473193c0854bd8a641c046d4f149a97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-December/003265.html

xlib_libXinerama is an optional dependency now.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_xdm/Config.in     |  1 -
 package/x11r7/xapp_xdm/xapp_xdm.hash |  6 +++---
 package/x11r7/xapp_xdm/xapp_xdm.mk   | 12 +++++++++---
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index af816a1349..1ac15ce368 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_XAPP_XDM
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXDMCP
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XORGPROTO
 	help
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index 5ba3a3f062..daf1b0852f 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003148.html
-sha256  e58267e8f1478f2f5cd57cbcf2367a36973860c3131a450a3e0816585af03264  xdm-1.1.13.tar.xz
-sha512  1c7ba51dc8c6989ff6ede3a3abd06e002903609d4ebd31f06ec39fbfee3a80a690c6180f85c3ab135a0de4623261d92a191d1ca5f733cdb3bd2e7e78977b98e5  xdm-1.1.13.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-December/003265.html
+sha256  3e9bf25636797ec9e595286dd6820ecc33901439f07705eaf608ecda012c3d5f  xdm-1.1.14.tar.xz
+sha512  8ed1d2c946916c24cb4b2de9326f65629c97e53b145312c9cb9c6e4308d8b47d67d3981319fbd4feac9b3ed436b9dfb24a1c905d37d7bcf07b49c18a68c7a6e4  xdm-1.1.14.tar.xz
 # Locally computed
 sha256  b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 98306f66f5..035f2e9484 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.13
+XAPP_XDM_VERSION = 1.1.14
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.xz
-XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XDM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XDM_LICENSE = MIT
 XAPP_XDM_LICENSE_FILES = COPYING
 XAPP_XDM_CONF_ENV = ac_cv_file__dev_urandom=yes
@@ -16,7 +16,6 @@ XAPP_XDM_DEPENDENCIES = \
 	xlib_libX11 \
 	xlib_libXaw \
 	xlib_libXdmcp \
-	xlib_libXinerama \
 	xlib_libXt \
 	xorgproto
 XAPP_XDM_CONF_OPTS = \
@@ -24,6 +23,13 @@ XAPP_XDM_CONF_OPTS = \
 	--with-utmp-file=/var/adm/utmpx \
 	--with-wtmp-file=/var/adm/wtmpx
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+XAPP_XDM_CONF_OPTS += --with-xinerama
+XAPP_XDM_DEPENDENCIES += xlib_libXinerama
+else
+XAPP_XDM_CONF_OPTS += --without-xinerama
+endif
+
 define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
 		$(TARGET_DIR)/etc/init.d/S99xdm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
