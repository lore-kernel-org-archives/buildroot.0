Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EBECEE352
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D878136D;
	Wed,  9 Oct 2024 21:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcTSCTZx3x-S; Wed,  9 Oct 2024 21:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44C808136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C808136B;
	Wed,  9 Oct 2024 21:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4F541BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1B1F8136B
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjqWJJSQ-sui for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:37:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46ED281371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46ED281371
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46ED281371
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:37:40 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7AA9DB00571;
 Wed,  9 Oct 2024 23:37:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 23:37:19 +0200
Message-ID: <20241009213719.49469-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728509857;
 bh=d9sVt3IFzDiZYYj/Lvw5/vd0iwgrCLrjqUpOmTngrN0=;
 h=From:To:Cc:Subject:Date:From;
 b=AKErRbBn+WMGbAaYHwmwrL9WN4OljfA4nwQrOn2g/WFN9g91zuTGGaxD/mhDBjlSX
 eMUEPk/u/WPiH5SLTf8oKEQMoZu0Pzomsyjd9dTRt0BA5NMwlQtDs5mu0YaWWteya2
 8rnTnBJ7fMb81OakOZygNiQvzT4jQvifYvhBU+/PYFYt4Jmlvpx8FkF8gE5EDMOrM/
 yZfa+h9BqmXKSp5E/rVhMFkN8zhEz3jaAac5hI6bXGhX9YEu00cs3k6MAkm6gXd/Jt
 /mYwAgwKVyakscGF52qSUuAVKesGvB8sh5E6gQIOOA36FwyHzuDnAJ3VDnO/HIpRQI
 LsgrlXW1EP93Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AKErRbBn
Subject: [Buildroot] [PATCH 1/1] package/wine: bump to version 9.19
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For a summary of changes since 8.0.2, see:
https://www.winehq.org/news/

This commit adds the sha512 hash published on the download site.
The LICENSE hash also changed, due to a year update.

This commit also adds new optional dependencies for:
xlib_libXfixes, ffmpeg, pcsc-lite, and wayland.

All new build options are disabled in HOST_WINE_CONF_OPTS:
ffmpeg, pcsc-lite, udev, wayland and xfixes.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8038209884
---
 package/wine/wine.hash |  7 +++++--
 package/wine/wine.mk   | 37 +++++++++++++++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index 756859c844..61de6db80f 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,5 +1,8 @@
+# From:
+# https://dl.winehq.org/wine/source/9.x/sha512sums.asc
+sha512  530219c6a337f2996eac92d644ab603528b82cc6136cc37c1e6aa736d418f33c6f4b0d54f3537b04bceaf4487d84abcf926a2f5e9536ed4e966c4fe63c5b6ddd  wine-9.19.tar.xz
 # Locally calculated after checking pgp signature
-sha256  6ec8fb6f2c72d576cb11f52b2f8d59af64404802154651d122b98466d91dc847  wine-8.0.2.tar.xz
+sha256  2c13a0c3f31f25a54d415d86785a1ad46ef8a07ae973b6b699345a45206ac015  wine-9.19.tar.xz
 # Locally calculated
 sha256  e237fa56668030e928551ddd60f05df5fe957f75eab874bbd017e085ed722e7c  COPYING.LIB
-sha256  793d045546467c8f49e35fbd6e02859e57e78f8bb53571e8200bffd0e966dfa8  LICENSE
+sha256  51433d87540ee2f30e3cff986e00e1477880002bf993106a13775ed60d4e0af4  LICENSE
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index f47922dc70..6b1ba19b0b 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-WINE_VERSION = 8.0.2
+WINE_VERSION = 9.19
 WINE_SOURCE = wine-$(WINE_VERSION).tar.xz
-WINE_SITE = https://dl.winehq.org/wine/source/8.0
+WINE_SITE = https://dl.winehq.org/wine/source/9.x
 WINE_LICENSE = LGPL-2.1+
 WINE_LICENSE_FILES = COPYING.LIB LICENSE
 WINE_CPE_ID_VENDOR = winehq
@@ -62,6 +62,13 @@ else
 WINE_CONF_OPTS += --without-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+WINE_CONF_OPTS += --with-ffmpeg
+WINE_DEPENDENCIES += ffmpeg
+else
+WINE_CONF_OPTS += --without-ffmpeg
+endif
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 WINE_CONF_OPTS += --with-fontconfig
 WINE_DEPENDENCIES += fontconfig
@@ -137,6 +144,13 @@ else
 WINE_CONF_OPTS += --without-osmesa
 endif
 
+ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
+WINE_CONF_OPTS += --with-pcsclite
+WINE_DEPENDENCIES += pcsc-lite
+else
+WINE_CONF_OPTS += --without-pcsclite
+endif
+
 ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
 WINE_CONF_OPTS += --with-pulse
 WINE_DEPENDENCIES += pulseaudio
@@ -173,6 +187,13 @@ else
 WINE_CONF_OPTS += --without-udev
 endif
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+WINE_CONF_OPTS += --with-wayland
+WINE_DEPENDENCIES += wayland
+else
+WINE_CONF_OPTS += --without-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 WINE_CONF_OPTS += --with-x
 WINE_DEPENDENCIES += xlib_libX11
@@ -201,6 +222,13 @@ else
 WINE_CONF_OPTS += --without-xshape --without-xshm
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
+WINE_CONF_OPTS += --with-xfixes
+WINE_DEPENDENCIES += xlib_libXfixes
+else
+WINE_CONF_OPTS += --without-xfixes
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
 WINE_CONF_OPTS += --with-xinput --with-xinput2
 WINE_DEPENDENCIES += xlib_libXi
@@ -272,6 +300,7 @@ HOST_WINE_CONF_OPTS += \
 	--without-coreaudio \
 	--without-cups \
 	--without-dbus \
+	--without-ffmpeg \
 	--without-fontconfig \
 	--without-gphoto \
 	--without-gnutls \
@@ -285,15 +314,19 @@ HOST_WINE_CONF_OPTS += \
 	--without-osmesa \
 	--without-oss \
 	--without-pcap \
+	--without-pcsclite \
 	--without-pulse \
 	--without-sane \
 	--without-sdl \
+	--without-udev \
 	--without-usb \
 	--without-v4l2 \
 	--without-vulkan \
+	--without-wayland \
 	--without-x \
 	--without-xcomposite \
 	--without-xcursor \
+	--without-xfixes \
 	--without-xinerama \
 	--without-xinput \
 	--without-xinput2 \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
