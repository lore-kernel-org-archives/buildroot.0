Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512EBC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A2AA60736;
	Sun, 30 Jul 2023 10:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A2AA60736
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTQMjpN-Ayn5; Sun, 30 Jul 2023 10:25:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C46E60AD0;
	Sun, 30 Jul 2023 10:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C46E60AD0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 629F11BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 475DB408B5
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475DB408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMa7IPN211w6 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:25:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 018AB408B0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 018AB408B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4B828383C; Sun, 30 Jul 2023 10:25:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:24:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ba451d691b1444bfe7cb897fbe68b691a7597736
X-Git-Newrev: afb30002403857baae1c48c2d2c4186ae63be613
X-Patchwork-Hint: ignore
Message-Id: <20230730102501.D4B828383C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=afb30002403857baae1c48c2d2c4186ae63be613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libheif/Config.in    | 15 +++++++++++
 package/libheif/libheif.hash |  3 +++
 package/libheif/libheif.mk   | 59 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 25d49b0fc3..9b829a364b 100644
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
index d47c8e8f6b..998074960d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1845,6 +1845,7 @@ menu "Multimedia"
 	source "package/libdvdread/Config.in"
 	source "package/libebml/Config.in"
 	source "package/libhdhomerun/Config.in"
+	source "package/libheif/Config.in"
 	source "package/libimxvpuapi/Config.in"
 	source "package/libmatroska/Config.in"
 	source "package/libmms/Config.in"
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
new file mode 100644
index 0000000000..d0ea72430e
--- /dev/null
+++ b/package/libheif/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBHEIF
+	bool "libheif"
+	# avoid build error
+	# Internal error in emit_expr_encoded at dw2gencfi.c:215
+	depends on !BR2_m68k_cf
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  libheif is an HEIF and AVIF file format decoder and encoder.
+
+	  https://github.com/strukturag/libheif
+
+comment "libheif needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_m68k_cf
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
