Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34031C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1708417D2;
	Tue, 25 Jun 2024 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNuUs2ysXfuB; Tue, 25 Jun 2024 21:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88060417E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88060417E6;
	Tue, 25 Jun 2024 21:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4B6F1BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1984402D9
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1haBmkR_fzLX for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5223B402C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5223B402C5
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5223B402C5
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:26 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ec595d0acbso38604991fa.1
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350364; x=1719955164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Iisd6xUQzSgprmp30LRCPycmhxnTc12QQC8h/KWX7k=;
 b=S39GX3n8Tg5uRPWi6h7kLt4ooigFxAEPCq56hOF5ah/KA8wuBMS5WS9G3TObrgwYqc
 CCCgzqJjQcFwqfnn7L9vPmxAa7nIBUupZ0wXzaL/JILmfx6c3mF9KINSDR2eJKfBlAZ3
 T/RXVxGNuTbzspXXQVTT8Q8EC3zZTZUduC61/kHvqvPdzPL4X0/T+WwZKXSUGHlQfnYk
 RnehE06w/iMb9YTZT7edJOzCXXYgDLSCAad7OVnIhxtDCy5XVs0e2ZG98JuQdb4O9h8l
 PebjF9vwJ45TQnNNSir7eUhLD2ycA3LCP9d1Dlfqcb1pWUQbSDuUI03Hh53hUkIIrYEh
 0xGw==
X-Gm-Message-State: AOJu0YyT5gHXIqVwXcmV9KYm3URMFUR1Fy/jJBbTbjBjR19IIsJXKwvv
 7j3BYqpLHiZKgG+ZNE9/mqkrIWkKEcrlwe7PhvGOuJ5jtrCS3nOhOXPgHA==
X-Google-Smtp-Source: AGHT+IFhHBJ5HmMwJgGbMoXUXD5SUMRHMEruZMi59DtwwYzJIZCU7zVMgy1JQ7kSDz6dJMiqAkCCLQ==
X-Received: by 2002:a05:651c:312:b0:2ec:6c65:cdef with SMTP id
 38308e7fff4ca-2ec6c65ceecmr20393761fa.44.1719350364034; 
 Tue, 25 Jun 2024 14:19:24 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:23 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:37 +0200
Message-ID: <20240625211847.1419944-13-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350364; x=1719955164; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Iisd6xUQzSgprmp30LRCPycmhxnTc12QQC8h/KWX7k=;
 b=Pt9KrRagwSGiAyPeQaM+SuSllPSfIdYprlgb3ikBICzRUToC7rZBEPdrKvQbxzNcho
 AbmXIYGjjHQ1f2BB6q04xF8P1vz3fmj0EIEkrdlsmfTXNb9dgcE0mmqNroKnBOXVq50i
 tvm/6kuWkMLWrqr/5D+YpDeVdVaRalepi6RjmaVNhdLUvorfVamiBccfff4eKXlZzQ5M
 gYWMsAfoSRmPP0nxCtHy0hwA1ic3Ch6VuYFJGjhLyZcaiX+w9+sgmtZ1KKn6cACLi1WS
 Xdutet5t5B+aflGXGmFITVD50Y8sV+/Ljw9p/sYNDpiqPEACGvA7lMvBmHfmqv0J7uGy
 6iag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Pt9KrRag
Subject: [Buildroot] [PATCH v9 13/14] package/qt6/qt6virtualkeyboard: new
 package
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v8 -> v9:
  - bump version from 6.7.1 to 6.7.2
  - update hash

 package/qt6/Config.in                         |  1 +
 package/qt6/qt6virtualkeyboard/Config.in      | 11 +++++
 .../qt6virtualkeyboard.hash                   | 12 ++++++
 .../qt6virtualkeyboard/qt6virtualkeyboard.mk  | 41 +++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/qt6/qt6virtualkeyboard/Config.in
 create mode 100644 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
 create mode 100644 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 48366f5fd1..9dbc4b804a 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -52,6 +52,7 @@ source "package/qt6/qt6serialport/Config.in"
 source "package/qt6/qt6shadertools/Config.in"
 source "package/qt6/qt6svg/Config.in"
 source "package/qt6/qt6tools/Config.in"
+source "package/qt6/qt6virtualkeyboard/Config.in"
 source "package/qt6/qt6wayland/Config.in"
 source "package/qt6/qt6websockets/Config.in"
 
diff --git a/package/qt6/qt6virtualkeyboard/Config.in b/package/qt6/qt6virtualkeyboard/Config.in
new file mode 100644
index 0000000000..c183e14001
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6VIRTUALKEYBOARD
+	bool "qt6virtualkeyboard"
+	select BR2_PACKAGE_QT6DECLERATIVE
+	select BR2_PACKAGE_QT6SVG
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6virtualkeyboard module.
+
+	  https://doc.qt.io/qt-6/qtvirtualkeyboard-index.html
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
new file mode 100644
index 0000000000..f34eb11e9e
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -0,0 +1,12 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtvirtualkeyboard-everywhere-src-6.7.2.tar.xz.sha256
+sha256  320664b55a0960ff79c1b822dcf6e8cebe3e08b791147d41b570996d81ce180f  qtvirtualkeyboard-everywhere-src-6.7.2.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
+sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256  9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6  src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
new file mode 100644
index 0000000000..e65e955808
--- /dev/null
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# qt6virtualkeyboard
+#
+################################################################################
+
+QT6VIRTUALKEYBOARD_VERSION = $(QT6_VERSION)
+QT6VIRTUALKEYBOARD_SITE = $(QT6_SITE)
+QT6VIRTUALKEYBOARD_SOURCE = qtvirtualkeyboard-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6VIRTUALKEYBOARD_VERSION).tar.xz
+QT6VIRTUALKEYBOARD_INSTALL_STAGING = YES
+
+QT6VIRTUALKEYBOARD_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6VIRTUALKEYBOARD_CMAKE_BACKEND = ninja
+
+QT6VIRTUALKEYBOARD_LICENSE = \
+	GPL-3.0-only, GFDL-1.3 no invariants (docs), \
+	BSD-3-Clause
+
+QT6VIRTUALKEYBOARD_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt \
+	src/plugins/openwnn/3rdparty/openwnn/NOTICE \
+	src/plugins/pinyin/3rdparty/pinyin/NOTICE \
+	src/plugins/tcime/3rdparty/tcime/COPYING
+
+QT6VIRTUALKEYBOARD_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6VIRTUALKEYBOARD_DEPENDENCIES = \
+	qt6base \
+	qt6declarative \
+	qt6svg
+
+$(eval $(cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
