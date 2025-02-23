Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0ABC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 18:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7099D40666;
	Sun, 23 Feb 2025 18:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm_b4wFntiP3; Sun, 23 Feb 2025 18:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EBC24065B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBC24065B;
	Sun, 23 Feb 2025 18:37:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB114943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B547404EF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hliBdXowi3Rd for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 18:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AB28409A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AB28409A7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AB28409A7
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:37:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b302.dip0.t-ipconnect.de [84.161.179.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E673A4C512F;
 Sun, 23 Feb 2025 19:37:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58840)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tmGqx-0000000050f-33EO;
 Sun, 23 Feb 2025 18:37:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 19:37:23 +0100
Message-Id: <20250223183723.1517477-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250223183723.1517477-1-bernd@kuhls.net>
References: <20250223183723.1517477-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740335844;
 bh=7+fMkDf+w8aInfIyU7BoQ+Rku16dk81gy3omd1qjVO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AMmiVZufU/V5PV4+O0ibGZuCsysYQyJLqs/g3bhnIlw22Ojy5wi4fVfELaOeZ96TS
 Woaa2FeZvTjPsbMXumE9Jr03Toguq19UlNdfLsdTkO9dtrJHraO9k+o3+3M7cqEi4P
 yshU/wTLBNJx3q4d3kUw2IrWYn2uEXVZs7r9LMoiPHZciyPI8SBm2mcHq8vm6phdZh
 LrvDweK/oFYJN+m/fP8rQs/rjG3nYum2sYklhvy/rtQd0c9fxZ1SZjECpZEz3AGhEo
 XFnWX0EjzAMoZQAy7Ebw5g57wc+f9Rexwe9tkKybsEq0b8ndMP4yRyq5x+O+H1WO5h
 N0Y6x9aNhGFLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=AMmiVZuf
Subject: [Buildroot] [PATCH 3/3] package/stellarium: Add support for QT6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needs new qt6positioning package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/stellarium/Config.in     | 36 ++++++++++++++++++++------------
 package/stellarium/stellarium.mk | 22 +++++++++++++------
 2 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 566f8edc83..2e31b9a723 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -1,17 +1,26 @@
 config BR2_PACKAGE_STELLARIUM
 	bool "stellarium"
-	depends on BR2_PACKAGE_QT5
-	depends on BR2_PACKAGE_QT5_GL_AVAILABLE
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	depends on BR2_PACKAGE_QT5_GL_AVAILABLE || BR2_PACKAGE_QT6_GL_SUPPORTS
 	depends on BR2_PACKAGE_HAS_LIBGL # does not support OpenGL ES
-	select BR2_PACKAGE_QT5BASE_CONCURRENT
-	select BR2_PACKAGE_QT5BASE_GUI
-	select BR2_PACKAGE_QT5BASE_NETWORK
-	select BR2_PACKAGE_QT5BASE_OPENGL
-	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
-	select BR2_PACKAGE_QT5BASE_WIDGETS
-	select BR2_PACKAGE_QT5CHARTS
-	select BR2_PACKAGE_QT5LOCATION
-	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5CHARTS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5LOCATION if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5MULTIMEDIA if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6CHARTS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6MULTIMEDIA if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6POSITIONING if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
@@ -20,5 +29,6 @@ config BR2_PACKAGE_STELLARIUM
 
 	  https://stellarium.org
 
-comment "stellarium needs Qt5 and an OpenGL provider"
-	depends on !BR2_PACKAGE_QT5 || !BR2_PACKAGE_HAS_LIBGL
+comment "stellarium needs Qt5/6 and an OpenGL provider"
+	depends on (!BR2_PACKAGE_QT5 && !BR2_PACKAGE_QT6) || \
+		!BR2_PACKAGE_HAS_LIBGL
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 4c5d84347a..2cb5470d09 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -9,18 +9,28 @@ STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
-STELLARIUM_DEPENDENCIES = \
+STELLARIUM_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_QT5),y)
+STELLARIUM_DEPENDENCIES += \
 	qt5base \
 	qt5charts \
 	qt5location \
-	qt5multimedia \
-	zlib
+	qt5multimedia
+else
+STELLARIUM_DEPENDENCIES += \
+	qt6base \
+	qt6charts \
+	qt6multimedia \
+	qt6positioning
+endif
+
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
 	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
-	-DENABLE_QT6=OFF \
+	-DENABLE_QT6=$(if $(BR2_PACKAGE_QT5),OFF,ON) \
 	-DENABLE_XLSX=OFF \
 	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
@@ -32,8 +42,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
+ifeq ($(BR2_PACKAGE_QT5SERIALPORT)$(BR2_PACKAGE_QT6SERIALPORT),y)
+STELLARIUM_DEPENDENCIES += $(if $(BR2_PACKAGE_QT5),qt5serialport,qt6serialport)
 ifeq ($(BR2_PACKAGE_GPSD),y)
 STELLARIUM_DEPENDENCIES += gpsd
 endif
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
