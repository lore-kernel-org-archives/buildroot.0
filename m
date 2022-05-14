Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CA4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 17:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFE760EE7;
	Sat, 14 May 2022 17:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4k3wlnYF0eHf; Sat, 14 May 2022 17:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6102B60E77;
	Sat, 14 May 2022 17:59:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8A011BF3DE
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90178400A6
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 17:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdUhUaZL8ihU for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 17:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADA0640915
 for <buildroot@buildroot.org>; Sat, 14 May 2022 17:56:21 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout09.t-online.de (Postfix) with SMTP id 6E470D88B;
 Sat, 14 May 2022 19:56:16 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.4.164]) by fwd79.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1npvzy-2ZkJXz0; Sat, 14 May 2022 19:56:14 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:41714)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1npvzx-0005N1-3d;
 Sat, 14 May 2022 19:56:13 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 19:55:57 +0200
Message-Id: <20220514175612.2510884-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1652550974-00010BFA-1755A7DA/0/0 CLEAN NORMAL
X-TOI-MSGID: 874eb856-32cf-48cb-8d93-bda33284b0d3
Subject: [Buildroot] [PATCH 04/19] package/x11r7/xdriver_xf86-video-amdgpu:
 needs libgbm
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

The package depends on gbm:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/blob/master/configure.ac#L75

For details see
http://lists.busybox.net/pipermail/buildroot/2022-April/641451.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in         | 8 +++-----
 .../xdriver_xf86-video-amdgpu.mk                          | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index c42255f55c..fb23fc1fdf 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
 	depends on BR2_USE_MMU # libdrm
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBEPOXY
@@ -11,7 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	help
 	  AMD GPU video driver
 
-comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
+comment "xf86-video-amdgpu needs GBM"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on !BR2_PACKAGE_HAS_LIBGBM
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index c34af6faf1..ba4ab43db2 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	libdrm \
+	libgbm \
 	xlib_libXcomposite \
 	xorgproto \
 	xserver_xorg-server
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
