Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDFFC001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 374AF4060C;
	Tue,  8 Aug 2023 17:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374AF4060C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMjY2TOliv4v; Tue,  8 Aug 2023 17:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48CAF4057F;
	Tue,  8 Aug 2023 17:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48CAF4057F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A051BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D49264057F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D49264057F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3B0Uhrgl32Hx for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:22:36 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5F024044A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5F024044A
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52328e96869so5116206a12.1
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 10:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691515354; x=1692120154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2e3Plq/XecbGF1DbXNQ4I3ail+MSqFSV+k3S5VSKrls=;
 b=h/edPnWs3CwN1OCbtNn83UgnJBzO8i2nnvFq0QVHN8e1Oq7eWFvt7VNIwswxrkX4A1
 WEceK6clMfO7IBM2SQde9M+tf0CG+qw9Sr0uEDJswPhoYahAME1rdKlqy2pJ/y1euOG/
 M/5LMky96BqOkeelKMx/wccpgoAhzBxWjuVR2PgLbrCgV5syg6ujzPex0SAIoEDInWug
 sdsJUhbNI4jpPq7tPrW4rSsN1jBrqc9OPVw6Krry3/bsWxCOLzixACDrZUbLzK+I05hv
 TGf/A0afMRvGWsgXrKehsd2fPTbP44J7pur0GfJyM3Xc877Kt8tLAHVS6j84awEy4/Q2
 vzqQ==
X-Gm-Message-State: AOJu0Yw+YrIGxPeoAQ92cdIERPKbqTfXYD5X8Ybfjsx+myhc0Y20JghY
 CMJlZq3DB0OoX8pyRyTOBwDfKUWwEQZwHw==
X-Google-Smtp-Source: AGHT+IHwNMdY4i7fvOnASuLowyUTltNR9hzr+zoY/Xif5YOoN2+VCrgPUzBl7p9UHnnLeiLOfjwNVw==
X-Received: by 2002:a50:ef10:0:b0:522:1e2f:fa36 with SMTP id
 m16-20020a50ef10000000b005221e2ffa36mr344746eds.28.1691515354194; 
 Tue, 08 Aug 2023 10:22:34 -0700 (PDT)
Received: from KJKCLT3928.esterline.net
 (192.234-180-91.adsl-dyn.isp.belgacom.be. [91.180.234.192])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056402134500b005233647bc4csm3682032edw.59.2023.08.08.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 10:22:33 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
X-Google-Original-From: Jesse Van Gavere <jesse.vangavere@scioteq.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 19:22:31 +0200
Message-Id: <20230808172231.1114696-1-jesse.vangavere@scioteq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691515354; x=1692120154;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2e3Plq/XecbGF1DbXNQ4I3ail+MSqFSV+k3S5VSKrls=;
 b=Kn490Ov9DMhWGmLsKV0kXYui7GP9P3E7/gdqvc7Q0nEG3Iy44dlWbMTrsREoo0Ro2Q
 1ME4SQxo5+HZKrBIaiiD96ml+gBp/K+kaXj56XABSNq6TjuXbGOZKAjbv0Rh+DwtKf+G
 Sz3YuOco83qdmMNudPTL6xC6vhlLu2miaD2mGRS8Z8k+mPNJftBeDWDis9OpgpYMmFw3
 jJ4LkvgYnlkrr7p4JBlKDnl9WuT+4btaBKbWjQ4T2BTpRnwrlV2wkGTbjpYaszzn/tYX
 gDbLU1EUUxk7mnQaIRDTEN2Rc3uBzumZbN7y17/qbKqwiJQQ2BhYv4KTpCMglOUBno0t
 InlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Kn490Ov9
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6shadertools: new package
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Jesse Van Gavere <jesse.vangavere@scioteq.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jesse Van Gavere <jesse.vangavere@scioteq.com>
---
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6shadertools/Config.in          | 11 +++++
 .../qt6/qt6shadertools/qt6shadertools.hash    | 13 +++++
 package/qt6/qt6shadertools/qt6shadertools.mk  | 47 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/qt6/qt6shadertools/Config.in
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.hash
 create mode 100644 package/qt6/qt6shadertools/qt6shadertools.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 3788caa6a3..335b0f4f39 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -46,6 +46,7 @@ if BR2_PACKAGE_QT6
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/qt6shadertools/Config.in b/package/qt6/qt6shadertools/Config.in
new file mode 100644
index 0000000000..7b081fa330
--- /dev/null
+++ b/package/qt6/qt6shadertools/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SHADERTOOLS
+	bool "qt6shadertools"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt Shader Tools module builds on the SPIR-V Open
+	  Source Ecosystem as described at the Khronos SPIR-V web
+	  site.
+
+	  https://doc.qt.io/qt-6/qtshadertools-index.html
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
new file mode 100644
index 0000000000..803a083518
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -0,0 +1,13 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtshadertools-everywhere-src-6.4.3.tar.xz.sha256
+sha256  c648b74ce3e769a20bd62792a589c540bceacfedf2f38fc7273d2c39782768f8  qtshadertools-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  c7d81f456bf5488fec8b2d249eec6b02e70bbdc353c373cd5a077e898345e943  src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3rdparty/SPIRV-Cross/LICENSE
+sha256  5b1050253c0b933016f0538bce3354bb062e42b4d59d1082c0d0f9eca9b439c7  src/3rdparty/glslang/LICENSE.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.mk b/package/qt6/qt6shadertools/qt6shadertools.mk
new file mode 100644
index 0000000000..c088359546
--- /dev/null
+++ b/package/qt6/qt6shadertools/qt6shadertools.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# qt6shadertools
+#
+################################################################################
+
+QT6SHADERTOOLS_VERSION = $(QT6_VERSION)
+QT6SHADERTOOLS_SITE = $(QT6_SITE)
+QT6SHADERTOOLS_SOURCE = qtshadertools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SHADERTOOLS_VERSION).tar.xz
+QT6SHADERTOOLS_INSTALL_STAGING = YES
+QT6SHADERTOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SHADERTOOLS_CMAKE_BACKEND = ninja
+
+QT6SHADERTOOLS_LICENSE = \
+	GPL-3.0-only WITH Qt-GPL-exception-1.0, \
+	GPL-2.0-only or LGPL-3.0-only, \
+	GFDL-1.3-no-invariants-only, \
+	Apache-2.0 or MIT, \
+	BSD-3-Clause, \
+	BSD-2-Clause, \
+	Apache-2.0, \
+	GPL-3.0-or-later WITH Bison-Exception-2.2
+
+QT6SHADERTOOLS_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/3rdparty/SPIRV-Cross/KHRONOS-LICENSE.txt \
+	src/3rdparty/SPIRV-Cross/LICENSE \
+	src/3rdparty/glslang/LICENSE.txt
+
+QT6SHADERTOOLS_CONF_OPTS = \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SHADERTOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	qt6base \
+	host-qt6shadertools
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
