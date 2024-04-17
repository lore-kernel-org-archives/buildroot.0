Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4CBC41513
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 08:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C304060C;
	Wed, 17 Apr 2024 08:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCs_l7XaCp2C; Wed, 17 Apr 2024 08:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1772440838
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1772440838;
	Wed, 17 Apr 2024 08:06:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B62D01BF341
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A307B60AF3
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 08:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5pnBVCehIAlj for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 08:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 750B260AEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 750B260AEE
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 750B260AEE
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 08:06:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d8b194341eso48854141fa.3
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 01:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341189; x=1713945989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nRgD2+37l3BG+hTHOuxN2xe6lh7WZGTay6iAyVmFxkA=;
 b=JOlELzxLjw1SD7IR+lzLnlaC98jaBG9wdOQ58JbetES5SuLS3gBraTRqq90HR2IcQh
 cXSRJ9bMYlnYQQM4ZuZD9sYVlVXOcYyAkH/pbeqMlA9nbvlMFTiLCdrMkW0Gjy1kUtxc
 EQT+wGbSCao8Qz29soyMk99UyvUJgdIgUmLNeFQsuHpi6Fl2Iek3VB/AvS1OSJE8ie3N
 zUPPeIquwJojEOz3uzGGjqDMQZPbVHgiGkQpVG+Owv+iEcPEhHg6HGg4YItFlio4z2U4
 xSArDbFg5qsK7PT2xWPpqV0NxO31tcLQbQ7uLC0zA16ULLOjs5OrEspOAgNKQZPP5mL8
 3y0g==
X-Gm-Message-State: AOJu0Yx3731XJ4P4RQHQTCCnhxalMLEjT17Au54lvUFDSccFNitcu2BO
 eBPZQTrlei3dLp0Z/U9DrkRz1BLXs2GvV7k5o8Ppb/s4xey/3JahidftfppP
X-Google-Smtp-Source: AGHT+IGMvOGx9/S92tT3uqO3WP84SWQiQ/gWWzIoHQwfK//1/BRW7uBbSr4fgtueDFxlAeQt2kPOxg==
X-Received: by 2002:a05:651c:b0b:b0:2d8:2799:fbcf with SMTP id
 b11-20020a05651c0b0b00b002d82799fbcfmr12018976ljr.34.1713341189205; 
 Wed, 17 Apr 2024 01:06:29 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2e8912000000b002d2191e20e1sm1830254lji.92.2024.04.17.01.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 01:06:28 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 10:05:29 +0200
Message-ID: <20240417080538.3451923-8-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341189; x=1713945989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRgD2+37l3BG+hTHOuxN2xe6lh7WZGTay6iAyVmFxkA=;
 b=jJyfAG1zzZtfTXj7Z4PuicJjKHOvdPOZz+3JSVp8ueq0rUGG+qHEErpJrw6Xwbka0V
 8c2fOFRqd9JgpJK4ddAR5rz9pHP/02bX1NAG2QFL1zTPAoCLBNl6ErQlc10gjkVG3zHH
 uM/uF1uKaVZZZe/0eTegWxmo6Vqs/rQihW8QZxtvKEbOY9+FJfLUeGEvizQqp41J76Sp
 k4FWf7J5pwIYxV/RQB4qiSzM06dPs9+I/U8of3g69hzf/EPd7+3gJ276Wknz7w4jOe6c
 PVvmE3YSsrBXU1oNi3Jm4uBIZIx4HtZ1/7A7O5qp9EZGGCDiq3gzJ2DZBoNzWpZZmdc8
 kO3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jJyfAG1z
Subject: [Buildroot] [PATCH v2 08/11] package/qt6/qt6wayland: new package
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
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
---
 package/qt6/Config.in                  |  1 +
 package/qt6/qt6wayland/Config.in       | 24 ++++++++++++
 package/qt6/qt6wayland/qt6wayland.hash | 11 ++++++
 package/qt6/qt6wayland/qt6wayland.mk   | 53 ++++++++++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 package/qt6/qt6wayland/Config.in
 create mode 100644 package/qt6/qt6wayland/qt6wayland.hash
 create mode 100644 package/qt6/qt6wayland/qt6wayland.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 16f792cff3..69ce0b3f6a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,6 +51,7 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6wayland/Config.in b/package/qt6/qt6wayland/Config.in
new file mode 100644
index 0000000000..814f9e1722
--- /dev/null
+++ b/package/qt6/qt6wayland/Config.in
@@ -0,0 +1,24 @@
+comment "qt6wayland needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+config BR2_PACKAGE_QT6WAYLAND
+	bool "qt6wayland"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6wayland module.
+
+	  https://doc.qt.io/qt-6/qtwayland-index.html
+
+if BR2_PACKAGE_QT6WAYLAND
+
+config BR2_PACKAGE_QT6WAYLAND_COMPOSITOR
+	bool "Enable compositor (experimental)"
+	help
+	  The compositor API is still experimental, and not built by
+	  default.
+
+endif
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
new file mode 100644
index 0000000000..13a6ba15eb
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtwayland-everywhere-src-6.7.0.tar.xz.sha256
+sha256  d73470e4217da388d8cd2a517ee8bb373853f33c569306e80f04397845157aea  qtwayland-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.mk b/package/qt6/qt6wayland/qt6wayland.mk
new file mode 100644
index 0000000000..cf8727287e
--- /dev/null
+++ b/package/qt6/qt6wayland/qt6wayland.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# qt6wayland
+#
+################################################################################
+
+QT6WAYLAND_VERSION = $(QT6_VERSION)
+QT6WAYLAND_SITE = $(QT6_SITE)
+QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
+QT6WAYLAND_INSTALL_STAGING = YES
+
+QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WAYLAND_CMAKE_BACKEND = ninja
+
+QT6WAYLAND_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WAYLAND_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF \
+	-DFEATURE_wayland_client=ON
+
+ifeq ($(BR2_PACKAGE_QT6WAYLAND_COMPOSITOR),y)
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=ON
+else
+QT6WAYLAND_CONF_OPTS += -DFEATURE_wayland_server=OFF
+endif
+
+HOST_QT6WAYLAND_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WAYLAND_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	host-qt6wayland \
+	wayland \
+	host-wayland
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
