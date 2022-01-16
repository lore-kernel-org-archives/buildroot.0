Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69B0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 21:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670E881240;
	Sun, 16 Jan 2022 21:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z38xVgKU_1i8; Sun, 16 Jan 2022 21:51:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AF281250;
	Sun, 16 Jan 2022 21:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30EBA1BF476
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D62C403C1
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 21:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFBK7A8qxdNk for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 21:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F48540360
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 21:51:34 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso19367575wmj.0
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 13:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ohXukhegeOLlPqw7gKl9wzZn93UnU5UcndOCj7ELus=;
 b=CyIFzyyPTjgbmUNIsONA3mhQbRPk1GNx9O4bw42mLI1qHXWEyvL2eSY2nLyKym7PDh
 Gs9rdyvKwyfw1R0x7szbGfR/Hq64L/BO11tYKjGlCme8ywtvlSoBPexOQmOL7kfEsuLQ
 L+6rhW2RMWpTloSh9VZ8VBWCxYGYtEndNuDV919yNBUoEp7cpDqEG9N+48FgQ0BFzpya
 ySOghrHi76D4s16I3lcIA2L+buIRdrf2PPbnJNTLxBh5L+ZJhajxjRj9iMsaEc6hjGzj
 jQb4BYVnwGI5XLEwswlW8VzULaVOnbLbSdsZK7hT0ugTKoG+k4YvxBWgyPKV3rAIeb9B
 rJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ohXukhegeOLlPqw7gKl9wzZn93UnU5UcndOCj7ELus=;
 b=OczGkhn7WiEoNDUWZe/FHD9a3p4/5Ex8F9FbJQABW1VYm66322C8YhgI3BFr3WYaaU
 zfjX3LHi6GJ/WijBZY5T9JpGo2y8MVnP0icty0ZkOSrBQYNmjajods6xJVrnlJli0yFU
 SbSL4sv1+75Hq9vl1eMyqwG6Bcg7bqnlwEhUsCGabjM4a4Np+0AYAE+FN2S2HfEFXRmG
 8FxXN+rzEHKrwg67SIHdQQsgQzmX+NCuEa8eNLJSX7aIffjEsatFYggRL4jUeNFeoTMu
 TabQHj/Cu0SU1WoITNBug0fPpRzVY5p3C0uI3Jof14RNGTpC4vQ0BzYpnNR7eaAbKEtr
 GGow==
X-Gm-Message-State: AOAM531Ir5OLwDS9s9F/RkSekGCRxuSv0A4PSk/b205hGkKLtoif2haQ
 5UxVqh43+Q/Hm8a1tE9xfsUQWuPqGjs=
X-Google-Smtp-Source: ABdhPJxdE7rvgDtctBcmiZQXqYnOCHb76He2fOjqYbcLBXc9v709rzcMEcLRYye2nj01RC7yu4hEGQ==
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr8072354wmg.62.1642369892565; 
 Sun, 16 Jan 2022 13:51:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id g15sm12062164wrm.2.2022.01.16.13.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:51:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 22:49:53 +0100
Message-Id: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/qt5/qt5webkit: widgets are mandatory
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version
5.212.0-alpha4 in commit df0b0fe6919c0d0f3750f439a3cfa765232bd569:

CMake Error at /home/fabrice/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/cmake/Qt5/Qt5Config.cmake:28 (find_package):
  Could not find a package configuration file provided by "Qt5Widgets" with
  any of the following names:

    Qt5WidgetsConfig.cmake
    qt5widgets-config.cmake

  Add the installation prefix of "Qt5Widgets" to CMAKE_PREFIX_PATH or set
  "Qt5Widgets_DIR" to a directory containing one of the above files.  If
  "Qt5Widgets" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  Source/cmake/OptionsQt.cmake:646 (find_package)
  Source/cmake/WebKitCommon.cmake:51 (include)
  CMakeLists.txt:137 (include)

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5webkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index b7beb2b252..68b679dfcd 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
+	select BR2_PACKAGE_QT5BASE_WIDGETS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5SENSORS
 	select BR2_PACKAGE_QT5WEBCHANNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
