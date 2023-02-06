Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2A1C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 13:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA0A9605A4;
	Mon,  6 Feb 2023 13:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA0A9605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejaHafrk6WTt; Mon,  6 Feb 2023 13:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEFD6605B1;
	Mon,  6 Feb 2023 13:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEFD6605B1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 095C31BF2A7
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E52DF403B8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 13:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E52DF403B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmWimsnXBVZn for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 13:38:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9BB440360
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9BB440360
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 13:38:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso10812187wms.0
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 05:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HUHa+lIlcTHdX3gAZ3BxSpOY4heE9NWt1ymBjZh9bWE=;
 b=TFamW/T1GQgkMMUDbu4nvvOIZ7we5DiMxLmI2EmB/Bu/pYUouDe6lbwtk7K4kI8gL6
 AOTOKpYDZrIXnYNl0gMC1C5IJkjVRLDLR5lIYUO0a5DLqWNIWElIM69r3KTXnFuEa6O4
 fVnlbUg8wCAyyERDJI5FdRKN4xghCxsBVSFDji82A9zdRKhIIjVuSqYKtg5fUfX18WFw
 FG0X/GMiXzq57WoslV41A4mnR3k2wg4vCdAvfNdR8gfA/86lfVKL9b+2Y+oVnY5vvrQr
 ATb5gBEBOGwbXCXbE+jBdkP5F6LmGyq8CC6B4Rt22V+lnF+l+uXCG/IQcpByefO1jBw9
 +XUA==
X-Gm-Message-State: AO0yUKX4UwvfCUs1T1xBjQStHX9jGvDfa3pNE9Lup+VZcCgJHzZQMn4r
 aM0d/WBBEuMunsVp5NiSCmMkwk9Zf5UKuSyshR3tgw==
X-Google-Smtp-Source: AK7set8GISP0IfBbFyaVC9oGMJPN60wmDRWEPecjAXgD6ax//DwOKkpxhEVP1/UtmXGwczoW/z3ABw==
X-Received: by 2002:a05:600c:3d90:b0:3df:eedf:f378 with SMTP id
 bi16-20020a05600c3d9000b003dfeedff378mr9121809wmb.24.1675690719445; 
 Mon, 06 Feb 2023 05:38:39 -0800 (PST)
Received: from localhost.localdomain (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c434300b003dc59081603sm10527274wme.48.2023.02.06.05.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 05:38:38 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 14:38:36 +0100
Message-Id: <20230206133836.412572-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HUHa+lIlcTHdX3gAZ3BxSpOY4heE9NWt1ymBjZh9bWE=;
 b=dNT6Xeinh74508eoOSMjv0JKdUMjIuC7QmlyeUt5DMnBf63LRJBS7IarWcUhgcK24o
 SWoGrTKTFzk8Jw2ffshgP0F+DG1wx8kv+N7QRhqmMTAHDymnx97w8roMhPsDJ8DQakyp
 KlyBf+jehi3u5T5w0bGAf+67IDymq9ZBAFbwA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dNT6Xein
Subject: [Buildroot] [PATCH v3] package/qt6/qt6serialbus: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, thomas.petazzoni@bootlin.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>                                                                              
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>                                                                   
---                                                                                                                               
v2:                                                                                                                           
* LICENSE/LICENSE_FILES: one per line                                                                                             
* Selecting BR2_PACKAGE_QT6BASE_NETWORK to make the package compile,
  fixes: "Failed to find required Qt component "Network".
v3:
* Bumped to version 6.4.2

---
 package/qt6/Config.in                      |  1 +
 package/qt6/qt6serialbus/Config.in         | 15 ++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash | 11 ++++++
 package/qt6/qt6serialbus/qt6serialbus.mk   | 45 ++++++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6serialbus/Config.in
 create mode 100644 package/qt6/qt6serialbus/qt6serialbus.hash
 create mode 100644 package/qt6/qt6serialbus/qt6serialbus.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4b2b9a1174..b0cc008df5 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -39,6 +39,7 @@ menuconfig BR2_PACKAGE_QT6
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
+source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 
 endif
diff --git a/package/qt6/qt6serialbus/Config.in b/package/qt6/qt6serialbus/Config.in
new file mode 100644
index 0000000000..1f24310e61
--- /dev/null
+++ b/package/qt6/qt6serialbus/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_QT6SERIALBUS
+	bool "qt6serialbus"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6 # CAN FD
+	select BR2_PACKAGE_QT6SERIALPORT
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6serialbus module.
+
+	  https://doc.qt.io/qt-6/qtserialbus-index.html
+
+comment "qt6serialbus needs headers >= 3.6"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_6
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
new file mode 100644
index 0000000000..be01f13363
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.2/submodules/qtserialbus-everywhere-src-6.4.2.tar.xz.sha256
+sha256  604013657c7327899aa50748deb4bcb5e545ab37ff4964795b9e6f617d48bf1b  qtserialbus-everywhere-src-6.4.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.mk b/package/qt6/qt6serialbus/qt6serialbus.mk
new file mode 100644
index 0000000000..fe69119a58
--- /dev/null
+++ b/package/qt6/qt6serialbus/qt6serialbus.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# qt6serialbus
+#
+################################################################################
+
+QT6SERIALBUS_VERSION = $(QT6_VERSION)
+QT6SERIALBUS_SITE = $(QT6_SITE)
+QT6SERIALBUS_SOURCE = qtserialbus-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALBUS_VERSION).tar.xz
+QT6SERIALBUS_INSTALL_STAGING = YES
+QT6SERIALBUS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SERIALBUS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6SERIALBUS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6SERIALBUS_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SERIALBUS_DEPENDENCIES = \
+	qt6serialport
+
+define QT6SERIALBUS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALBUS_BUILDDIR)
+endef
+
+define QT6SERIALBUS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR) --prefix $(STAGING_DIR)/usr
+endef
+
+define QT6SERIALBUS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --install $(QT6SERIALBUS_BUILDDIR) --prefix $(TARGET_DIR)/usr
+endef
+
+$(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
