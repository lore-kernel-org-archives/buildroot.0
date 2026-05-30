Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FBFCD6E54
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F158545A;
	Sat, 30 May 2026 21:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeY92h5npIlO; Sat, 30 May 2026 21:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BCD18545B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176061;
	bh=kZFg9ZWZOKkQXsczN1JMw2DARKn78E2gbp6EpB3c4FI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i00mumRHXhN+OASNvCepv9FfgUpSP0IKSkhx+kzCnNY4yx0uuMDhUBodFI8OH7a6/
	 MGHpv9Dqj6QkYCBDfXBi92AaXmyo3c6n44hiLkl8w6NLTdYHdEo05da2twyjRK/ymd
	 GgTxugK2KDDUjXU/oFR3yQOsi9JHdKyllLGX3j0YfgoOZhTFUoAcrhGJou6pMOg7Dm
	 AkqSHvg1un8+Jf1o74Dy5jagLTJdAQBpAOedycJgXTR1zQGcpeAgvoKUWA0AaDCMmn
	 2xOyAnEPUzI4vMuv+HdYGMZeTYivKAsXY5c+32oDdJwzxNDVJSJMn2cWPiO6Cl7Dmx
	 xtUanI9t3XaDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BCD18545B;
	Sat, 30 May 2026 21:21:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F9CCF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBBE585441
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C5HTOMP5WtF for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:20:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2389F85452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2389F85452
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:20:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E98CA875D9; Sat, 30 May 2026 21:20:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:20:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 822a7ffc079714a369c1ea5f012cd643dfec3f59
X-Git-Newrev: 8a26e08b3609e3d7114c17db7751d5bc356f3dd8
X-Patchwork-Hint: ignore
Message-Id: <20260530212043.E98CA875D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/stellarium: allow
 build with qt6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8a26e08b3609e3d7114c17db7751d5bc356f3dd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/Config.in     | 38 ++++++++++++++++++++++++--------------
 package/stellarium/stellarium.mk | 34 ++++++++++++++++++++++++++--------
 2 files changed, 50 insertions(+), 22 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 20f32e747a..e39454c079 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -1,18 +1,28 @@
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
-	select BR2_PACKAGE_QT5SVG
+	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_OPENGL if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5CHARTS if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5LOCATION if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5MULTIMEDIA if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_CONCURRENT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_OPENGL if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_PRINTSUPPORT if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_WIDGETS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6CHARTS if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6MULTIMEDIA if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6POSITIONING if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6SVG if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
@@ -21,5 +31,5 @@ config BR2_PACKAGE_STELLARIUM
 
 	  https://stellarium.org
 
-comment "stellarium needs Qt5 and an OpenGL provider"
-	depends on !BR2_PACKAGE_QT5 || !BR2_PACKAGE_HAS_LIBGL
+comment "stellarium needs Qt5/6 and an OpenGL provider"
+	depends on (!BR2_PACKAGE_QT5 && !BR2_PACKAGE_QT6) || !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ab689bcf72..f36a3a14df 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -24,22 +24,35 @@ endef
 STELLARIUM_POST_EXTRACT_HOOKS += STELLARIUM_COPY_EXTRA_DOWNLOADS
 
 STELLARIUM_DEPENDENCIES = \
-	qt5base \
-	qt5charts \
-	qt5location \
-	qt5multimedia \
-	qt5svg \
 	zlib
+
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
 	-DENABLE_SHOWMYSKY=OFF \
 	-DENABLE_QTWEBENGINE=OFF \
-	-DENABLE_QT6=OFF \
 	-DENABLE_XLSX=OFF \
 	-DUSE_PLUGIN_TELESCOPECONTROL=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
+ifeq ($(BR2_PACKAGE_QT5),y)
+STELLARIUM_DEPENDENCIES += \
+	qt5base \
+	qt5charts \
+	qt5location \
+	qt5multimedia \
+	qt5svg
+STELLARIUM_CONF_OPTS += -DENABLE_QT6=OFF
+else
+STELLARIUM_DEPENDENCIES += \
+	qt6base \
+	qt6charts \
+	qt6multimedia \
+	qt6positioning \
+	qt6svg
+STELLARIUM_CONF_OPTS += -DENABLE_QT6=ON
+endif
+
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
 STELLARIUM_DEPENDENCIES += qt5script
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=ON
@@ -47,8 +60,13 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
-STELLARIUM_DEPENDENCIES += gpsd qt5serialport
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT)$(BR2_PACKAGE_QT6SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd
+ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
+STELLARIUM_DEPENDENCIES += qt5serialport
+else
+STELLARIUM_DEPENDENCIES += qt6serialport
+endif
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
