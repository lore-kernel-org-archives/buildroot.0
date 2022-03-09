Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D7EC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 21:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CE0184338;
	Wed,  9 Mar 2022 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfbD_OdAlG1U; Wed,  9 Mar 2022 21:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4D558432B;
	Wed,  9 Mar 2022 21:10:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B69301BF303
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC52460FA6
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 21:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2P4S3m-FuPrd for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 21:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D170760F88
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 21:10:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q14so4990562wrc.4
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 13:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqDzKQL8/JpddJo5CbEURw96ibx5rvaKWkw4mZg/bkU=;
 b=FgQYiWmkfjPxN5/9kNmrHxtf7XjYVl76ciSo4C1kKGAncPbHnsoSqCon/7if+U22bH
 k+LtdDAbQCnLepiX4/2STxtIst8iNjqRHt2m+tzK7AGe2XtL//RC1hZwrDjDavWb5M2c
 5ahaHh3szu8ok37YkBjYFpNvrhshS5nv0tNqpSykRBZadXmDdWMFFFTtCVm+BXk3BFQV
 KjmpNqiniK/rUsElC0JgGkGo1dlLGoYaOGxoyKOEzDGx2C0mkzW1KwQ1MjmWC6nileGL
 08CmifNzxhgpwClJ73CLVaawFfUsCKyYQeA0leHMkXS9kHH214LItD8Oiuy7KR7FonYe
 t0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wqDzKQL8/JpddJo5CbEURw96ibx5rvaKWkw4mZg/bkU=;
 b=EhZPZCOztLCP7+npurvTQ7Ko6CH4dbi7DePu8uafvAAAIoW0gAEJJpfVcmk8w7eEyr
 vi6TN1853LUbq545PQLUNIU2eYojk1nGzvwiCM6He+FFgbqrTRO7B6M+e03+tPBvMZYZ
 f2fKqQankMbf9QeiLSxcOZ9r/aqT/miaA9WeLrkIAOG+QvGK0oWJ0Eo9ApsAcZKKkF2y
 Rib0HGOdn7TZ6U8U7OfOVi8TSL6Bno9kBfaGq+hp+XI8biFNHoYaT2TFsLGDsWIzOVNN
 sdfk84h9OdVKcxeKJrBehwB4bAadU5rVPbwvhl4tD4OD+MOEiXLYBn1my9u4d02kTxhP
 eXPQ==
X-Gm-Message-State: AOAM531jnyUlB2nas3iB28nodzUAg0XH9fisyuHw7hUu5pqzUCmMlOBu
 TL0vbQ+2uP8xlghZJ2T35K9nlWxgRno=
X-Google-Smtp-Source: ABdhPJy1Tx9JJFttMQ+kWm0rYxPCxRgX6VgbiakS01yYsc+i96xyWYpV6xTRDzI0Uopa8a9ZN4nTvA==
X-Received: by 2002:a5d:5849:0:b0:1ef:f98a:5406 with SMTP id
 i9-20020a5d5849000000b001eff98a5406mr97666wrf.8.1646860246598; 
 Wed, 09 Mar 2022 13:10:46 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm2995774wms.0.2022.03.09.13.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 13:10:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 22:09:53 +0100
Message-Id: <20220309210953.540376-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: bump to version 6.03
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xlib_libXft and xlib_libXi are now mandatory

https://www.jwz.org/xscreensaver/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/Config.in         |  2 ++
 package/xscreensaver/xscreensaver.hash |  2 +-
 package/xscreensaver/xscreensaver.mk   | 18 +++---------------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 10b2b7012c..48eefdfa70 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_XSCREENSAVER
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFT
+	select BR2_PACKAGE_XLIB_LIBXI
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  XScreenSaver is the standard screen saver collection shipped
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 26ecd8bbbf..27ef7d8f00 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  7016df6736ba0126a68c1f35abcf411a695fe93bc01a18ebd9df46c9a9f4d50d  xscreensaver-5.45.tar.gz
+sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 46dedc3211..0a91d22d14 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 5.45
+XSCREENSAVER_VERSION = 6.03
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
@@ -20,6 +20,8 @@ XSCREENSAVER_DEPENDENCIES = \
 	libgtk2 \
 	libxml2 \
 	xlib_libX11 \
+	xlib_libXft \
+	xlib_libXi \
 	xlib_libXt \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-intltool
@@ -51,20 +53,6 @@ else
 XSCREENSAVER_CONF_OPTS += --with-systemd=no
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
-XSCREENSAVER_CONF_OPTS += --with-xft=yes
-XSCREENSAVER_DEPENDENCIES += xlib_libXft
-else
-XSCREENSAVER_CONF_OPTS += --with-xft=no
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
-XSCREENSAVER_CONF_OPTS += --with-xinput-ext=yes
-XSCREENSAVER_DEPENDENCIES += xlib_libXi
-else
-XSCREENSAVER_CONF_OPTS += --with-xinput-ext=no
-endif
-
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 XSCREENSAVER_CONF_OPTS += --with-xinerama-ext=yes
 XSCREENSAVER_DEPENDENCIES += xlib_libXinerama
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
