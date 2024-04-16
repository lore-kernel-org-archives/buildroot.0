Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803DDC4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 14:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4321F40784;
	Tue, 16 Apr 2024 14:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1huFgakCnhCE; Tue, 16 Apr 2024 14:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E185407FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E185407FB;
	Tue, 16 Apr 2024 14:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BB9EE1BF27C
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A987260A89
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 14:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9MBiA7R93q3 for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 14:27:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75A6A60A79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75A6A60A79
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75A6A60A79
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 14:27:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-516d1c8dc79so5610541e87.1
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 07:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713277667; x=1713882467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6e+mUpovFhxtJrdt+VDqbfKsiusLT/LZ92fH5CpilZU=;
 b=UtKckMs7jhHxPw6GYyTCijHsnip+pst+VvSVxsh3gbSSBM1jAFGWBNYDEpVNPlhaEJ
 ivyTTJBKiiP1DxEyyBd1TGMOm8fQBeAxfkdh7pLjvQNt3FS+EqnyYVTO1w+LnFCMhflt
 uk7dvzXE+DjxABDz/f8cNUxeRKcKk/ymjVba2cJhP6a3z7qj+hNeY0EA9Wz+UUsIwK/a
 ZGwKUJ2lTqclxu+5nQqkcAYdHXoSIIvp9rtapi8uCTMRLWMbe3zv1rqjLFXC4mjX5rp5
 OMvnS3XfKLfmpzcFLgr5yyFbRVudsvrflRVnn7pHtn46IbQ8KmwQoK3oqhMrz2HPFF0y
 4+Ew==
X-Gm-Message-State: AOJu0Yy8hH93RivhuF16sDan6fJbPEC+FRQoEpyF/jyMVqaKItll6hnm
 ZyRhU9jSbM3jrkRh03fBpwDlFxwyF+od6BLBh53fz/+7rHQRc9/JKEn7MCmH
X-Google-Smtp-Source: AGHT+IFuZR7XT8z2ZuRFkgc90/cMR8tEeZ3YrMcOiQngW/q18b8qir9/vGoaP7UGw2s9rELRo3oYDw==
X-Received: by 2002:ac2:5e88:0:b0:515:c964:723f with SMTP id
 b8-20020ac25e88000000b00515c964723fmr8289549lfq.20.1713277663827; 
 Tue, 16 Apr 2024 07:27:43 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.12])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a196453000000b00516b0051e6esm1629403lfj.231.2024.04.16.07.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 07:27:43 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Google-Original-From: Roy Kollen Svendsen
 <roy.kollen.svendsen@akersolutions.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 16:26:05 +0200
Message-ID: <20240416142620.1751773-11-roy.kollen.svendsen@akersolutions.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
References: <20240416142620.1751773-1-roy.kollen.svendsen@akersolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713277667; x=1713882467; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6e+mUpovFhxtJrdt+VDqbfKsiusLT/LZ92fH5CpilZU=;
 b=HHr3a1H+fNQ/tCKsym4x83HM826Hd/QtdyV974W0+4+AbN/UMO4gYc5wcWY04SadCa
 1IBxJzWHqDCVmVbkkS8EWeg0AuTt7S9mPV8IicQPfa9rX8MEnviAzbiSMODQpIVafZnf
 ayiF1Lt9w9Dfbezpm5+k8zEn7DVpWkHHNeXK46Z18zFKB+GoBpaQzwwhM5vZ95T0HmNR
 PtA6eDrqh64393yRv73vQirCK0u+XJnGcPqunglC4MFAREM8cNbKvYj0H4e1HKbYvWJQ
 BNknbz8lJlFpeTe+L9PUFvSnH1iZtnVkYBNF18naXfk+h/Q97iIyGc3itcgefM/CIsJq
 ZcEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HHr3a1H+
Subject: [Buildroot] [PATCH 11/11] package/qt6/qt6mqtt: new package
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
 package/qt6/Config.in            |  1 +
 package/qt6/qt6.mk               |  2 ++
 package/qt6/qt6mqtt/Config.in    |  9 ++++++++
 package/qt6/qt6mqtt/qt6mqtt.hash |  8 ++++++++
 package/qt6/qt6mqtt/qt6mqtt.mk   | 35 ++++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/qt6/qt6mqtt/Config.in
 create mode 100644 package/qt6/qt6mqtt/qt6mqtt.hash
 create mode 100644 package/qt6/qt6mqtt/qt6mqtt.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 9dbc4b804a..e84806d5e4 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -47,6 +47,7 @@ source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6languageserver/Config.in"
+source "package/qt6/qt6mqtt/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index b87cb6748d..42984f89ee 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -9,4 +9,6 @@ QT6_VERSION = $(QT6_VERSION_MAJOR).0
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
+QT6_GIT = git://code.qt.io
+
 include $(sort $(wildcard package/qt6/*/*.mk))
diff --git a/package/qt6/qt6mqtt/Config.in b/package/qt6/qt6mqtt/Config.in
new file mode 100644
index 0000000000..b9b8269773
--- /dev/null
+++ b/package/qt6/qt6mqtt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_QT6MQTT
+	bool "qt6mqtt"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6mqtt module.
+
+	  https://doc.qt.io/qt-6/qtmqtt-index.html
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
new file mode 100644
index 0000000000..4d2f18884f
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -0,0 +1,8 @@
+sha256  c07243179e09874720361ae4f5a3e7f90244363eb98f177b9413c9f13b159e63  qt6mqtt-6.7.0-br1.tar.gz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
new file mode 100644
index 0000000000..0405311065
--- /dev/null
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# qt6mqtt
+#
+################################################################################
+
+QT6MQTT_VERSION = $(QT6_VERSION)
+QT6MQTT_SITE = $(QT6_GIT)/qt/qtmqtt.git
+
+QT6MQTT_INSTALL_STAGING = YES
+
+QT6MQTT_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6MQTT_CMAKE_BACKEND = ninja
+
+QT6MQTT_LICENSE = \
+	BSD-3-Clause, GPL-3.0-only, \
+	GFDL-1.3-invariants-only (docs)
+
+QT6MQTT_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6MQTT_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6MQTT_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
