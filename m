Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24357C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B354D40905;
	Sat, 14 May 2022 17:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSjh6EYa8RzW; Sat, 14 May 2022 17:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4136640926;
	Sat, 14 May 2022 17:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18C5C1BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 909BB827DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdNQ_Ryxu6x3 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1AF7827FA
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout07.t-online.de (Postfix) with SMTP id 64587DFFD;
 Sat, 14 May 2022 19:56:17 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzy-1aPaCr0; Sat, 14 May 2022 19:56:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzx-0005N1-QH;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:56:09 +0200
Message-Id: <20220514175612.2510884-16-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550974-00009E39-39CC272F/0/0 CLEAN NORMAL
X-TOI-MSGID: bcdc1698-5a99-452f-8d8c-aaa277e58f95
Subject: [Buildroot] [PATCH 16/19] package/x11r7/xdriver_xf86-video-sis:
 switch dependency from mesa3d to libgl
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
Cc: Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

DRI support for this driver is provided by the xserver_xorg-server
package when BR2_PACKAGE_HAS_LIBGL is enabled:
https://git.busybox.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n91

Change the dependency to follow the logic of xserver_xorg-server.

Build-tested using these defconfigs:

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS=y

and

BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-sis/Config.in                | 4 ----
 .../x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk    | 4 +++-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-sis/Config.in b/package/x11r7/xdriver_xf86-video-sis/Config.in
index db01cf2afe..8e00589a76 100644
--- a/package/x11r7/xdriver_xf86-video-sis/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sis/Config.in
@@ -1,10 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SIS
 	bool "xf86-video-sis"
-	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  SiS and XGI video driver
-
-comment "xf86-video-sis needs mesa3d"
-	depends on !BR2_PACKAGE_MESA3D
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index f96b0a9d0e..0417f8ae71 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -11,7 +11,9 @@ XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SIS_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_SIS_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --enable-dri
+else
 XDRIVER_XF86_VIDEO_SIS_CONF_OPTS += --disable-dri
 endif
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
