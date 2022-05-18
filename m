Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA92C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 01:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 225C68136D;
	Wed, 18 May 2022 01:34:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rsy5HDOSfv8k; Wed, 18 May 2022 01:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D9C81354;
	Wed, 18 May 2022 01:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA13A1BF429
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C753260B66
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 01:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nPTw19XgHZSn for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 01:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF37B60B55
 for <buildroot@buildroot.org>; Wed, 18 May 2022 01:34:37 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id o190so716338iof.10
 for <buildroot@buildroot.org>; Tue, 17 May 2022 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6zApQZVM2361ItUHYzcxCA0FkgbgrLePJ0l+tWT3nKY=;
 b=S1rFyjdyd2vMNYM+0pwk1PqU7+zgw4/EdXYloyVFH7SI5aGSbz2/hDb9OiuV3X9K8y
 9XObwRQQuI64ESi9NC2x4c1jfrcu5inlwIqUx4yE92J9ryOflr7AfznrBjakfNfGGwIs
 6lX6cVdI5A9TK/7zeNe2FYIm18cRRhPCcfMBluQ+E6UyU1zSX3+tKoVdRd9QHvqsCqbq
 cUMnYmDStNoo7wf3TEplcUObWXly6cIgOuL46Zi6J6Xt+smmP8oKp+kpm1s25nB3dWRY
 ZDa34KmxfKVTse2Lfa9n0I71uYJCZUnqsOF/4n70+4ztJ4BG/oHpmu3uMJsXfG+jnZfc
 2dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6zApQZVM2361ItUHYzcxCA0FkgbgrLePJ0l+tWT3nKY=;
 b=WriLXSQFxDLSTpIstTcctAANpvNkvWvJkvmt71/N8Ts+t3+sR2BtqKtIhrOqwtnfjB
 lfx4AGkVGougSbhhxeQb4Hnp+kyFb1pSfDIwhXM4ea02oddmboAbOFAthJ5PwOUEn5LX
 4P5KccbZ3Pdf+doK2Cp3d7EJelIC66pv9K5H7bGIPjY5hL7qa+2uA7LMLNt3cJQq34lH
 LI7ZuDi+Q3KyLZHMWvph6h6khbsyC9ccDLE3Dn387npda1p9JvuQuFpeO0QXzrKb0omy
 dBe2/5rVGlrbfQIvilIJM9VuH5n3dlSY4sf5pCpiyVc9wMlcnZDjRANmWaEcj3dt7qHe
 44sQ==
X-Gm-Message-State: AOAM531IpuZ7zJ9JpmmGUCjoWLpwHiNgqsSvbbk0wWJO3ab1uEX5eX5F
 M+kY990CV41QkvA20TFw99qqam0bGtc=
X-Google-Smtp-Source: ABdhPJzpDx8xV3NShmp7oUz/sOBTw1NbcztuIjz/RSNKjkGgGasjJRs9weqFwcAIC/r0hA+5kP3TJw==
X-Received: by 2002:a05:6638:1512:b0:32b:796c:80c3 with SMTP id
 b18-20020a056638151200b0032b796c80c3mr13320272jat.69.1652837675930; 
 Tue, 17 May 2022 18:34:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056e02130100b002cde6e352c5sm240810ilr.15.2022.05.17.18.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:34:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 19:34:24 -0600
Message-Id: <20220518013424.2558229-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5: bump packages to latest kde
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
Cc: Joshua Henderson <joshua.henderson@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump qt5 packages to latest submodule versions from:
https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15

Drop a qt5location patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt53d/qt53d.hash                  |   2 +-
 package/qt5/qt53d/qt53d.mk                    |   2 +-
 package/qt5/qt5base/qt5base.hash              |   2 +-
 package/qt5/qt5base/qt5base.mk                |   2 +-
 package/qt5/qt5charts/qt5charts.hash          |   2 +-
 package/qt5/qt5charts/qt5charts.mk            |   2 +-
 .../qt5/qt5connectivity/qt5connectivity.hash  |   2 +-
 .../qt5/qt5connectivity/qt5connectivity.mk    |   2 +-
 .../qt5/qt5declarative/qt5declarative.hash    |   2 +-
 package/qt5/qt5declarative/qt5declarative.mk  |   2 +-
 .../qt5graphicaleffects.hash                  |   2 +-
 .../qt5graphicaleffects.mk                    |   2 +-
 .../qt5/qt5imageformats/qt5imageformats.hash  |   2 +-
 .../qt5/qt5imageformats/qt5imageformats.mk    |   2 +-
 ...fix-compilation-for-no-opengl-builds.patch | 528 ------------------
 package/qt5/qt5location/qt5location.hash      |   2 +-
 package/qt5/qt5location/qt5location.mk        |   2 +-
 package/qt5/qt5lottie/qt5lottie.hash          |   2 +-
 package/qt5/qt5lottie/qt5lottie.mk            |   2 +-
 package/qt5/qt5multimedia/qt5multimedia.hash  |   2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk    |   2 +-
 .../qt5quickcontrols/qt5quickcontrols.hash    |   2 +-
 .../qt5/qt5quickcontrols/qt5quickcontrols.mk  |   2 +-
 .../qt5quickcontrols2/qt5quickcontrols2.hash  |   2 +-
 .../qt5quickcontrols2/qt5quickcontrols2.mk    |   2 +-
 .../qt5quicktimeline/qt5quicktimeline.hash    |   2 +-
 .../qt5/qt5quicktimeline/qt5quicktimeline.mk  |   2 +-
 .../qt5remoteobjects/qt5remoteobjects.hash    |   2 +-
 .../qt5/qt5remoteobjects/qt5remoteobjects.mk  |   2 +-
 package/qt5/qt5script/qt5script.hash          |   2 +-
 package/qt5/qt5script/qt5script.mk            |   2 +-
 package/qt5/qt5scxml/qt5scxml.hash            |   2 +-
 package/qt5/qt5scxml/qt5scxml.mk              |   2 +-
 package/qt5/qt5sensors/qt5sensors.hash        |   2 +-
 package/qt5/qt5sensors/qt5sensors.mk          |   2 +-
 package/qt5/qt5serialbus/qt5serialbus.hash    |   2 +-
 package/qt5/qt5serialbus/qt5serialbus.mk      |   2 +-
 package/qt5/qt5serialport/qt5serialport.hash  |   2 +-
 package/qt5/qt5serialport/qt5serialport.mk    |   2 +-
 package/qt5/qt5svg/qt5svg.hash                |   2 +-
 package/qt5/qt5svg/qt5svg.mk                  |   2 +-
 package/qt5/qt5tools/qt5tools.hash            |   2 +-
 package/qt5/qt5tools/qt5tools.mk              |   2 +-
 .../qt5virtualkeyboard.hash                   |   2 +-
 .../qt5virtualkeyboard/qt5virtualkeyboard.mk  |   2 +-
 package/qt5/qt5wayland/qt5wayland.hash        |   2 +-
 package/qt5/qt5wayland/qt5wayland.mk          |   2 +-
 package/qt5/qt5webchannel/qt5webchannel.hash  |   2 +-
 package/qt5/qt5webchannel/qt5webchannel.mk    |   2 +-
 package/qt5/qt5websockets/qt5websockets.hash  |   2 +-
 package/qt5/qt5websockets/qt5websockets.mk    |   2 +-
 package/qt5/qt5webview/qt5webview.hash        |   2 +-
 package/qt5/qt5webview/qt5webview.mk          |   2 +-
 package/qt5/qt5x11extras/qt5x11extras.hash    |   2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk      |   2 +-
 .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk  |   2 +-
 57 files changed, 56 insertions(+), 584 deletions(-)
 delete mode 100644 package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch

diff --git a/package/qt5/qt53d/qt53d.hash b/package/qt5/qt53d/qt53d.hash
index 32d3675619..0f63aab72a 100644
--- a/package/qt5/qt53d/qt53d.hash
+++ b/package/qt5/qt53d/qt53d.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4c40260d4298b3e71a9879b43530b1e0b3f235a680bb0e7be76a375f4ae24696  qt3d-dba14d48611b9e9d59576172658779ab4a39b416.tar.bz2
+sha256  44955f90a9af19d80136cb51a929f330ba9e3319d30d1f5d0c2bb4adc7fd7173  qt3d-5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPL
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 9a07d189bd..4b748a4972 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT53D_VERSION = dba14d48611b9e9d59576172658779ab4a39b416
+QT53D_VERSION = 5fd3906445ac95bf1cca6e7a7e0aeb6e3bcf5016
 QT53D_SITE = $(QT5_SITE)/qt3d/-/archive/$(QT53D_VERSION)
 QT53D_SOURCE = qt3d-$(QT53D_VERSION).tar.bz2
 QT53D_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5base/qt5base.hash b/package/qt5/qt5base/qt5base.hash
index c031f71c77..27d2b99c34 100644
--- a/package/qt5/qt5base/qt5base.hash
+++ b/package/qt5/qt5base/qt5base.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  18c17d441fbefa9dd13d1d6bfb5f542c986ba86cc37930247f9e4d782df2244b  qtbase-f31e001a9399e4e620847ea2c3e90749350140ae.tar.bz2
+sha256  ecff8cf42af98c2294f7c99eb8c41564892f470382adaf8f4048c85252849808  qtbase-2ffb7ad8a1079a0444b9c72affe3d19b089b60de.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 926d6a307a..a81892422c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5BASE_VERSION = f31e001a9399e4e620847ea2c3e90749350140ae
+QT5BASE_VERSION = 2ffb7ad8a1079a0444b9c72affe3d19b089b60de
 QT5BASE_SITE = $(QT5_SITE)/qtbase/-/archive/$(QT5BASE_VERSION)
 QT5BASE_SOURCE = qtbase-$(QT5BASE_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5charts/qt5charts.hash b/package/qt5/qt5charts/qt5charts.hash
index 021d4ea19f..ba22e29996 100644
--- a/package/qt5/qt5charts/qt5charts.hash
+++ b/package/qt5/qt5charts/qt5charts.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  60f973c79aa059981347864ca26ef361ac38bc835286ac5875f6c7c1248a9b21  qtcharts-130463160b4923069eb98da49edaf7d93180f4f8.tar.bz2
+sha256  32119f7ac88c250b24835b91a71510bf673f1cede6e572fd1059debf8325d7ff  qtcharts-16c2a8821135bf89369c4e3c5a1bdff8b05ffdb5.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 24e635b93b..0028c9f8cb 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CHARTS_VERSION = 130463160b4923069eb98da49edaf7d93180f4f8
+QT5CHARTS_VERSION = 16c2a8821135bf89369c4e3c5a1bdff8b05ffdb5
 QT5CHARTS_SITE = $(QT5_SITE)/qtcharts/-/archive/$(QT5CHARTS_VERSION)
 QT5CHARTS_SOURCE = qtcharts-$(QT5CHARTS_VERSION).tar.bz2
 QT5CHARTS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5connectivity/qt5connectivity.hash b/package/qt5/qt5connectivity/qt5connectivity.hash
index 12e9d637b2..1252a73247 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.hash
+++ b/package/qt5/qt5connectivity/qt5connectivity.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  216e9f6b1be00897ac1ce12f0ea4d1733eb70acd49ec3a83d01cd472b2fb5450  qtconnectivity-5e9ca5d36d65dadb98ef90013a1dcf15fbd7ae26.tar.bz2
+sha256  ec1d91fc35d8b4a333209fb5fd85e00ab77345bff48b60b4e43b804a59f60979  qtconnectivity-c5f35f89e975c2ad58c83c6b606d40ba41057f15.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index a4c79be10b..72797de1a0 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5CONNECTIVITY_VERSION = 5e9ca5d36d65dadb98ef90013a1dcf15fbd7ae26
+QT5CONNECTIVITY_VERSION = c5f35f89e975c2ad58c83c6b606d40ba41057f15
 QT5CONNECTIVITY_SITE = $(QT5_SITE)/qtconnectivity/-/archive/$(QT5CONNECTIVITY_VERSION)
 QT5CONNECTIVITY_SOURCE = qtconnectivity-$(QT5CONNECTIVITY_VERSION).tar.bz2
 QT5CONNECTIVITY_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index e5b016fc20..00c9a04432 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  afea60cbfa48f88c1f0f54b8dbbf90370f6d2535179b4ccaf489db8133ff37ea  qtdeclarative-1d49a5b678957adde7e2db23a485a3f48157bc8f.tar.bz2
+sha256  0dd6b29bb19ad419d47d1fb612b39b1834d675fd1c58b80cd85c7d3da98b40bf  qtdeclarative-51efb2ed2f071beda188270a23ac450fe4b318f7.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 54aa3be1cb..cece8e476b 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = 1d49a5b678957adde7e2db23a485a3f48157bc8f
+QT5DECLARATIVE_VERSION = 51efb2ed2f071beda188270a23ac450fe4b318f7
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
index e755f0848b..5de13a176d 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3035f0a07a0c0a0627ecd082de4b39bbe91521314f11bb63bf4ce81347b855f9  qtgraphicaleffects-c36998dc1581167b12cc3de8e4ac68c2a5d9f76e.tar.bz2
+sha256  83ee3888473fb786c1615c4b98320a9b1eeeb66dbc1ef9743b8339718594e48e  qtgraphicaleffects-4c6ec38635aa22cf0854df8e710733c529f4ec02.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 542eb4de90..e4c464b8c7 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5GRAPHICALEFFECTS_VERSION = c36998dc1581167b12cc3de8e4ac68c2a5d9f76e
+QT5GRAPHICALEFFECTS_VERSION = 4c6ec38635aa22cf0854df8e710733c529f4ec02
 QT5GRAPHICALEFFECTS_SITE = $(QT5_SITE)/qtgraphicaleffects/-/archive/$(QT5GRAPHICALEFFECTS_VERSION)
 QT5GRAPHICALEFFECTS_SOURCE = qtgraphicaleffects-$(QT5GRAPHICALEFFECTS_VERSION).tar.bz2
 QT5GRAPHICALEFFECTS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5imageformats/qt5imageformats.hash b/package/qt5/qt5imageformats/qt5imageformats.hash
index 49690de3bb..9b8a788cae 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.hash
+++ b/package/qt5/qt5imageformats/qt5imageformats.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f2ff68c0d7192443e2fbcfdec73ee6a6bb160461b7757539906d9ad0c7f600d9  qtimageformats-cb82c74310837fe4e832c8ab72176a5d63e4355f.tar.bz2
+sha256  4ce1982ccf3232d25187286ca4893bcf00b149cf9f6706f06f60d908fab480a0  qtimageformats-b43e31b9f31ec482ddea2066fda7ca9315512815.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 506cd123a8..2cc8e0f17b 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5IMAGEFORMATS_VERSION = cb82c74310837fe4e832c8ab72176a5d63e4355f
+QT5IMAGEFORMATS_VERSION = b43e31b9f31ec482ddea2066fda7ca9315512815
 QT5IMAGEFORMATS_SITE = $(QT5_SITE)/qtimageformats/-/archive/$(QT5IMAGEFORMATS_VERSION)
 QT5IMAGEFORMATS_SOURCE = qtimageformats-$(QT5IMAGEFORMATS_VERSION).tar.bz2
 QT5IMAGEFORMATS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch b/package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch
deleted file mode 100644
index 98e65df202..0000000000
--- a/package/qt5/qt5location/0002-fix-compilation-for-no-opengl-builds.patch
+++ /dev/null
@@ -1,528 +0,0 @@
-From 4bcacd0dc8f73de7b9e5e5f5fa2129fd88bdff3b Mon Sep 17 00:00:00 2001
-From: Michal Klocek <michal.klocek@qt.io>
-Date: Mon, 11 Jan 2021 16:02:14 +0100
-Subject: [PATCH] Fix compilation for no opengl builds
-
-Disables experimental labs qml plugin, which
-since a4469cad40 depends heavily on opengl backend.
-
-Fix warnings with msvc when compiling without experimental
-plugin.
-
-Task-number: QTBUG-91623
-Fixes: QTBUG-88017
-Change-Id: I53c5da915981bd05f39134ba57f585d0a0786aa8
-
-Signed-off-by: Michal Klocek <michal.klocek@qt.io>
-Signed-off-by: Alex Blasche <alexander.blasche@qt.io>
-
-[Retrieved from: https://codereview.qt-project.org/c/qt/qtlocation/+/340353]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- src/location/configure.json                   |  1 +
- .../qdeclarativecirclemapitem.cpp             | 20 +++++++++++--
- .../qdeclarativecirclemapitem_p_p.h           |  2 ++
- .../qdeclarativepolygonmapitem.cpp            | 27 +++++++++++++----
- .../qdeclarativepolygonmapitem_p_p.h          |  6 ++++
- .../qdeclarativepolylinemapitem.cpp           | 30 +++++++++++++++----
- .../qdeclarativepolylinemapitem_p.h           |  2 ++
- .../qdeclarativepolylinemapitem_p_p.h         |  5 +++-
- .../qdeclarativerectanglemapitem.cpp          | 17 +++++++++--
- .../qdeclarativerectanglemapitem_p_p.h        |  2 ++
- src/location/location.pro                     |  9 +++++-
- .../itemsoverlay/qgeomapitemsoverlay.cpp      |  9 +++++-
- 12 files changed, 109 insertions(+), 21 deletions(-)
-
-diff --git a/src/location/configure.json b/src/location/configure.json
-index 62ab029..6d01a9a 100644
---- a/src/location/configure.json
-+++ b/src/location/configure.json
-@@ -9,6 +9,7 @@
-             "label": "Qt.labs.location experimental QML plugin",
-             "purpose": "Provides experimental QtLocation QML types",
-             "section": "Location",
-+            "condition": "config.opengl",
-             "output": [ "privateFeature" ]
-         },
-         "geoservices_osm": {
-diff --git a/src/location/declarativemaps/qdeclarativecirclemapitem.cpp b/src/location/declarativemaps/qdeclarativecirclemapitem.cpp
-index 841c29a..955de2c 100644
---- a/src/location/declarativemaps/qdeclarativecirclemapitem.cpp
-+++ b/src/location/declarativemaps/qdeclarativecirclemapitem.cpp
-@@ -446,6 +446,7 @@ void QDeclarativeCircleMapItem::updatePolish()
- */
- void QDeclarativeCircleMapItem::possiblySwitchBackend(const QGeoCoordinate &oldCenter, qreal oldRadius, const QGeoCoordinate &newCenter, qreal newRadius)
- {
-+#if QT_CONFIG(opengl)
-     if (m_backend != QDeclarativeCircleMapItem::OpenGL)
-         return;
- 
-@@ -459,6 +460,9 @@ void QDeclarativeCircleMapItem::possiblySwitchBackend(const QGeoCoordinate &oldC
-         QScopedPointer<QDeclarativeCircleMapItemPrivate> d(static_cast<QDeclarativeCircleMapItemPrivate *>(new QDeclarativeCircleMapItemPrivateOpenGL(*this)));
-         m_d.swap(d);
-     }
-+#else
-+    return;
-+#endif
- }
- 
- /*!
-@@ -534,9 +538,17 @@ void QDeclarativeCircleMapItem::setBackend(QDeclarativeCircleMapItem::Backend b)
-     if (b == m_backend)
-         return;
-     m_backend = b;
--    QScopedPointer<QDeclarativeCircleMapItemPrivate> d((m_backend == Software)
--                                                        ? static_cast<QDeclarativeCircleMapItemPrivate *>(new QDeclarativeCircleMapItemPrivateCPU(*this))
--                                                        : static_cast<QDeclarativeCircleMapItemPrivate * >(new QDeclarativeCircleMapItemPrivateOpenGL(*this)));
-+    QScopedPointer<QDeclarativeCircleMapItemPrivate> d(
-+            (m_backend == Software) ? static_cast<QDeclarativeCircleMapItemPrivate *>(
-+                    new QDeclarativeCircleMapItemPrivateCPU(*this))
-+#if QT_CONFIG(opengl)
-+                                    : static_cast<QDeclarativeCircleMapItemPrivate *>(
-+                                            new QDeclarativeCircleMapItemPrivateOpenGL(*this)));
-+#else
-+                                    : nullptr);
-+    qFatal("Requested non software rendering backend, but source code is compiled wihtout opengl "
-+           "support");
-+#endif
-     m_d.swap(d);
-     m_d->onGeoGeometryChanged();
-     emit backendChanged();
-@@ -565,7 +577,9 @@ QDeclarativeCircleMapItemPrivate::~QDeclarativeCircleMapItemPrivate() {}
- 
- QDeclarativeCircleMapItemPrivateCPU::~QDeclarativeCircleMapItemPrivateCPU() {}
- 
-+#if QT_CONFIG(opengl)
- QDeclarativeCircleMapItemPrivateOpenGL::~QDeclarativeCircleMapItemPrivateOpenGL() {}
-+#endif
- 
- bool QDeclarativeCircleMapItemPrivate::preserveCircleGeometry (QList<QDoubleVector2D> &path,
-                                     const QGeoCoordinate &center, qreal distance, const QGeoProjectionWebMercator &p)
-diff --git a/src/location/declarativemaps/qdeclarativecirclemapitem_p_p.h b/src/location/declarativemaps/qdeclarativecirclemapitem_p_p.h
-index 4cf4217..dbe6c8b 100644
---- a/src/location/declarativemaps/qdeclarativecirclemapitem_p_p.h
-+++ b/src/location/declarativemaps/qdeclarativecirclemapitem_p_p.h
-@@ -275,6 +275,7 @@ public:
-     MapPolygonNode *m_node = nullptr;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativeCircleMapItemPrivateOpenGL: public QDeclarativeCircleMapItemPrivate
- {
- public:
-@@ -443,6 +444,7 @@ public:
-     MapPolygonNodeGL *m_node = nullptr;
-     MapPolylineNodeOpenGLExtruded *m_polylinenode = nullptr;
- };
-+#endif // QT_CONFIG(opengl)
- 
- QT_END_NAMESPACE
- 
-diff --git a/src/location/declarativemaps/qdeclarativepolygonmapitem.cpp b/src/location/declarativemaps/qdeclarativepolygonmapitem.cpp
-index fa6ee17..af4f55e 100644
---- a/src/location/declarativemaps/qdeclarativepolygonmapitem.cpp
-+++ b/src/location/declarativemaps/qdeclarativepolygonmapitem.cpp
-@@ -334,6 +334,7 @@ void QGeoMapPolygonGeometry::updateScreenPoints(const QGeoMap &map, qreal stroke
-         this->translate(QPointF(strokeWidth, strokeWidth));
- }
- 
-+#if QT_CONFIG(opengl)
- QGeoMapPolygonGeometryOpenGL::QGeoMapPolygonGeometryOpenGL(){
- }
- 
-@@ -344,6 +345,7 @@ void QGeoMapPolygonGeometryOpenGL::updateSourcePoints(const QGeoMap &map, const
-         geopath.append(QWebMercator::mercatorToCoord(c));
-     updateSourcePoints(map, geopath);
- }
-+#endif
- 
- // wrapPath always preserves the geometry
- // This one handles holes
-@@ -452,6 +454,7 @@ static void cutPathEars(const QList<QDoubleVector2D> &wrappedPath,
-         screenIndices << quint32(i);
- }
- 
-+#if QT_CONFIG(opengl)
- /*!
-     \internal
- */
-@@ -594,7 +597,7 @@ void QGeoMapPolygonGeometryOpenGL::updateQuickGeometry(const QGeoProjectionWebMe
-     sourceBounds_.setWidth(brect.width());
-     sourceBounds_.setHeight(brect.height());
- }
--
-+#endif // QT_CONFIG(opengl)
- /*
-  * QDeclarativePolygonMapItem Private Implementations
-  */
-@@ -603,8 +606,9 @@ QDeclarativePolygonMapItemPrivate::~QDeclarativePolygonMapItemPrivate() {}
- 
- QDeclarativePolygonMapItemPrivateCPU::~QDeclarativePolygonMapItemPrivateCPU() {}
- 
-+#if QT_CONFIG(opengl)
- QDeclarativePolygonMapItemPrivateOpenGL::~QDeclarativePolygonMapItemPrivateOpenGL() {}
--
-+#endif
- /*
-  * QDeclarativePolygonMapItem Implementation
-  */
-@@ -689,9 +693,17 @@ void QDeclarativePolygonMapItem::setBackend(QDeclarativePolygonMapItem::Backend
-     if (b == m_backend)
-         return;
-     m_backend = b;
--    QScopedPointer<QDeclarativePolygonMapItemPrivate> d((m_backend == Software)
--                                                        ? static_cast<QDeclarativePolygonMapItemPrivate *>(new QDeclarativePolygonMapItemPrivateCPU(*this))
--                                                        : static_cast<QDeclarativePolygonMapItemPrivate * >(new QDeclarativePolygonMapItemPrivateOpenGL(*this)));
-+    QScopedPointer<QDeclarativePolygonMapItemPrivate> d(
-+            (m_backend == Software) ? static_cast<QDeclarativePolygonMapItemPrivate *>(
-+                    new QDeclarativePolygonMapItemPrivateCPU(*this))
-+#if QT_CONFIG(opengl)
-+                                    : static_cast<QDeclarativePolygonMapItemPrivate *>(
-+                                            new QDeclarativePolygonMapItemPrivateOpenGL(*this)));
-+#else
-+                                    : nullptr);
-+    qFatal("Requested non software rendering backend, but source code is compiled wihtout opengl "
-+           "support");
-+#endif
-     m_d.swap(d);
-     m_d->onGeoGeometryChanged();
-     emit backendChanged();
-@@ -898,6 +910,7 @@ void QDeclarativePolygonMapItem::geometryChanged(const QRectF &newGeometry, cons
- 
- //////////////////////////////////////////////////////////////////////
- 
-+#if QT_CONFIG(opengl)
- QSGMaterialShader *MapPolygonMaterial::createShader() const
- {
-     return new MapPolygonShader();
-@@ -916,6 +929,7 @@ QSGMaterialType *MapPolygonMaterial::type() const
-     static QSGMaterialType type;
-     return &type;
- }
-+#endif
- 
- MapPolygonNode::MapPolygonNode() :
-     border_(new MapPolylineNode()),
-@@ -967,6 +981,7 @@ void MapPolygonNode::update(const QColor &fillColor, const QColor &borderColor,
-     }
- }
- 
-+#if QT_CONFIG(opengl)
- MapPolygonNodeGL::MapPolygonNodeGL() :
-     //fill_material_(this),
-     fill_material_(),
-@@ -1052,5 +1067,5 @@ void MapPolygonShader::updateState(const QSGMaterialShader::RenderState &state,
-     program()->setUniformValue(m_center_lowpart_id, vecCenter_lowpart);
-     program()->setUniformValue(m_wrapOffset_id, float(newMaterial->wrapOffset()));
- }
--
-+#endif // QT_CONFIG(opengl)
- QT_END_NAMESPACE
-diff --git a/src/location/declarativemaps/qdeclarativepolygonmapitem_p_p.h b/src/location/declarativemaps/qdeclarativepolygonmapitem_p_p.h
-index 8d566e6..5e75deb 100644
---- a/src/location/declarativemaps/qdeclarativepolygonmapitem_p_p.h
-+++ b/src/location/declarativemaps/qdeclarativepolygonmapitem_p_p.h
-@@ -89,6 +89,7 @@ protected:
-     bool assumeSimple_;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QGeoMapPolygonGeometryOpenGL : public QGeoMapItemGeometry
- {
- public:
-@@ -197,6 +198,7 @@ private:
-     int m_color_id;
-     int m_wrapOffset_id;
- };
-+#endif // QT_CONFIG(opengl)
- 
- class Q_LOCATION_PRIVATE_EXPORT MapPolygonMaterial : public QSGFlatColorMaterial
- {
-@@ -269,6 +271,7 @@ private:
-     QSGGeometry geometry_;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT MapPolygonNodeGL : public MapItemGeometryNode
- {
- 
-@@ -284,6 +287,7 @@ public:
-     MapPolygonMaterial fill_material_;
-     QSGGeometry geometry_;
- };
-+#endif // QT_CONFIG(opengl)
- 
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativePolygonMapItemPrivate
- {
-@@ -479,6 +483,7 @@ public:
-     MapPolygonNode *m_node = nullptr;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativePolygonMapItemPrivateOpenGL: public QDeclarativePolygonMapItemPrivate
- {
- public:
-@@ -662,6 +667,7 @@ public:
-     MapPolygonNodeGL *m_node = nullptr;
-     MapPolylineNodeOpenGLExtruded *m_polylinenode = nullptr;
- };
-+#endif // QT_CONFIG(opengl)
- 
- QT_END_NAMESPACE
- 
-diff --git a/src/location/declarativemaps/qdeclarativepolylinemapitem.cpp b/src/location/declarativemaps/qdeclarativepolylinemapitem.cpp
-index d59704d..83d253f 100644
---- a/src/location/declarativemaps/qdeclarativepolylinemapitem.cpp
-+++ b/src/location/declarativemaps/qdeclarativepolylinemapitem.cpp
-@@ -769,6 +769,7 @@ bool QGeoMapPolylineGeometry::contains(const QPointF &point) const
-     return false;
- }
- 
-+#if QT_CONFIG(opengl)
- void QGeoMapPolylineGeometryOpenGL::updateSourcePoints(const QGeoMap &map, const QGeoPolygon &poly)
- {
-     if (!sourceDirty_)
-@@ -921,6 +922,7 @@ void QGeoMapPolylineGeometryOpenGL::updateQuickGeometry(const QGeoProjectionWebM
-     sourceBounds_.setWidth(brect.width() + strokeWidth);
-     sourceBounds_.setHeight(brect.height() + strokeWidth);
- }
-+#endif // QT_CONFIG(opengl)
- 
- /*
-  * QDeclarativePolygonMapItem Private Implementations
-@@ -928,12 +930,13 @@ void QGeoMapPolylineGeometryOpenGL::updateQuickGeometry(const QGeoProjectionWebM
- 
- QDeclarativePolylineMapItemPrivate::~QDeclarativePolylineMapItemPrivate() {}
- 
--
- QDeclarativePolylineMapItemPrivateCPU::~QDeclarativePolylineMapItemPrivateCPU() {}
- 
-+#if QT_CONFIG(opengl)
- QDeclarativePolylineMapItemPrivateOpenGLLineStrip::~QDeclarativePolylineMapItemPrivateOpenGLLineStrip() {}
- 
- QDeclarativePolylineMapItemPrivateOpenGLExtruded::~QDeclarativePolylineMapItemPrivateOpenGLExtruded() {}
-+#endif
- 
- /*
-  * QDeclarativePolygonMapItem Implementation
-@@ -941,10 +944,12 @@ QDeclarativePolylineMapItemPrivateOpenGLExtruded::~QDeclarativePolylineMapItemPr
- 
- struct PolylineBackendSelector
- {
-+#if QT_CONFIG(opengl)
-     PolylineBackendSelector()
-     {
-         backend = (qgetenv("QTLOCATION_OPENGL_ITEMS").toInt()) ? QDeclarativePolylineMapItem::OpenGLExtruded : QDeclarativePolylineMapItem::Software;
-     }
-+#endif
-     QDeclarativePolylineMapItem::Backend backend = QDeclarativePolylineMapItem::Software;
- };
- 
-@@ -1236,11 +1241,22 @@ void QDeclarativePolylineMapItem::setBackend(QDeclarativePolylineMapItem::Backen
-     if (b == m_backend)
-         return;
-     m_backend = b;
--    QScopedPointer<QDeclarativePolylineMapItemPrivate> d((m_backend == Software)
--                                                        ? static_cast<QDeclarativePolylineMapItemPrivate *>(new QDeclarativePolylineMapItemPrivateCPU(*this))
--                                                        : ((m_backend == OpenGLExtruded)
--                                                           ? static_cast<QDeclarativePolylineMapItemPrivate * >(new QDeclarativePolylineMapItemPrivateOpenGLExtruded(*this))
--                                                           : static_cast<QDeclarativePolylineMapItemPrivate * >(new QDeclarativePolylineMapItemPrivateOpenGLLineStrip(*this))));
-+    QScopedPointer<QDeclarativePolylineMapItemPrivate> d(
-+            (m_backend == Software)
-+                    ? static_cast<QDeclarativePolylineMapItemPrivate *>(
-+                            new QDeclarativePolylineMapItemPrivateCPU(*this))
-+#if QT_CONFIG(opengl)
-+                    : ((m_backend == OpenGLExtruded)
-+                               ? static_cast<QDeclarativePolylineMapItemPrivate *>(
-+                                       new QDeclarativePolylineMapItemPrivateOpenGLExtruded(*this))
-+                               : static_cast<QDeclarativePolylineMapItemPrivate *>(
-+                                       new QDeclarativePolylineMapItemPrivateOpenGLLineStrip(
-+                                               *this))));
-+#else
-+                    : nullptr);
-+    qFatal("Requested non software rendering backend, but source code is compiled wihtout opengl "
-+           "support");
-+#endif
-     m_d.swap(d);
-     m_d->onGeoGeometryChanged();
-     emit backendChanged();
-@@ -1477,6 +1493,7 @@ void MapPolylineNode::update(const QColor &fillColor,
-     }
- }
- 
-+#if QT_CONFIG(opengl)
- MapPolylineNodeOpenGLLineStrip::MapPolylineNodeOpenGLLineStrip()
- : geometry_(QSGGeometry::defaultAttributes_Point2D(), 0)
- {
-@@ -2080,5 +2097,6 @@ unsigned int QGeoMapItemLODGeometry::zoomForLOD(unsigned int zoom)
-         return res;
-     return res + 1; // give more resolution when closing in
- }
-+#endif // QT_CONFIG(opengl)
- 
- QT_END_NAMESPACE
-diff --git a/src/location/declarativemaps/qdeclarativepolylinemapitem_p.h b/src/location/declarativemaps/qdeclarativepolylinemapitem_p.h
-index 9cd20ea..d3d0ebd 100644
---- a/src/location/declarativemaps/qdeclarativepolylinemapitem_p.h
-+++ b/src/location/declarativemaps/qdeclarativepolylinemapitem_p.h
-@@ -97,8 +97,10 @@ class Q_LOCATION_PRIVATE_EXPORT QDeclarativePolylineMapItem : public QDeclarativ
- public:
-     enum Backend {
-         Software = 0,
-+#if QT_CONFIG(opengl)
-         OpenGLLineStrip = 1,
-         OpenGLExtruded = 2,
-+#endif
-     };
- 
-     explicit QDeclarativePolylineMapItem(QQuickItem *parent = 0);
-diff --git a/src/location/declarativemaps/qdeclarativepolylinemapitem_p_p.h b/src/location/declarativemaps/qdeclarativepolylinemapitem_p_p.h
-index 2a921e2..e184391 100644
---- a/src/location/declarativemaps/qdeclarativepolylinemapitem_p_p.h
-+++ b/src/location/declarativemaps/qdeclarativepolylinemapitem_p_p.h
-@@ -213,6 +213,7 @@ protected:
-     QSGGeometry geometry_;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QGeoMapItemLODGeometry
- {
- public:
-@@ -566,6 +567,7 @@ protected:
-     MapPolylineMaterialExtruded fill_material_;
-     QSGGeometry m_geometryTriangulating;
- };
-+#endif // QT_CONFIG(opengl)
- 
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativePolylineMapItemPrivate
- {
-@@ -720,6 +722,7 @@ public:
-     MapPolylineNode *m_node = nullptr;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativePolylineMapItemPrivateOpenGLLineStrip: public QDeclarativePolylineMapItemPrivate
- {
- public:
-@@ -884,7 +887,7 @@ public:
- 
-     MapPolylineNodeOpenGLExtruded *m_nodeTri = nullptr;
- };
--
-+#endif // QT_CONFIG(opengl)
- QT_END_NAMESPACE
- 
- #endif // QDECLARATIVEPOLYLINEMAPITEM_P_P_H
-diff --git a/src/location/declarativemaps/qdeclarativerectanglemapitem.cpp b/src/location/declarativemaps/qdeclarativerectanglemapitem.cpp
-index 74d2cc1..6192be0 100644
---- a/src/location/declarativemaps/qdeclarativerectanglemapitem.cpp
-+++ b/src/location/declarativemaps/qdeclarativerectanglemapitem.cpp
-@@ -185,9 +185,18 @@ void QDeclarativeRectangleMapItem::setBackend(QDeclarativeRectangleMapItem::Back
-     if (b == m_backend)
-         return;
-     m_backend = b;
--    QScopedPointer<QDeclarativeRectangleMapItemPrivate> d((m_backend == Software)
--                                                        ? static_cast<QDeclarativeRectangleMapItemPrivate *>(new QDeclarativeRectangleMapItemPrivateCPU(*this))
--                                                        : static_cast<QDeclarativeRectangleMapItemPrivate * >(new QDeclarativeRectangleMapItemPrivateOpenGL(*this)));
-+    QScopedPointer<QDeclarativeRectangleMapItemPrivate> d(
-+            (m_backend == Software) ? static_cast<QDeclarativeRectangleMapItemPrivate *>(
-+                    new QDeclarativeRectangleMapItemPrivateCPU(*this))
-+#if QT_CONFIG(opengl)
-+                                    : static_cast<QDeclarativeRectangleMapItemPrivate *>(
-+                                            new QDeclarativeRectangleMapItemPrivateOpenGL(*this)));
-+#else
-+                                    : nullptr);
-+    qFatal("Requested non software rendering backend, but source code is compiled wihtout opengl "
-+           "support");
-+#endif
-+
-     m_d.swap(d);
-     m_d->onGeoGeometryChanged();
-     emit backendChanged();
-@@ -397,6 +406,8 @@ QDeclarativeRectangleMapItemPrivate::~QDeclarativeRectangleMapItemPrivate() {}
- 
- QDeclarativeRectangleMapItemPrivateCPU::~QDeclarativeRectangleMapItemPrivateCPU() {}
- 
-+#if QT_CONFIG(opengl)
- QDeclarativeRectangleMapItemPrivateOpenGL::~QDeclarativeRectangleMapItemPrivateOpenGL() {}
-+#endif
- 
- QT_END_NAMESPACE
-diff --git a/src/location/declarativemaps/qdeclarativerectanglemapitem_p_p.h b/src/location/declarativemaps/qdeclarativerectanglemapitem_p_p.h
-index 65d2f61..f7ecd2a 100644
---- a/src/location/declarativemaps/qdeclarativerectanglemapitem_p_p.h
-+++ b/src/location/declarativemaps/qdeclarativerectanglemapitem_p_p.h
-@@ -244,6 +244,7 @@ public:
-     MapPolygonNode *m_node = nullptr;
- };
- 
-+#if QT_CONFIG(opengl)
- class Q_LOCATION_PRIVATE_EXPORT QDeclarativeRectangleMapItemPrivateOpenGL: public QDeclarativeRectangleMapItemPrivate
- {
- public:
-@@ -410,6 +411,7 @@ public:
-     MapPolygonNodeGL *m_node = nullptr;
-     MapPolylineNodeOpenGLExtruded *m_polylinenode = nullptr;
- };
-+#endif // QT_CONFIG(opengl)
- 
- QT_END_NAMESPACE
- 
-diff --git a/src/location/location.pro b/src/location/location.pro
-index b0e2c3f..ae20271 100644
---- a/src/location/location.pro
-+++ b/src/location/location.pro
-@@ -39,7 +39,14 @@ include(maps/maps.pri)
- include(places/places.pri)
- include(declarativemaps/declarativemaps.pri)
- include(declarativeplaces/declarativeplaces.pri)
--qtConfig(location-labs-plugin):include(labs/labs.pri)
-+qtConfig(location-labs-plugin) {
-+   include(labs/labs.pri)
-+} else {
-+  # FIXME: this should be moved out of plugin source code, geojson is referenced from other places
-+  # within codebase,however compilation of location-labs-plugin is optional
-+  PRIVATE_HEADERS += labs/qgeojson_p.h
-+  SOURCES += labs/qgeojson.cpp
-+}
- 
- HEADERS += $$PUBLIC_HEADERS $$PRIVATE_HEADERS
- 
-diff --git a/src/plugins/geoservices/itemsoverlay/qgeomapitemsoverlay.cpp b/src/plugins/geoservices/itemsoverlay/qgeomapitemsoverlay.cpp
-index 1ebad08..a764438 100644
---- a/src/plugins/geoservices/itemsoverlay/qgeomapitemsoverlay.cpp
-+++ b/src/plugins/geoservices/itemsoverlay/qgeomapitemsoverlay.cpp
-@@ -103,6 +103,7 @@ QGeoMap::Capabilities QGeoMapItemsOverlay::capabilities() const
- bool QGeoMapItemsOverlay::createMapObjectImplementation(QGeoMapObject *obj)
- {
- #ifndef LOCATIONLABS
-+    Q_UNUSED(obj);
-     return false;
- #else
-     Q_D(QGeoMapItemsOverlay);
-@@ -132,7 +133,9 @@ QSGNode *QGeoMapItemsOverlay::updateSceneGraph(QSGNode *node, QQuickWindow *wind
- 
- void QGeoMapItemsOverlay::removeMapObject(QGeoMapObject *obj)
- {
--#ifdef LOCATIONLABS
-+#ifndef LOCATIONLABS
-+    Q_UNUSED(obj);
-+#else
-     Q_D(QGeoMapItemsOverlay);
-     d->removeMapObject(obj);
- #endif
-@@ -169,7 +172,11 @@ QRectF QGeoMapItemsOverlayPrivate::visibleArea() const
- QGeoMapItemsOverlayPrivate::QGeoMapItemsOverlayPrivate(QGeoMappingManagerEngineItemsOverlay *engine, QGeoMapItemsOverlay *map)
-     : QGeoMapPrivate(engine, new QGeoProjectionWebMercator)
- {
-+#ifndef LOCATIONLABS
-+    Q_UNUSED(map);
-+#else
-     m_qsgSupport.m_map = map;
-+#endif
- }
- 
- QGeoMapItemsOverlayPrivate::~QGeoMapItemsOverlayPrivate()
--- 
-2.33.1
-
diff --git a/package/qt5/qt5location/qt5location.hash b/package/qt5/qt5location/qt5location.hash
index 17da2bb9ad..e41b20fd9b 100644
--- a/package/qt5/qt5location/qt5location.hash
+++ b/package/qt5/qt5location/qt5location.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  11cf8320598821c97f853635c529451503917895f11e664dfdd0b63bf48c8a46  qt5location-861e372b6ad81570d4f496e42fb25a6699b72f2f-br1.tar.gz
+sha256  f9673cb1e5b88b4c43d663d7b9b666ff82d6843bf2b445805367cf537839a782  qt5location-db3b6bc6afed6477e6ab2d8465e41efee30fb6d5-br1.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index b1d19d7811..a61994fa53 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOCATION_VERSION = 861e372b6ad81570d4f496e42fb25a6699b72f2f
+QT5LOCATION_VERSION = db3b6bc6afed6477e6ab2d8465e41efee30fb6d5
 QT5LOCATION_SITE = $(QT5_SITE)/qtlocation
 QT5LOCATION_SITE_METHOD = git
 QT5LOCATION_GIT_SUBMODULES = YES
diff --git a/package/qt5/qt5lottie/qt5lottie.hash b/package/qt5/qt5lottie/qt5lottie.hash
index 46ab3f60df..c5c71ddf6c 100644
--- a/package/qt5/qt5lottie/qt5lottie.hash
+++ b/package/qt5/qt5lottie/qt5lottie.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  edbf1270733e385189dbcdad67ecec24c9e372168215873eadb31735d0947de1  qtlottie-fa8c8bfc6742ab98b61d1351e054e0e73e9a42f4.tar.bz2
+sha256  7e006b7a3608f0737f41682352819c404db4c1506d9ebe82eb4af7b1ae652d14  qtlottie-ccba2b00bd7f10558edb8664d6b9a95e9fafe6ac.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5lottie/qt5lottie.mk b/package/qt5/qt5lottie/qt5lottie.mk
index e9614fbecf..d02d693401 100644
--- a/package/qt5/qt5lottie/qt5lottie.mk
+++ b/package/qt5/qt5lottie/qt5lottie.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5LOTTIE_VERSION = fa8c8bfc6742ab98b61d1351e054e0e73e9a42f4
+QT5LOTTIE_VERSION = ccba2b00bd7f10558edb8664d6b9a95e9fafe6ac
 QT5LOTTIE_SITE = $(QT5_SITE)/qtlottie/-/archive/$(QT5LOTTIE_VERSION)
 QT5LOTTIE_SOURCE = qtlottie-$(QT5LOTTIE_VERSION).tar.bz2
 QT5LOTTIE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5multimedia/qt5multimedia.hash b/package/qt5/qt5multimedia/qt5multimedia.hash
index 1c4d930248..527e3948b8 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.hash
+++ b/package/qt5/qt5multimedia/qt5multimedia.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  95e94b016f256b57b2df3f1df7d02d6f077c600faa4312561f02121623dfecef  qtmultimedia-bd29c87027637a013f2c5e3b549fcda84e4d7545.tar.bz2
+sha256  b6a17deafe7ea7ad44e2852a92ea73b0089beaf9f24cb3434d018db9b8170ee6  qtmultimedia-dc0ee181d4c56ff66c989bd3292dad7cc35e234b.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 6695369063..bf2126b285 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5MULTIMEDIA_VERSION = bd29c87027637a013f2c5e3b549fcda84e4d7545
+QT5MULTIMEDIA_VERSION = dc0ee181d4c56ff66c989bd3292dad7cc35e234b
 QT5MULTIMEDIA_SITE = $(QT5_SITE)/qtmultimedia/-/archive/$(QT5MULTIMEDIA_VERSION)
 QT5MULTIMEDIA_SOURCE = qtmultimedia-$(QT5MULTIMEDIA_VERSION).tar.bz2
 QT5MULTIMEDIA_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
index 2138b3e313..45af81c99f 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7df0648d9b8fdde1ea27abd9d6eb3ff170e8e666872ea97c07e1bb5ac241be4b  qtquickcontrols-cf3f6d7fec824cdf01f9b329ab3b92b1c0e0a420.tar.bz2
+sha256  c2ddcf9c524ef12a0786c410ac4b3c6d4be9aa17db71f2ea8c57ff615fda62dd  qtquickcontrols-d405bf6a29bc9d6da6e3dcefbd1b88f5ed70fb1b.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index c2b5ae182e..5903e6d69c 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS_VERSION = cf3f6d7fec824cdf01f9b329ab3b92b1c0e0a420
+QT5QUICKCONTROLS_VERSION = d405bf6a29bc9d6da6e3dcefbd1b88f5ed70fb1b
 QT5QUICKCONTROLS_SITE = $(QT5_SITE)/qtquickcontrols/-/archive/$(QT5QUICKCONTROLS_VERSION)
 QT5QUICKCONTROLS_SOURCE = qtquickcontrols-$(QT5QUICKCONTROLS_VERSION).tar.bz2
 QT5QUICKCONTROLS_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
index 766fd69077..7d81b61407 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f0315b0f0301fdb16d6ee78c57e3cd600121884c1356ca1160ace96a57ac17bc  qtquickcontrols2-d8d6b14b9907adbc6ce307d52be34aaa761a58fa.tar.bz2
+sha256  0c4204257be906c13f863b9481bb20ad616c9a80a074b6f160f863ac046dad27  qtquickcontrols2-0d3d39e821ea7634c174a29910c18d7101bce6f7.tar.bz2
 
 # Hashes for license files:
 sha256  d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca  LICENSE.GPLv3
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index ff1a49a9ce..f847ec95ab 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKCONTROLS2_VERSION = d8d6b14b9907adbc6ce307d52be34aaa761a58fa
+QT5QUICKCONTROLS2_VERSION = 0d3d39e821ea7634c174a29910c18d7101bce6f7
 QT5QUICKCONTROLS2_SITE = $(QT5_SITE)/qtquickcontrols2/-/archive/$(QT5QUICKCONTROLS2_VERSION)
 QT5QUICKCONTROLS2_SOURCE = qtquickcontrols2-$(QT5QUICKCONTROLS2_VERSION).tar.bz2
 QT5QUICKCONTROLS2_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
index c2d0b11f2b..e68f66edd8 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4d88f7f70c8a983378cb9702bf1551c6a150fb283d0540bd43a120d953e077e3  qtquicktimeline-67503cdadea43b95ddad0de1a04951aff0ce1a07.tar.bz2
+sha256  ab113ead993206de4025c78fd2babea69824f52ff88fa78451b6bbcb932a6ab6  qtquicktimeline-2ce816fa5822bcc1c47678447405b2e5dc1312c1.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
index 49d0cb330b..70cca38ff4 100644
--- a/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
+++ b/package/qt5/qt5quicktimeline/qt5quicktimeline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5QUICKTIMELINE_VERSION = 67503cdadea43b95ddad0de1a04951aff0ce1a07
+QT5QUICKTIMELINE_VERSION = 2ce816fa5822bcc1c47678447405b2e5dc1312c1
 QT5QUICKTIMELINE_SITE = $(QT5_SITE)/qtquicktimeline/-/archive/$(QT5QUICKTIMELINE_VERSION)
 QT5QUICKTIMELINE_SOURCE = qtquicktimeline-$(QT5QUICKTIMELINE_VERSION).tar.bz2
 QT5QUICKTIMELINE_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
index a2573a018a..980101c7fb 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  43c876d475228a0b727d2b2ae47cecc8cbd665d1574ad4db61b209c08a488b90  qtremoteobjects-4d6d1e35fb8e0cb900b5e5e9266edea51dc4f735.tar.bz2
+sha256  f51631a142ac47a03266496dae9d07c734f092a0afe8c4e18cd78b7cf9c17b38  qtremoteobjects-809412e1cc2151c21f843796ef67705600f6aafb.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
index b7dee4f2f3..984f392dda 100644
--- a/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
+++ b/package/qt5/qt5remoteobjects/qt5remoteobjects.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5REMOTEOBJECTS_VERSION = 4d6d1e35fb8e0cb900b5e5e9266edea51dc4f735
+QT5REMOTEOBJECTS_VERSION = 809412e1cc2151c21f843796ef67705600f6aafb
 QT5REMOTEOBJECTS_SITE = $(QT5_SITE)/qtremoteobjects/-/archive/$(QT5REMOTEOBJECTS_VERSION)
 QT5REMOTEOBJECTS_SOURCE = qtremoteobjects-$(QT5REMOTEOBJECTS_VERSION).tar.bz2
 QT5REMOTEOBJECTS_DEPENDENCIES = qt5base
diff --git a/package/qt5/qt5script/qt5script.hash b/package/qt5/qt5script/qt5script.hash
index 0b34ff3e8f..b3e10491fd 100644
--- a/package/qt5/qt5script/qt5script.hash
+++ b/package/qt5/qt5script/qt5script.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  bd748330ad08ea504875b9e0a316c0ecc01e6990e16d3bec61f5f55b9e291011  qtscript-5be95f966aabc5170f0aacfd4b0a46217241bfd6.tar.bz2
+sha256  fc625c1682d7ee5d1092255408cbaf08d5cac52eb45bacd3ab52937dc84d91f2  qtscript-5cec94b2c1503f106f4ef4778d016410ebb86211.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 4e51eacfc3..313895f11b 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCRIPT_VERSION = 5be95f966aabc5170f0aacfd4b0a46217241bfd6
+QT5SCRIPT_VERSION = 5cec94b2c1503f106f4ef4778d016410ebb86211
 QT5SCRIPT_SITE = $(QT5_SITE)/qtscript/-/archive/$(QT5SCRIPT_VERSION)
 QT5SCRIPT_SOURCE = qtscript-$(QT5SCRIPT_VERSION).tar.bz2
 QT5SCRIPT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5scxml/qt5scxml.hash b/package/qt5/qt5scxml/qt5scxml.hash
index 85e72f5378..1c11ae5853 100644
--- a/package/qt5/qt5scxml/qt5scxml.hash
+++ b/package/qt5/qt5scxml/qt5scxml.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  6ce28e969efae2ab74fe3eda61a5d90fcfc4bf734cd9f36942a6968189530e69  qtscxml-7a15000f42c7a3171719727cd056f82a78244ed7.tar.bz2
+sha256  5fc3e6166ab3588242864c5d8f18235a45f5c3396482ccfeb8590fe67d0cd549  qtscxml-dcbd73cf3e8a07dbfa249d7db2257caafa83781b.tar.bz2
 
 # Hashes for license files:
 sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index d5d26536a3..af18b84e9d 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SCXML_VERSION = 7a15000f42c7a3171719727cd056f82a78244ed7
+QT5SCXML_VERSION = dcbd73cf3e8a07dbfa249d7db2257caafa83781b
 QT5SCXML_SITE = $(QT5_SITE)/qtscxml/-/archive/$(QT5SCXML_VERSION)
 QT5SCXML_SOURCE = qtscxml-$(QT5SCXML_VERSION).tar.bz2
 QT5SCXML_DEPENDENCIES = qt5declarative
diff --git a/package/qt5/qt5sensors/qt5sensors.hash b/package/qt5/qt5sensors/qt5sensors.hash
index 6be87e8cf9..559f02e7f6 100644
--- a/package/qt5/qt5sensors/qt5sensors.hash
+++ b/package/qt5/qt5sensors/qt5sensors.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1db8f6093595b574217eaec98da874d5eb46bb80343ddaa0a5bff0f6b45c5498  qtsensors-921a31375f29e429e95352b08b2b9dbfea663cb1.tar.bz2
+sha256  fa0ffba89fed2086d06dab84074cdd789acbfb89da6f64c40a64fc3bc067832e  qtsensors-1ab8d6c7257f9ec060739b648704be1cf1c16b05.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index eebda912a9..299fab3db0 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SENSORS_VERSION = 921a31375f29e429e95352b08b2b9dbfea663cb1
+QT5SENSORS_VERSION = 1ab8d6c7257f9ec060739b648704be1cf1c16b05
 QT5SENSORS_SITE = $(QT5_SITE)/qtsensors/-/archive/$(QT5SENSORS_VERSION)
 QT5SENSORS_SOURCE = qtsensors-$(QT5SENSORS_VERSION).tar.bz2
 QT5SENSORS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
index 8b560a8a83..b8f96cf0c0 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.hash
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  77056fba2ea313241c4780d959d8a3d916add816ced4cd5c95138e331a178d6b  qtserialbus-8884c5e43df846deac5a0c7c290eeb633d6bfe32.tar.bz2
+sha256  caaccfdabdf502c3aacf9fa842ed31ed7682cab6ada69b06be1ba49273fb1f1c  qtserialbus-e34053fbda8d687e3dc294fbd5e3a88bf94a7a66.tar.bz2
 
 # Hashes for license files:
 sha256  edfe70e99be2a7c109d860b19204609e582720b211c50caedac729da372a1253  LICENSE.GPLv2
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index fc62c85318..70f23ce407 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALBUS_VERSION = 8884c5e43df846deac5a0c7c290eeb633d6bfe32
+QT5SERIALBUS_VERSION = e34053fbda8d687e3dc294fbd5e3a88bf94a7a66
 QT5SERIALBUS_SITE = $(QT5_SITE)/qtserialbus/-/archive/$(QT5SERIALBUS_VERSION)
 QT5SERIALBUS_SOURCE = qtserialbus-$(QT5SERIALBUS_VERSION).tar.bz2
 QT5SERIALBUS_DEPENDENCIES = qt5serialport
diff --git a/package/qt5/qt5serialport/qt5serialport.hash b/package/qt5/qt5serialport/qt5serialport.hash
index 6d821c387f..d25b2193e7 100644
--- a/package/qt5/qt5serialport/qt5serialport.hash
+++ b/package/qt5/qt5serialport/qt5serialport.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  fb618df447132364cabf75e36b5a1d74ae7664a604662366711b58e10d1ce075  qtserialport-941d1d8560d1f3e40077c251fbde6fd6a5b0f0d4.tar.bz2
+sha256  83abb0c5b9c435a031abf1a36d6d44f8e3f5e2fc16150bdc78c6d33b25386bb6  qtserialport-191e67e428522a0e2e1e8d2f3440607a9760d441.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 370093f6f8..cd96df2007 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SERIALPORT_VERSION = 941d1d8560d1f3e40077c251fbde6fd6a5b0f0d4
+QT5SERIALPORT_VERSION = 191e67e428522a0e2e1e8d2f3440607a9760d441
 QT5SERIALPORT_SITE = $(QT5_SITE)/qtserialport/-/archive/$(QT5SERIALPORT_VERSION)
 QT5SERIALPORT_SOURCE = qtserialport-$(QT5SERIALPORT_VERSION).tar.bz2
 QT5SERIALPORT_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5svg/qt5svg.hash b/package/qt5/qt5svg/qt5svg.hash
index 1e4dc54c67..424891ac2c 100644
--- a/package/qt5/qt5svg/qt5svg.hash
+++ b/package/qt5/qt5svg/qt5svg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7f45cc161ede4e918a4f3236af7e81d63404199529460cf74b620565dfce6d9e  qtsvg-728012f7762ecd5762d493f8796907c6456f31e7.tar.bz2
+sha256  eeb4175f0b2c3299abf0ca9d751886612dad5ecd212c954f9801b28b4696f4f7  qtsvg-23b8cf7d833c335d7735855570c05e9e0893a9b7.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 849a2b7f1b..3072fd7a18 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5SVG_VERSION = 728012f7762ecd5762d493f8796907c6456f31e7
+QT5SVG_VERSION = 23b8cf7d833c335d7735855570c05e9e0893a9b7
 QT5SVG_SITE = $(QT5_SITE)/qtsvg/-/archive/$(QT5SVG_VERSION)
 QT5SVG_SOURCE = qtsvg-$(QT5SVG_VERSION).tar.bz2
 QT5SVG_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5tools/qt5tools.hash b/package/qt5/qt5tools/qt5tools.hash
index a563801997..58ed752b9b 100644
--- a/package/qt5/qt5tools/qt5tools.hash
+++ b/package/qt5/qt5tools/qt5tools.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e5ee14a50d5be68ba53e11c76c6e90cc7d7023eab5050447869e7f5e472478a8  qttools-33693a928986006d79c1ee743733cde5966ac402.tar.bz2
+sha256  76052a183a41fcddfd4446ffba6a99c3e77a21453fe629cf67379ffa617a0d53  qttools-53ee43a51b5a3de2877dafffc78e71ff55926708.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index e2385080ce..e87c9b50a5 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5TOOLS_VERSION = 33693a928986006d79c1ee743733cde5966ac402
+QT5TOOLS_VERSION = 53ee43a51b5a3de2877dafffc78e71ff55926708
 QT5TOOLS_SITE = $(QT5_SITE)/qttools/-/archive/$(QT5TOOLS_VERSION)
 QT5TOOLS_SOURCE = qttools-$(QT5TOOLS_VERSION).tar.bz2
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
index 432e3099c3..1cdd8f0386 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a91024f241df0d24ee398c262b61d126d451c70f05ef109901cfb483d1201538  qtvirtualkeyboard-98d1fd864cbb6c7c012c4139118808af110fb8f0.tar.bz2
+sha256  6ef14ba8bb5eb287320b6c0d6e61c5c2916a94ef754bb8a2d89c123043485d67  qtvirtualkeyboard-e8ae4757dd32e8dbf69a7c57f2bc5c1e238416db.tar.bz2
 
 # Hashes for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8e997a2426..c31d455c4e 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5VIRTUALKEYBOARD_VERSION = 98d1fd864cbb6c7c012c4139118808af110fb8f0
+QT5VIRTUALKEYBOARD_VERSION = e8ae4757dd32e8dbf69a7c57f2bc5c1e238416db
 QT5VIRTUALKEYBOARD_SITE = $(QT5_SITE)/qtvirtualkeyboard/-/archive/$(QT5VIRTUALKEYBOARD_VERSION)
 QT5VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT5VIRTUALKEYBOARD_VERSION).tar.bz2
 QT5VIRTUALKEYBOARD_DEPENDENCIES = qt5declarative qt5svg
diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
index 2acdd1643c..58935ceadc 100644
--- a/package/qt5/qt5wayland/qt5wayland.hash
+++ b/package/qt5/qt5wayland/qt5wayland.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f43c8ce9070249dfa91b94c09bcbf7c4fa881daf5eecdb9ff93c0eed43a3b7b0  qtwayland-ce2caf493a1343fbd9f8e4c85baf6a61c057f242.tar.bz2
+sha256  bfe9bce353c036356dc7bca04e634f03c7c924381062ce89627a88df0ae7484e  qtwayland-36659e6130ed3fc2b3f0c91423408ef5ecb7b991.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 61182f611c..63fa1f21c0 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WAYLAND_VERSION = ce2caf493a1343fbd9f8e4c85baf6a61c057f242
+QT5WAYLAND_VERSION = 36659e6130ed3fc2b3f0c91423408ef5ecb7b991
 QT5WAYLAND_SITE = $(QT5_SITE)/qtwayland/-/archive/$(QT5WAYLAND_VERSION)
 QT5WAYLAND_SOURCE = qtwayland-$(QT5WAYLAND_VERSION).tar.bz2
 QT5WAYLAND_DEPENDENCIES = wayland
diff --git a/package/qt5/qt5webchannel/qt5webchannel.hash b/package/qt5/qt5webchannel/qt5webchannel.hash
index af195b32b3..b5e9f1a043 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.hash
+++ b/package/qt5/qt5webchannel/qt5webchannel.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cc75d29ca38d512b79f2bfbcdb641cdb02dd3a1024f2c9c530abec00418effbf  qtwebchannel-fa8b07105b5e274daaa8adcc129fa4aa0447f9f7.tar.bz2
+sha256  a281a053471f5c480d7c2679caa0a759e8628f6eafc07c1781f1eb8bb97ee37d  qtwebchannel-8c842152da613f941892481d62267c73c4a4f006.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 042a28fca9..54e6a70ddb 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBCHANNEL_VERSION = fa8b07105b5e274daaa8adcc129fa4aa0447f9f7
+QT5WEBCHANNEL_VERSION = 8c842152da613f941892481d62267c73c4a4f006
 QT5WEBCHANNEL_SITE = $(QT5_SITE)/qtwebchannel/-/archive/$(QT5WEBCHANNEL_VERSION)
 QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5WEBCHANNEL_VERSION).tar.bz2
 QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
diff --git a/package/qt5/qt5websockets/qt5websockets.hash b/package/qt5/qt5websockets/qt5websockets.hash
index 3cc87865dc..72fbb4a599 100644
--- a/package/qt5/qt5websockets/qt5websockets.hash
+++ b/package/qt5/qt5websockets/qt5websockets.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0f59abfa0172e1d4f7cddc3ed457b71faa3bba1cc25b02a06aa79b5ba0c68653  qtwebsockets-b13b56904b76e96ea52d0efe56395acc94b17d96.tar.bz2
+sha256  00a6d312f2e0ec8c64c12f6a178681d5936ec65bc7f1b85948b58cdb5021a8b6  qtwebsockets-6a4991250793cd38efa5e8db858cd49c82439130.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index d222f025ee..4eafb0b212 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBSOCKETS_VERSION = b13b56904b76e96ea52d0efe56395acc94b17d96
+QT5WEBSOCKETS_VERSION = 6a4991250793cd38efa5e8db858cd49c82439130
 QT5WEBSOCKETS_SITE = $(QT5_SITE)/qtwebsockets/-/archive/$(QT5WEBSOCKETS_VERSION)
 QT5WEBSOCKETS_SOURCE = qtwebsockets-$(QT5WEBSOCKETS_VERSION).tar.bz2
 QT5WEBSOCKETS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5webview/qt5webview.hash b/package/qt5/qt5webview/qt5webview.hash
index 51d0fb0d7a..fe12950929 100644
--- a/package/qt5/qt5webview/qt5webview.hash
+++ b/package/qt5/qt5webview/qt5webview.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  0fd949c35355bbde613c9daa61e32a3d8ed4a7b3e9fc0e3acf92981cc8bf16c3  qtwebview-920de5f1cd9f9001cfef1bfd2c19e6720793362f.tar.bz2
+sha256  6b84aab9bc8292f299b249840218e9e69a1dbbff42e08c5da7cb659cff8bc37d  qtwebview-826d2a33929c69807917536d48b7861e7682001e.tar.bz2
 
 # Hashes for license files:
 sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5webview/qt5webview.mk b/package/qt5/qt5webview/qt5webview.mk
index ed1cfe5065..54da733e7b 100644
--- a/package/qt5/qt5webview/qt5webview.mk
+++ b/package/qt5/qt5webview/qt5webview.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5WEBVIEW_VERSION = 920de5f1cd9f9001cfef1bfd2c19e6720793362f
+QT5WEBVIEW_VERSION = 826d2a33929c69807917536d48b7861e7682001e
 QT5WEBVIEW_SITE = $(QT5_SITE)/qtwebview/-/archive/$(QT5WEBVIEW_VERSION)
 QT5WEBVIEW_SOURCE = qtwebview-$(QT5WEBVIEW_VERSION).tar.bz2
 QT5WEBVIEW_DEPENDENCIES = qt5webengine
diff --git a/package/qt5/qt5x11extras/qt5x11extras.hash b/package/qt5/qt5x11extras/qt5x11extras.hash
index b854cedcb6..7b369b0a02 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.hash
+++ b/package/qt5/qt5x11extras/qt5x11extras.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  b562bc8b81e35d71df5530be07522b50065f177fb744782e4fc7536970c5d9da  qtx11extras-3898f5484fd4864b047729bfeda9a1222f32364f.tar.bz2
+sha256  fde322c017bee349d56f73f402ca67ad986e0c43a592e3ee032313aa194406da  qtx11extras-51b0a5a2e3e35f4cb17da1e7cb4babef6294bfb4.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 7b1e32df17..fb6650e84a 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5X11EXTRAS_VERSION = 3898f5484fd4864b047729bfeda9a1222f32364f
+QT5X11EXTRAS_VERSION = 51b0a5a2e3e35f4cb17da1e7cb4babef6294bfb4
 QT5X11EXTRAS_SITE = $(QT5_SITE)/qtx11extras/-/archive/$(QT5X11EXTRAS_VERSION)
 QT5X11EXTRAS_SOURCE = qtx11extras-$(QT5X11EXTRAS_VERSION).tar.bz2
 QT5X11EXTRAS_INSTALL_STAGING = YES
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
index c0e3caa407..a1dbb40154 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  20363267cd8dc93622a0f444708eb83f0ed6d9d9bceaf13c5db806d96b00cf09  qtxmlpatterns-189e28d0aff1f3d7960228ba318b83e3cadac98c.tar.bz2
+sha256  6243e6334c0d1467e3e5bdecd981d7e673f4cc99cf2cee3b99597be4218a4bd2  qtxmlpatterns-dfcae10dec8c1c2c544ad0cd303cea113b0af51d.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 27818ecb78..3bb4ef74fd 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5XMLPATTERNS_VERSION = 189e28d0aff1f3d7960228ba318b83e3cadac98c
+QT5XMLPATTERNS_VERSION = dfcae10dec8c1c2c544ad0cd303cea113b0af51d
 QT5XMLPATTERNS_SITE = $(QT5_SITE)/qtxmlpatterns/-/archive/$(QT5XMLPATTERNS_VERSION)
 QT5XMLPATTERNS_SOURCE = qtxmlpatterns-$(QT5XMLPATTERNS_VERSION).tar.bz2
 QT5XMLPATTERNS_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
