Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CE6C25B77
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 20:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCF7B820A7;
	Sun, 12 May 2024 20:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CL-zcDvaKCE; Sun, 12 May 2024 20:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3A9820F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3A9820F1;
	Sun, 12 May 2024 20:19:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C80931BF3E0
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B27EF402F7
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 20:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErqZELOtjs7Q for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 20:19:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8556A400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8556A400D8
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8556A400D8
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:19:22 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e3e18c24c1so36293101fa.1
 for <buildroot@buildroot.org>; Sun, 12 May 2024 13:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715545160; x=1716149960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuHyG9TQy+ISXS++YtIRoivCLJAxD4fiovsBX61jgaE=;
 b=YksSUD6MjXBWitSg1MXSkgJdRbHsuUIS0tqBM7uzSZJZcxrAhBUiytEtH7o9h3Hbpy
 qCdWmmUAcX2PHBsIhmwmb92oKzWIgCDj89nc7m8QulT3TCrKRJdMe0EIdeIw7oFy4kql
 xf4v2Sekyrgh+rHuUVsLuXxsujY7EmtEjKS8n48i7gUHunQZp0HKaEzuj7+41tQx/E3X
 4fYuUYciJd5DwUpK0acI+CSrZ8PksHEbQC65VO31K7HO3zpumI3xOtJAnnwRHQkpozfM
 q5vqRSXtKmwzfBZxBwOHo2dgAlzRXFHg//uB0jLxc4yrICNrIU1dv4U0/RzsVSzrS/oF
 6uwA==
X-Gm-Message-State: AOJu0YzRRBESoFGsCnDZi9ov087IDhSdoyDopRwfE34WlatvslEjeOoq
 rz8pkYJTDVvLYfxhhJuIpwFNmRr6CCfgLFXsm4iTO4xP7o+4h8uq8iab82dC
X-Google-Smtp-Source: AGHT+IHA2Nt+ZabdrpS4ThuphFyPKVIWj4K0einH8m0UWACfS/9LKBrEKyoGtqSWviNUQOJ4zKBDcw==
X-Received: by 2002:a05:651c:19ac:b0:2e0:752c:1f2e with SMTP id
 38308e7fff4ca-2e51fd2decemr53643451fa.1.1715545160415; 
 Sun, 12 May 2024 13:19:20 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1515580sm11400791fa.79.2024.05.12.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 May 2024 13:19:19 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 13:45:56 +0200
Message-ID: <20240512114617.2564569-9-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240512114617.2564569-1-roykollensvendsen@gmail.com>
References: <1924535>
 <20240512114617.2564569-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715545160; x=1716149960; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fuHyG9TQy+ISXS++YtIRoivCLJAxD4fiovsBX61jgaE=;
 b=BwupiHlcYxtmks95BzZykPr/Gn+hrGtH6fZmeW8xjUmA664PuNVaMf+SLeeR2brGuJ
 PISZ9NTOuLPjgkqTHk2XkeZUV49+vOfdJh0e3Hc/ilkMm0rDfRtmU3+2VOSJZSiNPxoV
 BHy50IsnfyytI3pksFH6JrxtEEW9YpUVT9FoeXXxXzWj92k1a2isZU45yWN3YejmLGKf
 UoS+oQCNxHOyST3IgfJiHWJoRJCs0hugmH8L8avTj0+/LabZq7tkZxEwhuCJ3bpewGTr
 TikqUJIlDru67ILQ3NtS0pJgtqtkMB6AlyEWsEvtcMxLzqg+FRQjd07cclCqBdNhNoiK
 g7Kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BwupiHlc
Subject: [Buildroot] [PATCH v3 09/14] package/qt6/qt6websockets: new package
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
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/Config.in                        |  1 +
 package/qt6/qt6websockets/Config.in          |  9 ++++
 package/qt6/qt6websockets/qt6websockets.hash | 11 +++++
 package/qt6/qt6websockets/qt6websockets.mk   | 46 ++++++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 package/qt6/qt6websockets/Config.in
 create mode 100644 package/qt6/qt6websockets/qt6websockets.hash
 create mode 100644 package/qt6/qt6websockets/qt6websockets.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 625134d281..16f792cff3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -51,5 +51,6 @@ source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
+source "package/qt6/qt6websockets/Config.in"
 
 endif
diff --git a/package/qt6/qt6websockets/Config.in b/package/qt6/qt6websockets/Config.in
new file mode 100644
index 0000000000..a201483922
--- /dev/null
+++ b/package/qt6/qt6websockets/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6WEBSOCKETS
+	bool "qt6websockets"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6websockets module.
+
+	  https://doc.qt.io/qt-6/qtwebsockets-index.html
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
new file mode 100644
index 0000000000..4e36eb4257
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -0,0 +1,11 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.0/submodules/qtwebsockets-everywhere-src-6.7.0.tar.xz.sha256
+sha256  5ffc77da6b36cdf18e04c975a0fbf243968806a93a6291bcd2e9cd0b26139736  qtwebsockets-everywhere-src-6.7.0.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.mk b/package/qt6/qt6websockets/qt6websockets.mk
new file mode 100644
index 0000000000..cc17085d10
--- /dev/null
+++ b/package/qt6/qt6websockets/qt6websockets.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# qt6websockets
+#
+################################################################################
+
+QT6WEBSOCKETS_VERSION = $(QT6_VERSION)
+QT6WEBSOCKETS_SITE = $(QT6_SITE)
+QT6WEBSOCKETS_SOURCE = qtwebsockets-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WEBSOCKETS_VERSION).tar.xz
+QT6WEBSOCKETS_INSTALL_STAGING = YES
+
+QT6WEBSOCKETS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6WEBSOCKETS_CMAKE_BACKEND = ninja
+
+QT6WEBSOCKETS_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0, GFDL-1.3 no invariants (docs)
+
+QT6WEBSOCKETS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt
+
+QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+HOST_QT6WEBSOCKETS_CONF_OPTS = \
+	-DQT_FEATURE_thread=ON \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6WEBSOCKETS_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	host-qt6declarative
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
