Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C89BC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 19:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F66341B0E;
	Mon, 18 Dec 2023 19:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F66341B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id za9IAMoLQcRl; Mon, 18 Dec 2023 19:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17A4D4181E;
	Mon, 18 Dec 2023 19:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17A4D4181E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 151DB1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDD8640648
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 19:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD8640648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8LSBNHQtd9K for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A26840463
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 19:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A26840463
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d3ae590903so10943405ad.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 11:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702928410; x=1703533210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fz/V0Z7qfcVpyUr3PAgVschtN2oXssQfwicqow35eqA=;
 b=s9CNCUZxQPpNG7+5gtGy7uFg9qI0YXQ5k/K71CwgyXKsqCf57oWw9xQvGpEy4vVDC1
 jiIGDx2ryAX9pxieYFne5c+3yJbkZsLTGa9lvbTxdG1Hg5XF+c2vTaNtauBFTl0NrdVf
 N+xnbYK51iRr2WjWYpAUEq7o/PaEYkQWlfRQi9B7oMeE/O6599qH+iujYK1SZrhWecDT
 tYqrNnXyz1cWqIQ96X84GOLPBkRIqF8TYBR1NmNrUqohxXbs59Y9BYCaQfyphIymtRIs
 63HfhTHbU7/T3aO6DAK/g23LjWQi/qJEiz4tOAXhbs00ROftAaDHQhDz8VavqhPVryqC
 AzXw==
X-Gm-Message-State: AOJu0YxDWNjyZlB64/dr9F+VeBK2q6ZP1y1Japygpu/BkKQqb8JUvBxJ
 D3ZlW1Wq++5hy6si8BvH2fNZcMoia3mGYQSjBPk=
X-Google-Smtp-Source: AGHT+IFo49lNpGBpR9ZNtFLY5jScmLCgn0OgXCiUx7Me6MiTufLFoX3fVzyJT1ORsCESmTP3U8uqvA==
X-Received: by 2002:a17:903:22c7:b0:1cf:e9b5:90ee with SMTP id
 y7-20020a17090322c700b001cfe9b590eemr23123155plg.24.1702928410461; 
 Mon, 18 Dec 2023 11:40:10 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b001cfbd3f38dcsm2983808plb.225.2023.12.18.11.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 11:40:10 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 12:39:50 -0700
Message-ID: <20231218194001.544887-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
References: <20231218194001.544887-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702928410; x=1703533210;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fz/V0Z7qfcVpyUr3PAgVschtN2oXssQfwicqow35eqA=;
 b=OvRXlX3jmGQUoQiHwIrzepFYeBuGrkVvfrBMvyjgLq9NuvJYGbDvdcmfLP6lVQibnl
 5QQ4k6T8KKJytr6Ri0DtABGE660YJEeu2+nZGsZITrh9cNoa6KADVXfuudF0gL+7sNPm
 HwkLYRDy4qs/6Wt5cprRTfq+QCBf4DD0nnis4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=OvRXlX3j
Subject: [Buildroot] [PATCH v2 05/14] package/fcft: new package
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Fix the sha256sum of 3.1.6.tar.gz

 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fcft/Config.in | 52 ++++++++++++++++++++++++++++++++++++++++++
 package/fcft/fcft.hash |  3 +++
 package/fcft/fcft.mk   | 44 +++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 package/fcft/Config.in
 create mode 100644 package/fcft/fcft.hash
 create mode 100644 package/fcft/fcft.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b429847c7..5d710bbb46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -34,6 +34,7 @@ F:	package/vulkan-tools/
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
+F:	package/fcft/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index 728692bc32..36e29d4fa2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2224,6 +2224,7 @@ menu "Text and terminal handling"
 	source "package/cli11/Config.in"
 	source "package/docopt-cpp/Config.in"
 	source "package/enchant/Config.in"
+	source "package/fcft/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
diff --git a/package/fcft/Config.in b/package/fcft/Config.in
new file mode 100644
index 0000000000..b65515a3f1
--- /dev/null
+++ b/package/fcft/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_FCFT
+	bool "fcft"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_TLLIST
+	help
+	  A simple library for font loading and glyph rasterization
+	  using FontConfig, FreeType and pixman.
+
+	  https://codeberg.org/dnkl/fcft
+
+if BR2_PACKAGE_FCFT
+
+config BR2_PACKAGE_FCFT_GRAPHEME_SHAPING
+	bool "grapheme-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	help
+	  Enables shaping of individual grapheme clusters
+
+comment "grapheme-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_RUN_SHAPING
+	bool "run-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_UTF8PROC
+	help
+	  Enables shaping of whole text runs.
+
+comment "run-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_SVG_SUPPORT
+	bool "svg support"
+	help
+	  Enables svg support. This option increases the size of the
+	  library by approximately 55KB.
+
+endif # BR2_PACKAGE_FCFT
+
+comment "fcft needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
new file mode 100644
index 0000000000..96d885db1d
--- /dev/null
+++ b/package/fcft/fcft.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  904f40d749d198d97c46c5a459cd3c53fe92f008cf1e3e61949f6cf3036a78b7  3.1.6.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
new file mode 100644
index 0000000000..538d8a0748
--- /dev/null
+++ b/package/fcft/fcft.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# fcft
+#
+################################################################################
+
+FCFT_VERSION = 3.1.6
+FCFT_SOURCE = $(FCFT_VERSION).tar.gz
+FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_LICENSE = MIT
+FCFT_LICENSE_FILES = LICENSE
+FCFT_INSTALL_STAGING = YES
+
+FCFT_DEPENDENCIES = \
+	fontconfig \
+	freetype \
+	pixman \
+	tllist
+
+FCFT_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dexamples=false
+
+ifeq ($(BR2_PACKAGE_FCFT_GRAPHEME_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz
+FCFT_CONF_OPTS += -Dgrapheme-shaping=enabled
+else
+FCFT_CONF_OPTS += -Dgrapheme-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_RUN_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz utf8proc
+FCFT_CONF_OPTS += -Drun-shaping=enabled
+else
+FCFT_CONF_OPTS += -Drun-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_SVG_SUPPORT),y)
+FCFT_CONF_OPTS += -Dsvg-backend='nanosvg'
+else
+FCFT_CONF_OPTS += -Dsvg-backend='none'
+endif
+
+$(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
