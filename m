Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EC6E95A77
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C12E560BA6;
	Tue, 30 Dec 2025 11:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsgUnWaFmgHg; Tue, 30 Dec 2025 11:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E58860B7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767093300;
	bh=U2qyAWix1cGZT6cy+9Syvk6ixplvaHnVP61KoBP9Qfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=esVvgBf3KrtqRGiMx++gYcUVj8g7YrAm9w0AldsmPsCAgu24oKd0bGQ9AZ0nAzrjl
	 OnC+oo3c/Ho5IqYZIIZjFxitfRBr/d2C8vQkSvx/oMHmioS+N+Zl/op2TTt9FhLKrj
	 VuaPH9ksJiynMWHGxudh5HJgnfAr39zmw5c4ctLrLTy90OeH6dTAF57rQx4lCBtLVX
	 8+YVKSBJjKirw+lkk14l/pFPrhQwj+JzoAplhKLH/THOlv1XJuxnv016Xoo4xWg3Vk
	 bxu0fbuS7JSqVG7or+QEZtG+xTWshFmqjSiUHkcGLWwIPOF44HyhbXXUjI3NAPv3hS
	 VoKs+YV8bjqWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E58860B7C;
	Tue, 30 Dec 2025 11:15:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E9E2177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8F19402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHJ2DT2k6quY for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 061464030E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 061464030E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 053A887C26; Tue, 30 Dec 2025 11:14:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 12:01:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 370ba8af9e112f61b38c93af580070052e793e60
X-Git-Newrev: 9211ff06dfdb9bd1fdd74b5786bf75885a6da6ab
X-Patchwork-Hint: ignore
Message-Id: <20251230111445.053A887C26@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgi: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9211ff06dfdb9bd1fdd74b5786bf75885a6da6ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fails to build with cmake 4.

The package is a library without any reverse dependencies and no active
development since 2021 (not counting a build fix provided by Fabrice in
2022).

Fixes:
https://autobuild.buildroot.net/results/604/604e8e5752e9a11d25bb65b9913db57d3db85b6f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  6 +++
 package/Config.in                                  |  1 -
 .../0001-CMakeLists.txt-honour-BUILD_TESTING.patch | 44 ----------------------
 package/libcgi/Config.in                           | 11 ------
 package/libcgi/libcgi.hash                         |  8 ----
 package/libcgi/libcgi.mk                           | 14 -------
 7 files changed, 6 insertions(+), 79 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2c9d62fe49..c4bc3e5c02 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -523,7 +523,6 @@ package/libavl/0001-fix-makefile.patch lib_patch.Upstream
 package/libb64/0001-Integer-overflows.patch lib_patch.Upstream
 package/libb64/0002-Initialize-C++-objects.patch lib_patch.Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch lib_patch.Upstream
-package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch lib_patch.Upstream
 package/libcgicc/0001-disable-documentation-option.patch lib_patch.Sob lib_patch.Upstream
 package/libcuefile/0001-fix-static-link.patch lib_patch.Upstream
 package/libdaemon/0001-testd-use-unistd-h-instead-of-sys-unistd-h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ff0549548d..3ce540561f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBCGI
+	bool "libcgi has been removed"
+	select BR2_LEGACY
+	help
+	  libcgi is unmaintained and has been removed
+
 config BR2_PACKAGE_LET_ME_CREATE
 	bool "let-me-create has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 5c337c0eb5..58905f4759 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2032,7 +2032,6 @@ menu "Networking"
 	source "package/gupnp-dlna/Config.in"
 	source "package/ibrcommon/Config.in"
 	source "package/ibrdtn/Config.in"
-	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
 	source "package/libcpprestsdk/Config.in"
diff --git a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch b/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
deleted file mode 100644
index 3ec674ae70..0000000000
--- a/package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 15ec267520efbe45193eb1df5361a4ab56164294 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 8 May 2022 17:54:42 +0200
-Subject: [PATCH] CMakeLists.txt: honour BUILD_TESTING
-
-Allow the user to disable tests through the standard BUILD_TESTING
-option: https://cmake.org/cmake/help/latest/module/CTest.html
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rafaelsteil/libcgi/commit/15ec267520efbe45193eb1df5361a4ab56164294]
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cbf0d97..e3329a1 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -29,15 +29,21 @@ option(BUILD_SHARED_LIBS
- 	"Global flag to cause add_library to create shared libraries if on."
- 	ON
- )
-+option(BUILD_TESTING
-+	"Build tests."
-+	ON
-+)
- 
- # subdirectories
- add_subdirectory("include/libcgi")
- add_subdirectory("src")
- 
- # test
--enable_testing()
--include(CTest)
--add_subdirectory("test")
-+if(BUILD_TESTING)
-+	enable_testing()
-+	include(CTest)
-+	add_subdirectory("test")
-+endif(BUILD_TESTING)
- 
- # cmake package stuff
- configure_package_config_file(${PROJECT_NAME_LC}-config.cmake.in
diff --git a/package/libcgi/Config.in b/package/libcgi/Config.in
deleted file mode 100644
index 33369079b3..0000000000
--- a/package/libcgi/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBCGI
-	bool "libcgi"
-	help
-	  LibCGI is a library written from scratch to easily make
-	  CGI applications in C.
-
-	  There are a lot of functions like string manipulation,
-	  session and cookie support, GET and POST methods manipulation
-	  etc..., to help you to quickly write powerful CGI programs.
-
-	  https://github.com/rafaelsteil/libcgi/
diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
deleted file mode 100644
index 5e8845ede2..0000000000
--- a/package/libcgi/libcgi.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.md5
-md5  6efdc968bdf986832b7e220d1b914e57  libcgi-1.3.0.tar.gz
-# From https://github.com/rafaelsteil/libcgi/releases/download/v1.3.0/libcgi-1.3.0.tar.gz.sha256
-sha256  d932f380b1a5dbfbddffaa76fac71bf505a9585d441c9ae86bfbf76033d9d8df  libcgi-1.3.0.tar.gz
-
-# Hash for license file:
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1.txt
-sha256  f32c31e26ec840753a8cd47cd2681e48be4cee853212d16a4b1d85ac4d677669  LICENSES/MIT.txt
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
deleted file mode 100644
index 22163310d3..0000000000
--- a/package/libcgi/libcgi.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libcgi
-#
-################################################################################
-
-LIBCGI_VERSION = 1.3.0
-LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
-
-LIBCGI_INSTALL_STAGING = YES
-LIBCGI_LICENSE = LGPL-2.1+, MIT (base64.c)
-LIBCGI_LICENSE_FILES = LICENSES/LGPL-2.1.txt LICENSES/MIT.txt
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
