Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB7EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB7E60E07;
	Sat,  8 Jul 2023 20:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CB7E60E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HuTYI04Dsjfl; Sat,  8 Jul 2023 20:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F32060D59;
	Sat,  8 Jul 2023 20:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F32060D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 036E01BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE58C414EA
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE58C414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MW1_v-vbK1Sv for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:05:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2829F414E5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2829F414E5
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:05:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4428A4C0E50;
 Sat,  8 Jul 2023 22:04:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-1H;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:42 +0200
Message-Id: <20230708200447.3919009-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846687;
 bh=IS26r0p6l9hJsRZFngNCpTab6IRjAnFCT7V1e5IL7Nw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fuAN45CB/vYzHJhfl2hegF+O/57HVGIqE+aS4cs1tIwNG/anH2+ti7zNfvVfhoATK
 /BhkF6S4j/2uTgaHihVVdBLlBv13K+/MqUPEyotmt3a9UNEmZGdiL90UktLqNpfS06
 xCcIpNHBN6Ku35hEewP2R7ZzM7eZcjPBsXtd84++xLtuVE0HJIslChusYx7NaQewJy
 6YCVvTZrQLRllh1cMiwacyZvBbS6jc94Hg7xR60KvpT1deTVKvg2qIPb6fjZtXViv3
 lJauj6k599kCJrWiYEgtOoOvwZYpkfz2XRLCr1kRAKHL8ou3FOJqkldox3Ko0tf8l7
 P7Hu8Ey061NsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fuAN45CB
Subject: [Buildroot] [PATCH 2/7] package/libheif: new package
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libheif/Config.in    | 14 +++++++++
 package/libheif/libheif.hash |  3 ++
 package/libheif/libheif.mk   | 59 ++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/libheif/Config.in
 create mode 100644 package/libheif/libheif.hash
 create mode 100644 package/libheif/libheif.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53a58923e3..f4a8011223 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -380,6 +380,7 @@ F:	package/libglew/
 F:	package/libglfw/
 F:	package/libglu/
 F:	package/libhdhomerun/
+F:	package/libheif/
 F:	package/libilbc/
 F:	package/libks/
 F:	package/libldns/
diff --git a/package/Config.in b/package/Config.in
index 58d02a5918..2b9ae471ea 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1840,6 +1840,7 @@ menu "Multimedia"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
 	source "package/libhdhomerun/Config.in"
+	source "package/libheif/Config.in"
 	source "package/libimxvpuapi/Config.in"
 	source "package/libmatroska/Config.in"
 	source "package/libmms/Config.in"
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
new file mode 100644
index 0000000000..9ce507fd24
--- /dev/null
+++ b/package/libheif/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LIBHEIF
+	bool "libheif"
+	# avoid build error
+	# Internal error in emit_expr_encoded at dw2gencfi.c:215
+	depends on !BR2_m68k_cf
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libheif is an HEIF and AVIF file format decoder and encoder.
+
+	  https://github.com/strukturag/libheif
+
+comment "libheif needs a toolchain w/ C++"
+	depends on !BR2_m68k_cf
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
new file mode 100644
index 0000000000..50152abde5
--- /dev/null
+++ b/package/libheif/libheif.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  7f97e4205c0bd9f9b8560536c8bd2e841d1c9a6d610401eb3eb87ed9cdfe78ea  libheif-1.16.2.tar.gz
+sha256  b2eb4f6588b005bebac44cfb2dfd23f6a16c5ca9b8a619a315158b0215a917a3  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
new file mode 100644
index 0000000000..9c6c2829cf
--- /dev/null
+++ b/package/libheif/libheif.mk
@@ -0,0 +1,59 @@
+################################################################################
+#
+# libheif
+#
+################################################################################
+
+LIBHEIF_VERSION = 1.16.2
+LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
+LIBHEIF_LICENSE = LGPL-3.0+
+LIBHEIF_LICENSE_FILES = COPYING
+LIBHEIF_INSTALL_STAGING = YES
+LIBHEIF_CONF_OPTS = \
+	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DENABLE_PLUGIN_LOADING=OFF \
+	-DWITH_AOM_DECODER=OFF \
+	-DWITH_AOM_ENCODER=OFF \
+	-DWITH_DEFLATE_HEADER_COMPRESSION=OFF \
+	-DWITH_EXAMPLES=OFF \
+	-DWITH_GDK_PIXBUF=OFF \
+	-DWITH_LIBSHARPYUV=OFF \
+	-DWITH_RAV1E=OFF \
+	-DWITH_REDUCED_VISIBILITY=ON \
+	-DWITH_SvtEnc=OFF
+
+ifeq ($(BR2_PACKAGE_DAV1D),y)
+LIBHEIF_CONF_OPTS += -DWITH_DAV1D=ON
+LIBHEIF_DEPENDENCIES += dav1d
+else
+LIBHEIF_CONF_OPTS += -DWITH_DAV1D=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBDE265),y)
+LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=ON
+LIBHEIF_DEPENDENCIES += libde265
+else
+LIBHEIF_CONF_OPTS += -DWITH_LIBDE265=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_X265),y)
+LIBHEIF_CONF_OPTS += -DWITH_X265=ON
+LIBHEIF_DEPENDENCIES += x265
+else
+LIBHEIF_CONF_OPTS += -DWITH_X265=OFF
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBHEIF_CONF_OPTS += -DENABLE_MULTITHREADING_SUPPORT=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
+LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=OFF
+else
+LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=ON
+endif
+else
+LIBHEIF_CONF_OPTS += \
+	-DENABLE_MULTITHREADING_SUPPORT=OFF \
+	-DENABLE_PARALLEL_TILE_DECODING=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
