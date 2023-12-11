Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9DDC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 18:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFDC611AA;
	Mon, 11 Dec 2023 18:15:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFDC611AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5n1uj4LYOLf; Mon, 11 Dec 2023 18:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FED613B2;
	Mon, 11 Dec 2023 18:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2FED613B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A7FA1BF2B7
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 18:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 615F94048D
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 18:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 615F94048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s74o8LHcRxzW for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 18:15:40 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C98F409D7
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 18:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C98F409D7
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bee606265so4995454e87.2
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 10:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702318538; x=1702923338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTY9+2/Js0Qw7RSlr3HjZWIiBXzZcHtpDsMLpBbrTRc=;
 b=b9KUwaO5F4yusLqJISHwJ3YWqok5eI7/N7kpBOGPBSyVBQfL2exCMW/Iv7m4GQG3P5
 sMRfJHtGH+Yp6G/qtjFH5Lwp80edTGb8k9L6Ru3I9J8VCX3uEViooqhoYzwaLgbf8wv6
 unpM/8ykG01Et23ZW0QkmdSyC8Keg3h7PkOvIkv2OC1EodKTU1RNJ6s08xGjgPqOzm5f
 jF53msj6Y51eqUAYg1pNAqUhyZMpOGgZLQ8yyouBiO7y2JeFnbKqjMSJSfIJqsi74/MA
 +QHxlC4MjQ0CxHqMeFnH93m1CfrKTIY+r2TRRqkxyz5muaX9q+L1iqn5b/Pr4l1MKfof
 1kYA==
X-Gm-Message-State: AOJu0YzcfPeyrf9eNr7CEvZwW4pRAVpK6J9kyZg3whBD5kwHJlw+ZcRf
 39B8Y0kecHkxAy5mSQxMWczICUcWhSyvmQ==
X-Google-Smtp-Source: AGHT+IHtYcZqSZ7zzX50L2TrolZj9+FVSCCJvixbpvLkqiHbJPbVTAa282fLORElTNIjge1QuZpv0g==
X-Received: by 2002:a05:6512:3b8a:b0:50b:f553:81ba with SMTP id
 g10-20020a0565123b8a00b0050bf55381bamr3202392lfv.9.1702318537378; 
 Mon, 11 Dec 2023 10:15:37 -0800 (PST)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 g42-20020a0565123baa00b0050bfe7a602csm1149050lfv.74.2023.12.11.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 10:15:36 -0800 (PST)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 19:15:03 +0100
Message-ID: <20231211181504.3035423-1-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702318538; x=1702923338; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WTY9+2/Js0Qw7RSlr3HjZWIiBXzZcHtpDsMLpBbrTRc=;
 b=PxqG5v30TOhENt6akk3S04ZABqoxdQQH0ylFzKyFs1JwL1Sg1sqNb/HnJId3Q9eXIx
 vItBV4hAW2B5SOmremamnz1aEUxN3UAwJgmOfUnMXWsTM1vZ0Q7LKBL3Wg+hUyvHAHWa
 oa0kt0IgPwXrNCvtGOijOA9L1hp7GnrWm+agYphYptiqKQZ0OZpFygSX3WG/f87iCBmC
 u9SRvMXQCs1IBwmjqzVBB4jDlmcnRiIx2LEyWwGXuXPxgsF279UDFBRepcxGBkGdcDQV
 QRGK3HDy2gxfxNFe35RZmFld/+WM/bLrPPPRVOpQ5P4KWMIi9811bzLXtmOhk1rIgrUd
 pMIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PxqG5v30
Subject: [Buildroot] [PATCH] package/qt5: bump packages to latest kde
 submodule versions
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump qt5 packages to latest submodule versions from:
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt5/qt5.mk                                           | 2 +-
 package/qt5/qt53d/qt53d.hash                                 | 2 +-
 package/qt5/qt53d/qt53d.mk                                   | 2 +-
 package/qt5/qt5base/qt5base.hash                             | 2 +-
 package/qt5/qt5base/qt5base.mk                               | 2 +-
 package/qt5/qt5charts/qt5charts.hash                         | 2 +-
 package/qt5/qt5charts/qt5charts.mk                           | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.hash             | 2 +-
 package/qt5/qt5connectivity/qt5connectivity.mk               | 2 +-
 package/qt5/qt5declarative/qt5declarative.hash               | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk                 | 2 +-
 package/qt5/qt5doc/qt5doc.hash                               | 2 +-
 package/qt5/qt5doc/qt5doc.mk                                 | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash     | 2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk       | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.hash             | 2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk               | 2 +-
 package/qt5/qt5location/qt5location.mk                       | 2 +-
 package/qt5/qt5lottie/qt5lottie.hash                         | 2 +-
 package/qt5/qt5lottie/qt5lottie.mk                           | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash                 | 2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk                   | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash           | 2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk             | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash         | 2 +-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk           | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.hash           | 2 +-
 package/qt5/qt5quicktimeline/qt5quicktimeline.mk             | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.hash           | 2 +-
 package/qt5/qt5remoteobjects/qt5remoteobjects.mk             | 2 +-
 package/qt5/qt5script/qt5script.hash                         | 2 +-
 package/qt5/qt5script/qt5script.mk                           | 2 +-
 package/qt5/qt5scxml/qt5scxml.hash                           | 2 +-
 package/qt5/qt5scxml/qt5scxml.mk                             | 2 +-
 package/qt5/qt5sensors/qt5sensors.hash                       | 2 +-
 package/qt5/qt5sensors/qt5sensors.mk                         | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash                   | 2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk                     | 2 +-
 package/qt5/qt5serialport/qt5serialport.hash                 | 2 +-
 package/qt5/qt5serialport/qt5serialport.mk                   | 2 +-
 package/qt5/qt5speech/qt5speech.hash                         | 2 +-
 package/qt5/qt5speech/qt5speech.mk                           | 2 +-
 package/qt5/qt5svg/qt5svg.hash                               | 2 +-
 package/qt5/qt5svg/qt5svg.mk                                 | 2 +-
 package/qt5/qt5tools/qt5tools.hash                           | 2 +-
 package/qt5/qt5tools/qt5tools.mk                             | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash       | 2 +-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk         | 2 +-
 package/qt5/qt5wayland/qt5wayland.hash                       | 2 +-
 package/qt5/qt5wayland/qt5wayland.mk                         | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash                 | 2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk                   | 2 +-
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 4 ++--
 package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk   | 2 +-
 package/qt5/qt5websockets/qt5websockets.hash                 | 2 +-
 package/qt5/qt5websockets/qt5websockets.mk                   | 2 +-
 package/qt5/qt5webview/qt5webview.hash                       | 2 +-
 package/qt5/qt5webview/qt5webview.mk                         | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash                   | 2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk                     | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash               | 2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                 | 2 +-
 62 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index b55accacf1..a43b36dd51 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 QT5_VERSION_MAJOR = 5.15
-QT5_VERSION = $(QT5_VERSION_MAJOR).10
+QT5_VERSION = $(QT5_VERSION_MAJOR).11
 QT5_SITE = https://invent.kde.org/qt/qt
 
 include $(sort $(wildcard package/qt5/*/*.mk))
diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 0f63aab72a..2cfd56dee3 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
+sha256  4501fb625ce2f7e2b66a2e15e58048cc0ecf769f6bbdda0bca8e79eb67df3dfb  qt3d-c1f8fa2578d99e07f5e581f26bd532695b9534f9.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 4b748a4972..91583fc911 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT53D_VERSION = 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
+QT53D_VERSION = c1f8fa2578d99e07f5e581f26bd532695b9534f9
 QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
 QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
 QT53D_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index 4efc8fa172..353ae2e3c2 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5622a9053154af9a353b8e8be217104c6af068b5b5aba8b07ef4fea2dc79fded  qtbase-e44097b63d17ba3178a637df7fac51ddc51cb48b.tar.bz2
+sha256  deef4d6cc19d87409f15ed6b13aab6297a1d31081b93570032cb6e43c3f001c4  qtbase-56faf7249c3857f80f6483c5070e7408c2d53961.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cc29f5523f..df3af941fd 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = e44097b63d17ba3178a637df7fac51ddc51cb48b
+QT5BASE_VERSION = 56faf7249c3857f80f6483c5070e7408c2d53961
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 0688f64615..fec54c86b1 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9d2ad94a054bd7df08e5d11bc77b6422ccecbf99ea8dd6f06908bafc72ea869d  qtcharts-841083c263f16f8acb81e4915bf24bbed0461c9a.tar.bz2
+sha256  66dae46a8bcb1dfc10dd3404296701c41e50658792e4a6a7317a182fad6f36c8  qtcharts-e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index fa69263be4..bfc6021289 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CHARTS_VERSION = 841083c263f16f8acb81e4915bf24bbed0461c9a
+QT5CHARTS_VERSION = e17308d5ce83a8b66aeeaaaf16ce16d4ee6b2826
 QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
 QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
 QT5CHARTS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 1252a73247..3424d652f7 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ec1d91fc35d8b4a333209fb5fd85e00ab77345bff48b60b4e43b804a59f60979  qtconnectivity-c5f35f89e975c2ad58c83c6b606d40ba41057f15.tar.bz2
+sha256  75157e0814336670c54955c3ab884a12fccbc0f499cc80447bafd541f1a03189  qtconnectivity-e33b82889625b6a72e0be91c5023a30d53136a80.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 72797de1a0..28840bfbf1 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CONNECTIVITY_VERSION = c5f35f89e975c2ad58c83c6b606d40ba41057f15
+QT5CONNECTIVITY_VERSION = e33b82889625b6a72e0be91c5023a30d53136a80
 QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
 QT5CONNECTIVITY_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index 0e7978dc58..f170602985 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  dbe0cdf84767564a56abf9d0d867c9cfcc754827169357a0f8162309c11882b5  qtdeclarative-b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a.tar.bz2
+sha256  889156307144ebc8389e42bfad24419cf9bde3a4c78a81298dde5f10cce026b4  qtdeclarative-ac678baefa2c5aa2e6bdc8f5e84cfb6307488278.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 18c1608fca..fe8043f7a2 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = b3aaf1482c48bbc0ca4f7c7934597c055afe4b6a
+QT5DECLARATIVE_VERSION = ac678baefa2c5aa2e6bdc8f5e84cfb6307488278
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
index ec84ecdcb5..1a52faa5db 100644
--- a/package/qt5/qt5doc/qt5doc.hash
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  87ef0ba72ede78148dfae8fbe78c839f0e9966e1ab4a58d7725041144c0de70f  qtdoc-897e90fe304d844beaf694b82a93a50237fa8b9e.tar.bz2
+sha256  284209db126cdc0d63a773fc0199d7ba7fb52532c5a7f7b2b98b2e9ebb0ca558  qtdoc-c8af0c56f1765302f8bdf874dfacb11c4e0bf4e3.tar.bz2
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
index 77845a347f..e8b4bb35dd 100644
--- a/package/qt5/qt5doc/qt5doc.mk
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DOC_VERSION = 897e90fe304d844beaf694b82a93a50237fa8b9e
+QT5DOC_VERSION = c8af0c56f1765302f8bdf874dfacb11c4e0bf4e3
 QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
 QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
 QT5DOC_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index 95567b2476..e5fdaf67bf 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  de41af344889d35252fec9a6b6c78e1f67b7a7be15a5d3986b2ec20e2fcafadc  qtgraphicaleffects-e6e1e58ec28fd0f2e6426e6962cc4ccddb493349.tar.bz2
+sha256  18afbc24b40420ce0fe6bfad8331f43a1d8c8ec22501b7987ecec9334b69e9a2  qtgraphicaleffects-cce7d784237cd2dd4af1abe2757d048e34e02685.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index f829c67122..ddf805303b 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5GRAPHICALEFFECTS_VERSION = e6e1e58ec28fd0f2e6426e6962cc4ccddb493349
+QT5GRAPHICALEFFECTS_VERSION = cce7d784237cd2dd4af1abe2757d048e34e02685
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 9d821672b3..e03cd91e12 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8bf646d4db7d0099dd49b7c049a64fb585a3e180d73fc2b6edf22a1384529d1d  qtimageformats-9044695f4b1acdd7ec24e7b01f6a6ca61f982a75.tar.bz2
+sha256  7a2b1ba933031dea3af8f2c84a0113e4fa80ce5d07f654c0dfb688fd254759d0  qtimageformats-b22bf4d0d77c7dafe8b4622f8bb45ac0b9cc9bdd.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 0ce6e4ffb4..85a21cc77d 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5IMAGEFORMATS_VERSION = 9044695f4b1acdd7ec24e7b01f6a6ca61f982a75
+QT5IMAGEFORMATS_VERSION = b22bf4d0d77c7dafe8b4622f8bb45ac0b9cc9bdd
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 904d31a983..7b4d7b3aad 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOCATION_VERSION = ebdf5b38da6e3fe0a183702bcca395c589c459ed
+QT5LOCATION_VERSION = 3fbdab90cb8f9432c8c7018b1f6a5c8f626c0454
 QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
 QT5LOCATION_SITE_METHOD = git
 QT5LOCATION_GIT_SUBMODULES = YES
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index cbd94fd111..642625753c 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  82336dd063f8bedc28e9545cc8c0123053434d6c681e470434c80ad3908ca4b0  qtlottie-d40b67401afe7156b03c62c9a4d517b07555fe64.tar.bz2
+sha256  4d8a063687c25675b012821e252a1afd455bdb4ea43e6d79787f9991c68cb5c5  qtlottie-909b79f4810b8ac62baa3544837793cfb132593b.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
index 42a920582a..d4ad3afc63 100644
--- a/package/qt5/qt5lottie/qt5lottie.mk
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOTTIE_VERSION = d40b67401afe7156b03c62c9a4d517b07555fe64
+QT5LOTTIE_VERSION = 909b79f4810b8ac62baa3544837793cfb132593b
 QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
 QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
 QT5LOTTIE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 4803ef9230..96c10f4211 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  842c5be64dafe7a68d2b120e24faffd14af6e4d9d8e9c0aa8bbf4330b3491aa3  qtmultimedia-76f84c545429a1b988b79f971734ef4bc3e6643f.tar.bz2
+sha256  1de187077b61fa65ee64a98dd48c2538aaca3663b9ac6c28cbcf3bad55b2a762  qtmultimedia-f587b18db4abd68cb6d4d77fbcec1b94c38d2a51.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 0d0f5dd53d..f31940db83 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5MULTIMEDIA_VERSION = 76f84c545429a1b988b79f971734ef4bc3e6643f
+QT5MULTIMEDIA_VERSION = f587b18db4abd68cb6d4d77fbcec1b94c38d2a51
 QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
 QT5MULTIMEDIA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 05a021e8b2..219dc8d588 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e2c7bc6346a8eb4c21510f8fbf7e752648f68a0c5af8525a784e64503570f72c  qtquickcontrols-e62b8b6d2f45a79652238b33f4bbe23023004ae7.tar.bz2
+sha256  8c02691d3eb45b9f144bef64c9705e26e8a4c725a0731b18450d39a589965c49  qtquickcontrols-dcc90558d9c0cba41eec7df290943994289b0e87.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 25c1a74f5c..86792ddd8e 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS_VERSION = e62b8b6d2f45a79652238b33f4bbe23023004ae7
+QT5QUICKCONTROLS_VERSION = dcc90558d9c0cba41eec7df290943994289b0e87
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
 QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
 QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 88777a5cc3..653f233d14 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  53caea73e6bdf234cb445067be3bc4e07ed59af7da967638ac598188b719958e  qtquickcontrols2-74e8db97fdb9b55c4b4614b83f4bf17e00df55e9.tar.bz2
+sha256  94e0489e71f20506a3af066f25c7ea01983a966c442cc303c41b34c00f35d684  qtquickcontrols2-a2d56960dd76c94a5115b5415be5ee174d377718.tar.bz2
 
 # Hashes for license files:
 sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index 1732921203..027f42404e 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS2_VERSION = 74e8db97fdb9b55c4b4614b83f4bf17e00df55e9
+QT5QUICKCONTROLS2_VERSION = a2d56960dd76c94a5115b5415be5ee174d377718
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
 QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index a8acf3c5a2..1c9f436b1b 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d22637609c4afcc7560d92c894eb55d4afa01706bb5c86499bf56f7c8723a605  qtquicktimeline-87ad61716a7cba5a070d8a7b1756c8b2b48d5d53.tar.bz2
+sha256  ee404943ef00dbac33928cf001b613ca517fdfdf2767b932a8def5f8c2b0797f  qtquicktimeline-b1b4b882dabaa036c3fb73c4a879ba8efbb02ded.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
index de94bd0375..3a8542ab1b 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKTIMELINE_VERSION = 87ad61716a7cba5a070d8a7b1756c8b2b48d5d53
+QT5QUICKTIMELINE_VERSION = b1b4b882dabaa036c3fb73c4a879ba8efbb02ded
 QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
 QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
 QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index 1b41ab675f..a931ce09cb 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ef8e1f64911f7e03da6306693031fdf953af00d453ec154497178bb7ceab1aa2  qtremoteobjects-aa705010da0f658b78c1155babce7091ae44529a.tar.bz2
+sha256  677b8ccb5c07673296c4fa01bcbc6bd9b8e3a534d332624f61fe0360a5649703  qtremoteobjects-bdc316aca82769b43cb7821c10d80a1ca02b846e.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index 3160d37ad7..5fea3487a5 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5REMOTEOBJECTS_VERSION = aa705010da0f658b78c1155babce7091ae44529a
+QT5REMOTEOBJECTS_VERSION = bdc316aca82769b43cb7821c10d80a1ca02b846e
 QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
 QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index d6572be818..c8299f2df1 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7731d8c85636d039a2b35a9ee0de7b5ebb0c3900a9b4845676041ce91f56f01f  qtscript-f237e324508dcf0dbabde9dd498eda9fa61c4ff0.tar.bz2
+sha256  fcc97acc5b503936a2e7b16f975873768a509d4d6eabbce313a90db82dc8928e  qtscript-0e91c4ab62dfc812584a5323a7af328d307a3204.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 96cbbfbbad..1221c4d1e0 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCRIPT_VERSION = f237e324508dcf0dbabde9dd498eda9fa61c4ff0
+QT5SCRIPT_VERSION = 0e91c4ab62dfc812584a5323a7af328d307a3204
 QT5SCRIPT_SITE = $(QT5_SITE)/qtscript/-/archive/$(QT5SCRIPT_VERSION)
 QT5SCRIPT_SOURCE = qtscript-$(QT5SCRIPT_VERSION).tar.bz2
 QT5SCRIPT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index f4d52b8a52..0f13743f45 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a0113f54d9df14ebae15dd85530f87f093a284372ee8237d1ccceb02e6a4607b  qtscxml-631fd7bcc34802b7650c2b1dc73691463954d982.tar.bz2
+sha256  d598238bfa3bbbe283a8bd2907a4e8e813e00c522f08297a856e6595bbd44099  qtscxml-e8727aabe55526956295407d27317ec15e12b283.tar.bz2
 
 # Hashes for license files:
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index f6ccb9298e..32ef425e97 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCXML_VERSION = 631fd7bcc34802b7650c2b1dc73691463954d982
+QT5SCXML_VERSION = e8727aabe55526956295407d27317ec15e12b283
 QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
 QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
 QT5SCXML_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index d43fa8ba65..37a23516df 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8325826a259189fc7dea66651df4022a92a73664e953f86bce5bf5946ebacdf5  qtsensors-35eb5ac7eaef4745a38958c3ca780d7baa2e4f30.tar.bz2
+sha256  f44148d1a21f3959d79f973d8aa233ddfacf37af6e27902fca8c885b91933fcc  qtsensors-a41492b23cde20d1e00427d31e4637d06aea3638.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 40bb72e038..29e257fdda 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SENSORS_VERSION = 35eb5ac7eaef4745a38958c3ca780d7baa2e4f30
+QT5SENSORS_VERSION = a41492b23cde20d1e00427d31e4637d06aea3638
 QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
 QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
 QT5SENSORS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 01ffd7c215..1d1861a4a3 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fe08415d2348797429dc09722478630ceee3d7477652a2712460e79127b7291b  qtserialbus-f9f7eee60adac72fcf6617d164e3bf61222bb5c5.tar.bz2
+sha256  952b145ae64e03208d7c2a0b0b2b94b928e8998eb72c6762b54e4d9760737dde  qtserialbus-c41785c9f36560722b917d373ee97eed8cc4089a.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index c718414932..3315ef5be7 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALBUS_VERSION = f9f7eee60adac72fcf6617d164e3bf61222bb5c5
+QT5SERIALBUS_VERSION = c41785c9f36560722b917d373ee97eed8cc4089a
 QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
 QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
 QT5SERIALBUS_DEPENDENCIES = qt5serialport
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 58461430c7..e95392b880 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6d49d0da174632f51291b0190f6f1db2397a3b339cf293514252766f8a20c63b  qtserialport-c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694.tar.bz2
+sha256  2b7584de148f0b6ea2cf162609d44d7ad3bb893b1995427ceed72cb4562db6d7  qtserialport-3380465d5d4977326616c5e57789a81681be650e.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 7d00bd2ab7..462d1dd7b9 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALPORT_VERSION = c9abfcd5d88cb43c2a7c1d5ddecbff4cdd320694
+QT5SERIALPORT_VERSION = 3380465d5d4977326616c5e57789a81681be650e
 QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
 QT5SERIALPORT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
index 595aac9f22..b33ace6428 100644
--- a/package/qt5/qt5speech/qt5speech.hash
+++ b/package/qt5/qt5speech/qt5speech.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6d0794ab9d5286d04fbac2db44c00ed3306e569c876f84cfd91ac0e79c834b1e  qtspeech-d32f4a479d38a11f547598004b975f4356424a16.tar.bz2
+sha256  07ac232102beefbaab808afa25c88dfcf02905f77b48c9211a1dc3fdcb161e4a  qtspeech-3b163bfd46d96bc9ee848dcee49e9cabe6699287.tar.bz2
 
 # Hashes for license files:
 sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
index 8cf6fe19c1..ae278fbf33 100644
--- a/package/qt5/qt5speech/qt5speech.mk
+++ b/package/qt5/qt5speech/qt5speech.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SPEECH_VERSION = d32f4a479d38a11f547598004b975f4356424a16
+QT5SPEECH_VERSION = 3b163bfd46d96bc9ee848dcee49e9cabe6699287
 QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
 QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
 QT5SPEECH_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 4816206d64..0d6008c9c3 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  063ee53515b934c00a65838fe8521142e4a9161b07c8e19b5bb0ea26a0ce9ab3  qtsvg-a9752b00a03438de8e5b080073816e12409404b7.tar.bz2
+sha256  41d324627c01904ddfdf058ebcace9169009a8856f721c8f2e2f2477ac5ec660  qtsvg-7d6e373c7db9c05ef586db0eb50c87cd894229ad.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 2a39ed18fe..6a8a06e73d 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SVG_VERSION = a9752b00a03438de8e5b080073816e12409404b7
+QT5SVG_VERSION = 7d6e373c7db9c05ef586db0eb50c87cd894229ad
 QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
 QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
 QT5SVG_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index d603598257..b50a0198e4 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b6eebbd61dcde981d63ce6de39b3c957bad8f11b0140585ba4d57d166c4dd79d  qttools-32912a06aadfc3dcbc34e0a668ce2c78351eee6e.tar.bz2
+sha256  95c2d63016d0e718f1c6415e497fde210a3167dc75f0a3da6f72aa17ded64ac9  qttools-16d0a9944bbd4a05edfb364bc5c28f19533a7449.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index a01a336584..06665fc358 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5TOOLS_VERSION = 32912a06aadfc3dcbc34e0a668ce2c78351eee6e
+QT5TOOLS_VERSION = 16d0a9944bbd4a05edfb364bc5c28f19533a7449
 QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
 QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 60d51fa5fe..89559b63f2 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e1e356e81f3a3fb5da6f6739aa475c15aab15090e202de6704441a3bf41c335b  qtvirtualkeyboard-9fbb837b55887bec5d73fad142c853ef68db35b3.tar.bz2
+sha256  c8dfb16614a63e39c714673abe35a7c30107d359356695634af619e62e8ce6cd  qtvirtualkeyboard-817378aa10176fd26eed36542bc657e48d9dd42e.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 49ce71b75e..5657d78c30 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5VIRTUALKEYBOARD_VERSION = 9fbb837b55887bec5d73fad142c853ef68db35b3
+QT5VIRTUALKEYBOARD_VERSION = 817378aa10176fd26eed36542bc657e48d9dd42e
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index c9d7f3434c..69dee5cacf 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c881745403a7c3639ee928f64ac9e7252d7a941cb62ef682a7ee83ccf3ae0a60  qtwayland-8faf74a7966b520f0ac3eb4d88235f8ec63b31b8.tar.bz2
+sha256  98d325f806cfc2e128d9576756f5bace24a5677536dab1e1df5bd8d9c9fd1049  qtwayland-49c8a8d3c29998a3a160a139948ad8730b35a3d5.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index aeca1b0381..f321785ea6 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = 8faf74a7966b520f0ac3eb4d88235f8ec63b31b8
+QT5WAYLAND_VERSION = 49c8a8d3c29998a3a160a139948ad8730b35a3d5
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index b5e9f1a043..24cb56b4b4 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a281a053471f5c480d7c2679caa0a759e8628f6eafc07c1781f1eb8bb97ee37d  qtwebchannel-8c842152da613f941892481d62267c73c4a4f006.tar.bz2
+sha256  51bf9a28c9827b8c3f25001258e1c2a37dcf48f806ddd33fb82b9b1bcf105fe7  qtwebchannel-f84887c1aee4ab04af375e639ae965c9ea2186a5.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 54e6a70ddb..6dcfbbfb8c 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBCHANNEL_VERSION = 8c842152da613f941892481d62267c73c4a4f006
+QT5WEBCHANNEL_VERSION = f84887c1aee4ab04af375e639ae965c9ea2186a5
 QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
 QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
 QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
index 103e27d889..b1071e08a5 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  14c0654d046fd1faf0204b79e33c091012a8f4df972777e5691875aa75d29a65  qtwebengine-chromium-0ad2814370799a2161057d92231fe3ee00e2fe98.tar.bz2
+sha256  163f876b9e49ed76d3c6db9aff0a95167064c861804a151a59871f44bb0c541a  qtwebengine-chromium-ce00f9b5aa761866b24d6460e10aacb671c92cf0.tar.bz2
 
 # Locally calculated with:
 # for i in $(find * -type f \( -iname 'license*' -o -iname 'copying*' -o -name 'APPLE_LICENSE' -o -name 'Copyright' -o -path '*/license_texts/*' -o -path '*/licenses/*' \) -a -not -name '*.cc' -not -name '*.py' -not -name '*.pyc' -not -name '*.h' -not -name 'LICENSE.sha1' -not -name 'licensecheck.pl*' -not -name 'license.after' -not -name 'license.before' -not -path 'chromium/third_party/catapult/*') ; do echo -n "sha256  " ; sha256sum $i ; done | sort --key=3
@@ -1231,7 +1231,7 @@ sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  chromi
 sha256  c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  chromium/third_party/xcbproto/src/COPYING
 sha256  b244f73c3d21edaf44ec253b9a7c389ec43313c417f52f8b71914b0c40d87325  chromium/third_party/xdg-utils/LICENSE
 sha256  1cf71700f3403ca26f002e2dc1d1861dcb3d2af9bb9d98d529a903be9d7f06fc  chromium/third_party/xstream/LICENSE
-sha256  942755efa272dbfbcd7afea7a38556801e36c16dcad002d572378367094a2593  chromium/third_party/zlib/LICENSE
+sha256  e1cfcc55c325b3f78cf55df9664abaa066e2271dffe8213347d9fccdfbac8f2c  chromium/third_party/zlib/LICENSE
 sha256  1744e977d24e20e77b1e97d745fe43779430a1b84247b6c0e89d16e116e7ff92  chromium/third_party/zxcvbn-cpp/LICENSE.txt
 sha256  a4c8c5abf82b36c22f8c9f8bd6229584f32eb9f7a2429dd9664dda43e63e9fda  chromium/tools/grit/third_party/six/LICENSE
 sha256  63f0c0039b477857e54708d9501ed91b7a46e828ac3c623bedbc318129ceb174  chromium/tools/origin_trials/third_party/ed25519/LICENSE
diff --git a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
index 2b061815b5..52911016c8 100644
--- a/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
+++ b/package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBENGINE_CHROMIUM_VERSION = 0ad2814370799a2161057d92231fe3ee00e2fe98
+QT5WEBENGINE_CHROMIUM_VERSION = ce00f9b5aa761866b24d6460e10aacb671c92cf0
 QT5WEBENGINE_CHROMIUM_SITE = $(QT5_SITE)/qtwebengine-chromium/-/archive/$(QT5WEBENGINE_CHROMIUM_VERSION)
 QT5WEBENGINE_CHROMIUM_SOURCE = qtwebengine-chromium-$(QT5WEBENGINE_CHROMIUM_VERSION).tar.bz2
 QT5WEBENGINE_CHROMIUM_PATCH_DEPENDENCIES = qt5webengine-chromium-catapult
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 72fbb4a599..1dee94f914 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  00a6d312f2e0ec8c64c12f6a178681d5936ec65bc7f1b85948b58cdb5021a8b6  qtwebsockets-6a4991250793cd38efa5e8db858cd49c82439130.tar.bz2
+sha256  7a56600d0b2343465809e04b472b9989ef44876a42e2526a0f502f23fe8a5f18  qtwebsockets-d41bb9f4f7ab9d5ff184ef94cf2f6ff7cf01de00.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 4eafb0b212..d30a2abd8c 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBSOCKETS_VERSION = 6a4991250793cd38efa5e8db858cd49c82439130
+QT5WEBSOCKETS_VERSION = d41bb9f4f7ab9d5ff184ef94cf2f6ff7cf01de00
 QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
 QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
 QT5WEBSOCKETS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index d928c7cdce..00525dbad2 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  38f6c0a2863e9144632286b0ef43db506b8631eeff0f8facae14b0da86ca0491  qtwebview-87577dde04ed219bda776dabca86176149736331.tar.bz2
+sha256  2427179da946d6df409e334c94ffe3f8589035a5d566caf52db2333cc9bfe47c  qtwebview-f078642eb9a440f6aa88f2beaf10f445de1e29bb.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index a55fd8ae74..01a377c27b 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBVIEW_VERSION = 87577dde04ed219bda776dabca86176149736331
+QT5WEBVIEW_VERSION = f078642eb9a440f6aa88f2beaf10f445de1e29bb
 QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
 QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
 QT5WEBVIEW_DEPENDENCIES = qt5webengine
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index 87dac8625e..132c28dd96 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cf9124f3d35f1c8db4e9e47943cb1ec86834abf2be38d70412d0452e64462906  qtx11extras-982f20eb585d77e5b5c721e05a466d7161f7f2d1.tar.bz2
+sha256  7d99fa4d900207c0ae1c7a514e7dc0b607c04e0232d2842a8d84f52534bd16e6  qtx11extras-5fb2e067a38d3583684310130f5d8aad064f512f.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 80c5498518..a6fade0135 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5X11EXTRAS_VERSION = 982f20eb585d77e5b5c721e05a466d7161f7f2d1
+QT5X11EXTRAS_VERSION = 5fb2e067a38d3583684310130f5d8aad064f512f
 QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
 QT5X11EXTRAS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index 353dfc8485..9be7bb7831 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  067b801049f6fada8e7ebcfbce0530db6217a1a94b8ed34c99c530be4129889d  qtxmlpatterns-30e6c84fe2752cde8b53aff9d38c2095cd7c8761.tar.bz2
+sha256  7770b333f2c0079cf65aa19dafd9e7d80fe058baf8e924f1c0d6e75c0b6e7374  qtxmlpatterns-5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 803c36cf04..2126d3c915 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5XMLPATTERNS_VERSION = 30e6c84fe2752cde8b53aff9d38c2095cd7c8761
+QT5XMLPATTERNS_VERSION = 5a1948ddc05bf44017ac12bd5c2b9bc79fbcb9a2
 QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
 QT5XMLPATTERNS_INSTALL_STAGING = YES
-- 
2.43.0


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

