Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA00FC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 15:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 638C74091C;
	Tue, 23 Jan 2024 15:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 638C74091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gy21IhzbNj0V; Tue, 23 Jan 2024 15:58:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 697A04090E;
	Tue, 23 Jan 2024 15:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 697A04090E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12D4C1BF360
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07AF408CC
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 15:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07AF408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO4BaSCAAig8 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 15:58:37 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8395E408C6
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 15:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8395E408C6
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55a45a453eeso5701355a12.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 07:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706025515; x=1706630315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5iaDnRRRXVXwscJcEMoImQ/0f1YwhnF1SueTmkzLU5U=;
 b=a/dO9pt77Qy9LXuX76TyGkpkzoATygRTkljQuzkXU9sRLeWxdqO3rPHyKn/F2G+rtv
 Gv4ob74B/CRFdu0Pr+QGBYOwG/QR64YAJAoN4HLrbrZK4q1y260Lqjbe8n1UHjvTx0U0
 CuQ66X2mZJgwb0Wi6lBordSNPEGiUBO8ot/qaysFK1GGDXE4rrd4R355959WK3cjhHUw
 QtJpUqpeZLw3UqXzyN/zIt+mOwii7i2fxOktOrsU6rADBqbmGQhXkgunKukbC9ImRozS
 51EGp9KGmt0dh27wcZL/6mUpioOlM5lJHaQ+7MPX4m7EXugmV0Igm5E3BegwKglEZbYq
 jjIg==
X-Gm-Message-State: AOJu0Yx7Fer8Ybml8hTuSC10DM6KU/DDHjNLOXPqHcsfw0haUQNHPoqN
 IywgbnSYOFOvLef37LrrDRN9K5MzebU5aNuriVd3qSm6d4jkNCoQ
X-Google-Smtp-Source: AGHT+IGF8sj74ZfrquMy56XwgFMFlGv1T29aOAU0Ut6pASADQVInU2Vq1hEODQgyKB+tmiHCl4eZbw==
X-Received: by 2002:a05:6402:50d3:b0:55c:7e63:38b1 with SMTP id
 h19-20020a05640250d300b0055c7e6338b1mr974787edb.35.1706025515318; 
 Tue, 23 Jan 2024 07:58:35 -0800 (PST)
Received: from wslxew193.fritz.box
 (p200300c7873a53007b4b21e28831d34d.dip0.t-ipconnect.de.
 [2003:c7:873a:5300:7b4b:21e2:8831:d34d])
 by smtp.gmail.com with ESMTPSA id
 x9-20020aa7cd89000000b00558e0481b2fsm14122671edv.47.2024.01.23.07.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 07:58:34 -0800 (PST)
From: Boerge Struempfel <boerge.struempfel@gmail.com>
X-Google-Original-From: Boerge Struempfel <bstruempfel@ultratronik.de>
To: 
Date: Tue, 23 Jan 2024 16:58:24 +0100
Message-ID: <20240123155829.387063-2-bstruempfel@ultratronik.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123155829.387063-1-bstruempfel@ultratronik.de>
References: <20240123155829.387063-1-bstruempfel@ultratronik.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706025515; x=1706630315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5iaDnRRRXVXwscJcEMoImQ/0f1YwhnF1SueTmkzLU5U=;
 b=geYZXQze9hxn2TBuUGXhuxRwpaVa6Ar4qM6ml6fbeHDhk3lREs4b5G28bXsE7Ys3F7
 1v+a17AWc8L+eHLzH9TWQUAZjfqO85hfXQ9NmIQy0qr0tQUkvnGNsq8c/FOKblHnpYN2
 448ZrjmROux1J2z2xPsJXERGhRvA0pZZtx90FeUJw82teR9KblYaqqGHGgTzqewVTdVQ
 fDeihHDGXtyTtDo1+9pPMoAYWi/UNb96yc8BeTIve098NzRhNL+L/XUNGOOQxsQaElgK
 smeKAK0tUcADg0x70/HbqPrszUnCUu0p+K+VP47/Qu5+ZxeobRcpgWj60mNNpI7I9CvX
 KQ6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=geYZXQze
Subject: [Buildroot] [PATCH v4 1/2] package/libgpiod2: new package
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 buildroot@buildroot.org, boerge.struempfel@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Boerge Struempfel <boerge.struempfel@gmail.com>

Due to a significant api change as well as more recent kernel version
requirements, we introduce a separate package for version 2.0 and higher.
The newpackage is incompatible to libgpiod 1.x. This allows for iteratively
updating all dependent packages without breaking anything as a result.

For now we will have libgpiod2 depend on !libgpiod. However, in the
future, it might be preferable to have it the other way around,
such that packages, which select libgpiod2 don't have to also add the
the !libgpiod dependency.

Note that this package does not correspond to the debian libgpiod2 package,
which currently uses only version 1.6.3

Signed-off-by: Boerge Struempfel <bstruempfel@ultratronik.de>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/libgpiod2/Config.in      | 27 +++++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  4 ++++
 package/libgpiod2/libgpiod2.mk   | 41 ++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+)
 create mode 100644 package/libgpiod2/Config.in
 create mode 100644 package/libgpiod2/libgpiod2.hash
 create mode 100644 package/libgpiod2/libgpiod2.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9528837dd0..7a9d33c911 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -522,6 +522,9 @@ N:	Bilal Wasim <bilalwasim676@gmail.com>
 F:	board/chromebook/elm/
 F:	configs/chromebook_elm_defconfig
 
+N:	Boerge Struempfel <boerge.struempfel@gmail.com>
+F:	package/libgpiod2/
+
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
diff --git a/package/Config.in b/package/Config.in
index 5b8b15fa54..b1adb18877 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1748,6 +1748,7 @@ menu "Hardware handling"
 	source "package/libftdi1/Config.in"
 	source "package/libgphoto2/Config.in"
 	source "package/libgpiod/Config.in"
+	source "package/libgpiod2/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
new file mode 100644
index 0000000000..9775ed42f9
--- /dev/null
+++ b/package/libgpiod2/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_LIBGPIOD2
+	bool "libgpiod2"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+	depends on !BR2_PACKAGE_LIBGPIOD
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
+
+	  This package is the continuation of the libgpiod package
+	  for versions 2.0 and above.
+
+	  Note that a kernel of 5.10 or above is required for the
+	  ioctls to work.
+
+if BR2_PACKAGE_LIBGPIOD2
+
+config BR2_PACKAGE_LIBGPIOD2_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "Consider upgrading to libgpiod2"
+	depends on BR2_PACKAGE_LIBGPIOD
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
new file mode 100644
index 0000000000..b5488496b2
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.hash
@@ -0,0 +1,4 @@
+# From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
+sha256  fa4024a080121c958502f9a46a5bda44bea85e7a4dd7fcb3dead463b6fc4261c  libgpiod-2.1.tar.xz
+# Hash for license file
+sha256  eb17a56966db5d986bec449ee44ed61f01f9e3fafa952e527db67a8f9594fd11  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
new file mode 100644
index 0000000000..0749ec3cc4
--- /dev/null
+++ b/package/libgpiod2/libgpiod2.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libgpiod2
+#
+################################################################################
+
+# Be careful when bumping versions.
+# Dependency on kernel header versions may change.
+LIBGPIOD2_VERSION = 2.1
+LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
+LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
+LIBGPIOD2_LICENSE = LGPL-2.1+
+LIBGPIOD2_LICENSE_FILES = COPYING
+LIBGPIOD2_INSTALL_STAGING = YES
+LIBGPIOD2_DEPENDENCIES = host-pkgconf host-autoconf-archive
+LIBGPIOD2_CONF_OPTS = --disable-tests --disable-examples
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
+LIBGPIOD2_CONF_OPTS += --enable-tools
+else
+LIBGPIOD2_CONF_OPTS += --disable-tools
+endif
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBGPIOD2_CONF_OPTS += --enable-bindings-python
+LIBGPIOD2_DEPENDENCIES += python3
+LIBGPIOD2_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+else
+LIBGPIOD2_CONF_OPTS += --disable-bindings-python
+endif
+
+$(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
