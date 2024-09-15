Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1375C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B05C1849E8;
	Sun, 15 Sep 2024 21:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_Zsy0qsaSbw; Sun, 15 Sep 2024 21:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BE9849D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6BE9849D4;
	Sun, 15 Sep 2024 21:42:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77B9E1BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BEB960886
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4lMd7JJ1bys for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83E86089A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83E86089A
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5A3A82261; Sun, 15 Sep 2024 21:36:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 11:27:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21e9bb0967a6534e73138a8e645a5c80fc442b0d
X-Git-Newrev: 3cb185d3df237341382b03c8e6f6c5358063c721
X-Patchwork-Hint: ignore
Message-Id: <20240915213640.D5A3A82261@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dlib: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cb185d3df237341382b03c8e6f6c5358063c721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/dlib/Config.in | 14 +++++++
 package/dlib/dlib.hash | 13 +++++++
 package/dlib/dlib.mk   | 99 ++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f291ba8e7c..929e9f895f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2888,6 +2888,7 @@ F:	support/testing/tests/package/test_python_mako.py
 F:	toolchain/
 
 N:	Roy Kollen Svendsen <roykollensvendsen@gmail.com>
+F:	package/dlib/
 F:	package/qt6/
 
 N:	Rufus Segar <rhs@riseup.net>
diff --git a/package/Config.in b/package/Config.in
index a1d53edf5b..c0f4d9ece5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2155,6 +2155,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dlib/Config.in"
 	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
diff --git a/package/dlib/Config.in b/package/dlib/Config.in
new file mode 100644
index 0000000000..2419af967b
--- /dev/null
+++ b/package/dlib/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_DLIB
+	bool "dlib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Dlib is a modern C++ toolkit containing machine learning
+	  algorithms and tools for creating complex software in C++ to
+	  solve real world problems.
+
+	  http://dlib.net
+
+comment "dlib needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dlib/dlib.hash b/package/dlib/dlib.hash
new file mode 100644
index 0000000000..af206386b8
--- /dev/null
+++ b/package/dlib/dlib.hash
@@ -0,0 +1,13 @@
+# Locally computed
+sha256  22513c353ec9c153300c394050c96ca9d088e02966ac0f639e989e50318c82d6  dlib-19.24.6.tar.gz
+
+# Hashes for license files
+sha256  50c1c5978d490c7f13062d91c4b89affc83774f87bc4568a714f748b62a5b216  dlib/external/libjpeg/README
+sha256  debfae299fa4118b0a586af4cf7ac8d38aae81ac4e9995c935862aaee6eb0362  dlib/external/libpng/LICENSE
+sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  dlib/external/pybind11/LICENSE
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  dlib/LICENSE.txt
+sha256  908b0b565ae9bf61b7b41447cb0b83564f320375723bcc884ec30e5537a0d5dc  dlib/test/ffmpeg_data/LICENSE.TXT
+sha256  78515536a4b0d896745b6483fccc561987e8e2f2d014dc81d7c2e97c497a0a69  examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+sha256  a0e7b40719ba74630debe9fae1cb847ee436215451123254a690171d09fb036e  examples/video_frames/license.txt
+sha256  8d8291caf1cee26d23acf3eb67c9f9a2d58f1c681b16a4fbe8cbfb9e3c0b5a9b  LICENSE.txt
+sha256  8acb12b218fdb5e071f25eda9ac990d04888388b65095867d9007c278a9f993b  python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
diff --git a/package/dlib/dlib.mk b/package/dlib/dlib.mk
new file mode 100644
index 0000000000..4eb0002775
--- /dev/null
+++ b/package/dlib/dlib.mk
@@ -0,0 +1,99 @@
+################################################################################
+#
+# dlib
+#
+################################################################################
+
+DLIB_VERSION = 19.24.6
+DLIB_SITE = $(call github,davisking,dlib,v$(DLIB_VERSION))
+DLIB_CMAKE_BACKEND = ninja
+DLIB_INSTALL_STAGING = YES
+DLIB_SUPPORTS_IN_SOURCE_BUILD = NO
+
+DLIB_LICENSE = \
+	BSD-3-Clause (kissfft, pybind11) \
+	BSL-1.0 (dlib, tools) \
+	CC0-1.0 (examples) \
+	libpng-2.0 (libpng) \
+	MIT or CC0-1.0 (JoinPaths.cmake)
+
+DLIB_LICENSE_FILES = \
+	dlib/external/libjpeg/README \
+	dlib/external/libpng/LICENSE \
+	dlib/external/pybind11/LICENSE \
+	dlib/LICENSE.txt \
+	dlib/test/ffmpeg_data/LICENSE.TXT \
+	examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt \
+	examples/video_frames/license.txt \
+	LICENSE.txt \
+	python_examples/LICENSE_FOR_EXAMPLE_PROGRAMS.txt
+
+DLIB_CONF_OPTS = \
+	-DDLIB_LINK_WITH_SQLITE3=OFF \
+	-DDLIB_USE_CUDA=OFF \
+	-DDLIB_USE_MKL_FFT=OFF
+
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=ON
+DLIB_DEPENDENCIES += ffmpeg
+else
+DLIB_CONF_OPTS += -DDLIB_USE_FFMPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=ON
+DLIB_DEPENDENCIES += giflib
+else
+DLIB_CONF_OPTS += -DDLIB_GIF_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=ON
+DLIB_DEPENDENCIES += jpeg
+else
+DLIB_CONF_OPTS += -DDLIB_JPEG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LAPACK),y)
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=ON
+DLIB_DEPENDENCIES += lapack
+else
+DLIB_CONF_OPTS += -DDLIB_USE_LAPACK=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBJXL),y)
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=ON
+DLIB_DEPENDENCIES += libjxl
+else
+DLIB_CONF_OPTS += -DDLIB_JXL_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=ON
+DLIB_DEPENDENCIES += libpng
+else
+DLIB_CONF_OPTS += -DDLIB_PNG_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPENBLAS),y)
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=ON
+DLIB_DEPENDENCIES += openblas
+else
+DLIB_CONF_OPTS += -DDLIB_USE_BLAS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=ON
+DLIB_DEPENDENCIES += webp
+else
+DLIB_CONF_OPTS += -DDLIB_WEBP_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=OFF
+DLIB_DEPENDENCIES += xlib_libX11
+else
+DLIB_CONF_OPTS += -DDLIB_NO_GUI_SUPPORT=ON
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
