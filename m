Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B1AC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4601E40657;
	Fri, 12 Jul 2024 21:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GKQncGE_qzjS; Fri, 12 Jul 2024 21:05:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B68406DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B68406DB;
	Fri, 12 Jul 2024 21:05:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B6A41BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5923560647
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTLSTKlGVoPz for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8096E605E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8096E605E7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:05:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 726398626A; Fri, 12 Jul 2024 21:05:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 23:04:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4cf2bbc42d0c55393356bdb5a40b79fc1ba8cad
X-Git-Newrev: 9f458cd6c2940267655f673b3ae5f14334f12859
X-Patchwork-Hint: ignore
Message-Id: <20240712210522.726398626A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libavif: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f458cd6c2940267655f673b3ae5f14334f12859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libavif is an implementation of the AV1F image format, which may be a
frontend for different encoders and decoders. At the moment only dav1d
is packaged so that is the one configured.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libavif/Config.in    | 13 +++++++++++++
 package/libavif/libavif.hash |  3 +++
 package/libavif/libavif.mk   | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f482e3fe56..7b0f65fbfb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/brotli/
 F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
+F:	package/libavif/
 F:	package/libdex/
 F:	package/libepoxy/
 F:	package/libmanette/
diff --git a/package/Config.in b/package/Config.in
index eeb11dfa83..a52ed146d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1677,6 +1677,7 @@ menu "Graphics"
 	source "package/leptonica/Config.in"
 	source "package/lesstif/Config.in"
 	source "package/libart/Config.in"
+	source "package/libavif/Config.in"
 	source "package/libdecor/Config.in"
 	source "package/libdmtx/Config.in"
 	source "package/libdri2/Config.in"
diff --git a/package/libavif/Config.in b/package/libavif/Config.in
new file mode 100644
index 0000000000..a15e9fc733
--- /dev/null
+++ b/package/libavif/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBAVIF
+	bool "libavif"
+	depends on !BR2_STATIC_LIBS # dav1d, dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dav1d, pthread
+	select BR2_PACKAGE_DAV1D
+	help
+	  Friendly, portable C implementation of the AV1 Image File
+	  Format.
+
+	  https://github.com/AOMediaCodec/libavif
+
+comment "libavif needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
new file mode 100644
index 0000000000..f4599cdb0b
--- /dev/null
+++ b/package/libavif/libavif.hash
@@ -0,0 +1,3 @@
+sha256  dc56708c83a4b934a8af2b78f67f866ba2fb568605c7cf94312acf51ee57d146  libavif-1.0.4.tar.gz
+
+sha256  10952217a6d404de8bf8a997fbea9b88f682df1fe98cb9b9f467ade641525639  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
new file mode 100644
index 0000000000..b87597995a
--- /dev/null
+++ b/package/libavif/libavif.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libavif
+#
+################################################################################
+
+LIBAVIF_VERSION = 1.0.4
+LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
+LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
+LIBAVIF_LICENSE_FILES = LICENSE
+LIBAVIF_INSTALL_STAGING = YES
+
+# Only the dav1d decoder is packaged at the moment.
+LIBAVIF_DEPENDENCIES = dav1d
+LIBAVIF_CONF_OPTS = \
+	-DAVIF_BUILD_APPS=OFF \
+	-DAVIF_BUILD_EXAMPLES=OFF \
+	-DAVIF_BUILD_MAN_PAGES=OFF \
+	-DAVIF_BUILD_TESTS=OFF \
+	-DAVIF_CODEC_AOM=OFF \
+	-DAVIF_CODEC_DAV1D=ON \
+	-DAVIF_CODEC_LIBGAV1=OFF \
+	-DAVIF_CODEC_RAV1E=OFF \
+	-DAVIF_CODEC_SVT=OFF \
+	-DAVIF_CODEC_AVM=OFF \
+	-DAVIF_ENABLE_GTEST=OFF
+
+# There is no CMake options to explicitly enable/disable usage of
+# libyuv, only autodetection :-(
+ifeq ($(BR2_PACKAGE_LIBYUV),y)
+LIBAVIF_DEPENDENCIES += libyuv
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
