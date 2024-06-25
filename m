Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF95C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BDA740A84;
	Tue, 25 Jun 2024 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5q4BcAPsNXi; Tue, 25 Jun 2024 21:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04FE4416D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04FE4416D2;
	Tue, 25 Jun 2024 21:19:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34A851BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DBB540592
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQ66WsZ5l0AI for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C4C640103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4C640103
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4C640103
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:03 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so72969561fa.1
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350341; x=1719955141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRKFeZNUQxJMIK2IprSQrVpQvktuukoNTSY+7LHi3V4=;
 b=BmKV/JY0BEjSh5xaU1UTmXujDzqEhYLMrrSSqFvGQljvUN90bWLDscAuQfKaV3NoPA
 ToHu4KuNeGHN3WFnwg991lwq3jMPzIm7hm9SSN3EOYqvTrMZvsrHhtTCDdrKKf9RZUEw
 U+jbh99Bh6mzOsP2KuclO2NiPDK3Dx4yJicNbh3sPkj8Dy9+cHqK1IDF7Sicg9Si2AT7
 n0wE87ejur0SqDUaTs0vvL7xRZDfUJizC0HIHpIy9PO8Pt4V4eCiulPXlETIDdWWJu94
 zq3xxccGlsPtYSr/B8nFzQI5VZaNi+ehaHf5CNUGhyHFSIWhThpYll5VGVEG+ZU5eyhi
 npAQ==
X-Gm-Message-State: AOJu0Yyde1dflfx3cU9ogIUwt02UacOXMlWTlxP4dPgaWxZQDu55hvA8
 B0Uld+HKEhnaY/uJ9zir8dkaOzbWBdA/u97HyVCm6SbnXPRwLH5O1+6aqQ==
X-Google-Smtp-Source: AGHT+IEG5NevtOSAktHtvcjpukFvNVgcY3NI/qYcQpQrTco3BScZfFtg2zuHbATxaAdIch8s84CQhw==
X-Received: by 2002:a2e:3218:0:b0:2ec:55f3:40d with SMTP id
 38308e7fff4ca-2ec5b346102mr50109741fa.30.1719350341129; 
 Tue, 25 Jun 2024 14:19:01 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:00 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:25 +0200
Message-ID: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350341; x=1719955141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRKFeZNUQxJMIK2IprSQrVpQvktuukoNTSY+7LHi3V4=;
 b=mntDz4IXHSRUjqur2m1K9XpZGqnre/T+cJDkGOzmhE35Ukj+U3+BZ+z4uYzOkiBBDx
 2RWFfse8H78+G4flJAKMrI8L5KPBZcWvJCj4gGhj4td+JwleA9JCMPVbpnBWeWeuo13g
 pH7LhwaxwQQtPwsYtdyDz8CAQfpb6LV92K9IELVh9Ce+bvn/vTgo+dyInEuVeOfN225A
 paaAgUmbyO+XqVsFrri9vWg+ffAJIu6pdGwFaWP8c6cm2j8kDsC6yZtvrIMcZrYmP46b
 0oTp56qxXGmYUmz3wGlP1QcXQokqfhMK6PI9lEm9ZFBhhNZXc438ODeh5yv9gAe9AWnn
 EcIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mntDz4IX
Subject: [Buildroot] [PATCH v9 01/14] package/qt6: bump version to 6.7.2
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

For details see [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] and [11].

[1] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.0/release-note.md
[2] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.1/release-note.md
[3] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.2/release-note.md
[4] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.5.3/release-note.md

[5] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.0/release-note.md
[6] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.1/release-note.md
[7] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.2/release-note.md
[8] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.6.3/release-note.md

[9] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.0/release-note.md
[10] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.1/release-note.md
[11] https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.7.2/release-note.md

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v8 -> v9:
  - add release note link for 6.7.2 to commit message
  - bump version from 6.7.1 to 6.7.2
  - update hashes for existing qt6 packages

 package/qt6/qt6.mk                             | 4 ++--
 package/qt6/qt6base/qt6base.hash               | 4 ++--
 package/qt6/qt6base/qt6base.mk                 | 1 -
 package/qt6/qt6core5compat/qt6core5compat.hash | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash     | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash   | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                 | 4 ++--
 7 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 1edb252c96..372a92f413 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.4
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.7
+QT6_VERSION = $(QT6_VERSION_MAJOR).2
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index cb111bd405..b1b81b4992 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtbase-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5087c9e5b0165e7bc3c1a4ab176b35d0cd8f52636aea903fa377bdba00891a60  qtbase-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtbase-everywhere-src-6.7.2.tar.xz.sha256
+sha256  c5f22a5e10fb162895ded7de0963328e7307611c688487b5d152c9ee64767599  qtbase-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 211808d2af..13999bbd44 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -9,7 +9,6 @@ QT6BASE_SITE = $(QT6_SITE)
 QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
 QT6BASE_CPE_ID_VENDOR = qt
 QT6BASE_CPE_ID_PRODUCT = qt
-
 QT6BASE_CMAKE_BACKEND = ninja
 
 QT6BASE_LICENSE = \
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 0735df3af2..36421b53ca 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  d4b249abb823d575eee9045c24d924ba8d1276e6be7735b287689991d998aa7a  qt5compat-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qt5compat-everywhere-src-6.7.2.tar.xz.sha256
+sha256  8826b5189efc4d9bdb64fdb1aa89d0fdf4e53c60948ed7995621ed046e38c003  qt5compat-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 98c8931962..1b854284a3 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialbus-everywhere-src-6.4.3.tar.xz.sha256
-sha256  b6446a7516d1f04e561c00f9c50ce4d39dad72150f067722ba759f00b4b34366  qtserialbus-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtserialbus-everywhere-src-6.7.2.tar.xz.sha256
+sha256  67641ca99b455746d7d956c516dfaa5f2c48696834c71d5720d63e736d374b2b  qtserialbus-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 9341978d86..c8708c2231 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtserialport-everywhere-src-6.4.3.tar.xz.sha256
-sha256  5f97ad9067efa39a8a2a39fbbc1e03d2191f305733d9c2f3060f8017ecfc95de  qtserialport-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtserialport-everywhere-src-6.7.2.tar.xz.sha256
+sha256  21c34cd1161cb5197bcec662d26a17647b59b6fdff5c364576883c42dbd3b4fc  qtserialport-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index bb239cb012..7adfd7f2fb 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
-sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.2/submodules/qtsvg-everywhere-src-6.7.2.tar.xz.sha256
+sha256  fb0d1286a35be3583fee34aeb5843c94719e07193bdf1d4d8b0dc14009caef01  qtsvg-everywhere-src-6.7.2.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
