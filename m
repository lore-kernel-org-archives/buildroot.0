Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8630D116F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C78C61B14;
	Thu, 27 Nov 2025 20:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCi66bDF2rg3; Thu, 27 Nov 2025 20:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF03361B0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF03361B0F;
	Thu, 27 Nov 2025 20:08:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F40FD708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3896384412
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RcZlqi1ITiX for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8255484416
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8255484416
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8064085FCB; Thu, 27 Nov 2025 20:07:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:17:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 96de5caea02502a5c9f359e1b1c83da6e177ca03
X-Git-Newrev: 94dae0d30eed499957b3d0c5ad27b3da4ffdc7f7
X-Patchwork-Hint: ignore
Message-Id: <20251127200756.8064085FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bctoolbox: remove
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0298263179047135116=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0298263179047135116==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=94dae0d30eed499957b3d0c5ad27b3da4ffdc7f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

bctoolbox was only needed as a dependency of linphone, as is anyway
bundled in more recent versions of linphone, making a separate package
unnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 37d3a2dee346267df51627fc31829da47e568b7c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  8 +++++
 package/Config.in                                  |  1 -
 .../0001-Fix-Libs.private-flags-for-mbedtls.patch  | 37 -------------------
 package/bctoolbox/Config.in                        | 19 ----------
 package/bctoolbox/bctoolbox.hash                   |  3 --
 package/bctoolbox/bctoolbox.mk                     | 42 ----------------------
 7 files changed, 8 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 93d58e131d..b986e6fce8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -247,7 +247,6 @@ package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch lib_patch
 package/bc/0003-dc-fix-exit-code-of-q-command.patch lib_patch.Upstream
 package/bc/0004-no-gen-libmath.patch lib_patch.Upstream
 package/bcache-tools/0001-Don-t-inline-crc64-for-gcc-5-compatability.patch lib_patch.Upstream
-package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch lib_patch.Upstream
 package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch lib_patch.Upstream
 package/bearssl/0001-Fix-missing-objdir-dependency.patch lib_patch.Upstream
 package/benejson/0001-c-std.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 6d243bad6a..81006945a7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.02.9"
 
+config BR2_PACKAGE_BCTOOLBOX
+	bool "bctoolbox has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle bctoolbox making a separate package unnecessary.
+
 config BR2_PACKAGE_ORTP
 	bool "ortp has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index a5053c06db..ec08acebf8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2146,7 +2146,6 @@ menu "Other"
 	source "package/atf/Config.in"
 	source "package/avro-c/Config.in"
 	source "package/basu/Config.in"
-	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
diff --git a/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch b/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
deleted file mode 100644
index 342042d59c..0000000000
--- a/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b7f14a800bbdad193f45695bc5b8c5173f3882ba Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Feb 2019 17:51:05 +0100
-Subject: [PATCH] CMakeLists.txt: fix mbedtls libraries in bctoolbox.pc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-bctoolbox.pc should not contain the full libraries path, path should be
-given by -L and library names by -l
-So sent back the fix already suggested by Jörg Krause in
-https://github.com/BelledonneCommunications/bctoolbox/pull/4
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/BelledonneCommunications/bctoolbox/pull/7]
----
- CMakeLists.txt | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 29f3eb6..b2f26c2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -101,9 +101,8 @@ else()
- endif()
- 
- if(MBEDTLS_FOUND)
--	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARIES}" PATH)
--	string(REPLACE ";" " " MBEDTLS_LIBRARIES_STR "${MBEDTLS_LIBRARIES}")
--	set(LIBS_PRIVATE "${LIBS_PRIVATE} ${MBEDTLS_LIBRARIES_STR}")
-+	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARY}" PATH)
-+	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedtls_library_path} -lmbedtls -lmbedcrypto -lmbedx509")
- endif()
- if(POLARSSL_FOUND)
- 	get_filename_component(polarssl_library_path "${POLARSSL_LIBRARIES}" PATH)
diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
deleted file mode 100644
index 1cf2b7e236..0000000000
--- a/package/bctoolbox/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_BCTOOLBOX
-	bool "bctoolbox"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Utilities library used by Belledonne Communications
-	  softwares like belle-sip, mediastreamer2 and linphone.
-
-	  Select BR2_PACKAGE_MBEDTLS for crypto support.
-
-	  https://github.com/BelledonneCommunications/bctoolbox
-
-comment "bctoolbox needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "bctoolbox needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
deleted file mode 100644
index 9b1f9e821d..0000000000
--- a/package/bctoolbox/bctoolbox.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  446b60e81a79b11e8212c44e312aeb0ce46e9ecf0269a35c492ecdca3e7428c3  bctoolbox-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
deleted file mode 100644
index ac9361026f..0000000000
--- a/package/bctoolbox/bctoolbox.mk
+++ /dev/null
@@ -1,42 +0,0 @@
-################################################################################
-#
-# bctoolbox
-#
-################################################################################
-
-BCTOOLBOX_VERSION = 4.4.8
-BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
-BCTOOLBOX_LICENSE = GPL-3.0+
-BCTOOLBOX_LICENSE_FILES = LICENSE.txt
-BCTOOLBOX_INSTALL_STAGING = YES
-
-# Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
-# shared library.
-BCTOOLBOX_CONF_OPTS = \
-	-DENABLE_POLARSSL=OFF \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TESTS_COMPONENT=OFF \
-	-DENABLE_TESTS=OFF \
-	-DCMAKE_SKIP_RPATH=ON
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-BCTOOLBOX_DEPENDENCIES += libiconv
-BCTOOLBOX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -liconv"
-endif
-
-ifeq ($(BR2_PACKAGE_MBEDTLS),y)
-BCTOOLBOX_DEPENDENCIES += mbedtls
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
-else
-BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
-endif
-
-ifeq ($(BR2_STATIC_LIBS),y)
-BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-$(eval $(cmake-package))

--===============0298263179047135116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0298263179047135116==--
