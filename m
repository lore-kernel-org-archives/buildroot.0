Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A64CD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27E22607FC;
	Tue,  3 Sep 2024 16:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XntH6_bB-wie; Tue,  3 Sep 2024 16:28:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD52860848
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD52860848;
	Tue,  3 Sep 2024 16:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8B01BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BA4F40442
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYkIpSwykzPA for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 379ED4016D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 379ED4016D
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33F0986A1E; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 18:27:09 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4d7d17c7282afa61465d1ba9afcdb16f6f80e7ef
X-Git-Newrev: bf24fbf66ae110c679dfd27a5c4c12235eddd3ab
X-Patchwork-Hint: ignore
Message-Id: <20240903162808.33F0986A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/rtty: bump to
 version 8.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bf24fbf66ae110c679dfd27a5c4c12235eddd3ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

- Drop patch (already in version)
- This bump will fix the following build failure with musl >= 1.2.5
  thanks to
  https://github.com/zhaojh329/rtty/commit/eb6394c3d83a21a8825e47b40659cfe0ead33b6f:

  /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c: In function 'start_upload_file':
  /home/autobuild/autobuild/instance-22/output-1/build/rtty-8.1.0/src/file.c:156:24: error: implicit declaration of function 'basename' [-Werror=implicit-function-declaration]
    156 |     const char *name = basename(path);
        |                        ^~~~~~~~

https://github.com/zhaojh329/rtty/releases/tag/v8.1.2
https://github.com/zhaojh329/rtty/releases/tag/v8.1.1

Fixes:
 - http://autobuild.buildroot.org/results/382405b421a8ea7b5b3beb553f47fa20427fa3c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ca742a985cc9acc40fff3539c696e64fa040f1c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...1-CMakeLists.txt-prefer-pkg_check_modules.patch | 40 ----------------------
 package/rtty/rtty.hash                             |  2 +-
 package/rtty/rtty.mk                               |  2 +-
 4 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bc52d45933..d7114b38a9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1316,7 +1316,6 @@ package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch lib_patch.Upstream
 package/rtmpdump/0001-include-limits.h.patch lib_patch.Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
-package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/0001-meson.build-fix-g_ir_compiler-calls.patch lib_patch.Upstream
diff --git a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch b/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
deleted file mode 100644
index 3714050445..0000000000
--- a/package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 565c003ac412c9b0fa39d208d4a911f4300477c3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 26 Feb 2023 20:39:11 +0100
-Subject: [PATCH] CMakeLists.txt: prefer pkg_check_modules
-
-Prefer pkg_check_modules over find_package to avoid the following static
-build failure with openssl and -latomic:
-
-/home/autobuild/autobuild/instance-8/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-8/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(ssl_cert.o): in function `ssl_cert_free':
-ssl_cert.c:(.text+0x53c): undefined reference to `__atomic_fetch_sub_4'
-
-Fixes:
- - http://autobuild.buildroot.org/results/f606bb15bf4f88ba29ef0795413e13acc9cd0976
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/ssl/pull/4]
----
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ssl/CMakeLists.txt b/src/ssl/CMakeLists.txt
-index 4868bf7..36488c7 100644
---- a/src/ssl/CMakeLists.txt
-+++ b/src/ssl/CMakeLists.txt
-@@ -14,10 +14,10 @@ endif()
- 
- find_package(PkgConfig QUIET)
- 
--find_package(OpenSSL)
-+pkg_check_modules(OPENSSL openssl)
- 
- if (NOT OPENSSL_FOUND)
--    pkg_check_modules(OPENSSL openssl)
-+    find_package(OpenSSL)
- endif()
- 
- find_package(WolfSSL)
--- 
-2.39.1
-
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index a6ccb5c2e6..004314eea1 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  e634939bae62bf3d52ceebae5df00179629d214634b93464eeb2294406512b30  rtty-8.1.0.tar.gz
+sha256  522b0fc5e032c3b84ac707abce8ac4ff5609900011f8f300ce4f4246abac0acc  rtty-8.1.2.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index b2fac14432..618971c9a3 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 8.1.0
+RTTY_VERSION = 8.1.2
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
