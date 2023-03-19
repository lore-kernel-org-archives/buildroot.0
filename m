Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61B7C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F8C81BE3;
	Sun, 19 Mar 2023 10:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F8C81BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_yda9hWl8zp; Sun, 19 Mar 2023 10:14:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5D581D7C;
	Sun, 19 Mar 2023 10:14:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5D581D7C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2757E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BA1415C9
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00BA1415C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJkoFRVzTy2q for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:14:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D373409EB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D373409EB
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:14:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.48]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1pv63a3JP1-00ITWT; Sun, 19
 Mar 2023 11:14:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 11:14:20 +0100
Message-Id: <20230319101420.9440-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319101420.9440-1-ps.report@gmx.net>
References: <20230319101420.9440-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:LwlDFU2u701rmopSkctExz1iuS44WTwX/WdbmFyeNgOF+ZTrp2J
 ut3N4pfooAi9FCx46StIEUYG8NogF9pAO9UwKqhmGv9CYLNwkz4htnYEChtXmTpROjG47Ff
 kGyUIOSzHmx8GJ1a13+tABCES5SF5dci9oZM2Lu+XsAz+pUZ878Kf0eYDv7RaAjsYxxzXNP
 YNZg5//3BnPfp7NZFZbpQ==
UI-OutboundReport: notjunk:1;M01:P0:C0sYcVNNqrM=;slcYHjhmREihKg+MY1u7QXIH32t
 41Nk0yrNcO/5TN2Xg1uXjp62ZevbZaprqhkwWxhqc8VnEx2P5QZPIo8vo+qu4dUlLNg9no1EG
 b56rzziXrMwY5xxzeRwSUNq3XCEZlZ7a5xj9/epXEmG00jcOWpZZyTRM/R+PPdQcphx8+So+N
 BtUcvvFh55aI9RcyE7/3f+C3vtjswGeq55AqDaXKPuIjfd9VsghZfC+WR3tbvEXsX2B5BBVk+
 1SE81e90lF2NfSIUQw5lZjMaLYmzpcB/thtZvJoC+moKbJu8l6qXkz1TLjN/c2hTaqdSSRkjO
 qlPD9OgCLL5UBU36FxN+/kkOYuecaYA6jzOd7N9wEdAoJ67NEJ5NeXhb9MjQ61Sal5JpcecS3
 KUHbtcfZjTYjM3hjtx8UoZxh69sgxq/tl+17oPLBwkAIMwq9K3YWINPF8cZ7gKL37JctKKDgK
 lfXOJvKXBx3yMgF16b+Yz4DBdEnx16FaHPglD0qHGxdmjMSKX63t7qaLRDAZAfQcfmPeplLTE
 wCnbSc209SS1GkGeYvOR02y0/Apb+P4BRejt0O/r2de6uTeKF5yo/UTQm5khyLZQaqVgPIcwt
 yC6/l6VgLHeSGdC3G/jx0mE8sDgFckiiBm3cW5zEOLULj/bz0TLPmhhT/rJF2lNbuqhg4I/g+
 aTkiQoj87VLHdeCf/kDDXp/jyINIV93E/0KgeDZHK8usizPZrMBmhaPkWCq0GwuvGJcyQa7eA
 pdnhJHhmrKSbg+j3ip0tiDj9jIqQjbR/F4nh4DiPSvmWRTY1o/2aAhVhn9vCV1W9J7OvGX9Td
 wRLAr4c49re1hZ4mq0UOipylv0NVqgPyn1r4z69K03Dr6blxzgJrHxozc+lIpqSsP2mqFpeTt
 KTg684tpd9t92rH3ETERoVKXHvjmBKLoCpjr0T7wyM5y+wVhVj3PETBmdJuqxynN9gZL7Hm0D
 kot4dDrXZw6AvDhA0Npo+km3chI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679220862; i=ps.report@gmx.net;
 bh=MMQL8oj+bvPc9u+SelxjqRn2AOnx2fsUHicBchL+oSU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b6OlgjvXj0F8zxpOvUiE/D0vcPARcFvT/DhXMv39h/Hd+23xw+2x2yXodBnlggvVi
 lZu8Z9Dr/HFqUaFXfUsoi74pU5wmO+wj3ptpI60SFSuxt0+ZxJsDTLi25NiPuWJU3v
 x/rxCaxoH1519PaAQnVRJIrBLN13CkNm59ivmsLVT2Tv2VXu/DY6NmFkhs5GgkI/gA
 74hL3aFRbZD8mNGwoKympsgFDHq3aovGqsjrN8dvi8qNjdDQwP3UR3nbA9pzwPnFin
 dnwb6+ykkASZXSuHstdvJrClihMxCCMpInLC/NXvk2K6gQLqNE4Bd5yVLRw2K6K/Tn
 Jg+4K3bDAhD0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=b6OlgjvX
Subject: [Buildroot] [PATCH v1 2/2] package/qt6/qt6svg: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt6/Config.in          |  1 +
 package/qt6/qt6svg/Config.in   | 11 ++++++++
 package/qt6/qt6svg/qt6svg.hash | 10 +++++++
 package/qt6/qt6svg/qt6svg.mk   | 51 ++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/qt6/qt6svg/Config.in
 create mode 100644 package/qt6/qt6svg/qt6svg.hash
 create mode 100644 package/qt6/qt6svg/qt6svg.mk

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 655fa8392a..3788caa6a3 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -46,5 +46,6 @@ if BR2_PACKAGE_QT6
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6serialbus/Config.in"
 source "package/qt6/qt6serialport/Config.in"
+source "package/qt6/qt6svg/Config.in"
 
 endif
diff --git a/package/qt6/qt6svg/Config.in b/package/qt6/qt6svg/Config.in
new file mode 100644
index 0000000000..179101c97f
--- /dev/null
+++ b/package/qt6/qt6svg/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT6SVG
+	bool "qt6svg"
+	select BR2_PACKAGE_QT6BASE_GUI
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt SVG provides classes for rendering and displaying SVG
+	  drawings in widgets and on other paint devices.
+
+	  https://doc.qt.io/qt-6/qtsvg-index.html
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
new file mode 100644
index 0000000000..bb239cb012
--- /dev/null
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -0,0 +1,10 @@
+# Hash from: https://download.qt.io/official_releases/qt/6.4/6.4.3/submodules/qtsvg-everywhere-src-6.4.3.tar.xz.sha256
+sha256  88315f886cf81898705e487cedba6e6160724359d23c518c92c333c098879a4a  qtsvg-everywhere-src-6.4.3.tar.xz
+
+# Hashes for license files:
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
new file mode 100644
index 0000000000..be0addbd0d
--- /dev/null
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# qt6svg
+#
+################################################################################
+
+QT6SVG_VERSION = $(QT6_VERSION)
+QT6SVG_SITE = $(QT6_SITE)
+QT6SVG_SOURCE = qtsvg-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SVG_VERSION).tar.xz
+QT6SVG_INSTALL_STAGING = YES
+QT6SVG_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6SVG_LICENSE = \
+	GPL-2.0+ or LGPL-3.0, \
+	GPL-3.0 with exception (tools), \
+	GFDL-1.3 (docs), \
+	BSD-3-Clause
+
+QT6SVG_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/Qt-GPL-exception-1.0.txt
+
+QT6SVG_CONF_OPTS = \
+	-GNinja \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6SVG_DEPENDENCIES = \
+	host-pkgconf \
+	host-ninja \
+	qt6base
+
+define QT6SVG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SVG_BUILDDIR)
+endef
+
+define QT6SVG_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
+endef
+
+define QT6SVG_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6SVG_BUILDDIR)
+endef
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
