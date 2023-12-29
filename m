Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95264C4706F
	for <buildroot@archiver.kernel.org>; Fri, 29 Dec 2023 21:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B96140540;
	Fri, 29 Dec 2023 21:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B96140540
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBAS9-KFfZv8; Fri, 29 Dec 2023 21:19:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED6C943619;
	Fri, 29 Dec 2023 21:19:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6C943619
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 159811BF239
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DA0D40066
 for <buildroot@lists.busybox.net>; Fri, 29 Dec 2023 21:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DA0D40066
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsPIlZwqhYdS for <buildroot@lists.busybox.net>;
 Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF3CD4004F
 for <buildroot@buildroot.org>; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3CD4004F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD96A83912; Fri, 29 Dec 2023 21:17:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 29 Dec 2023 21:55:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c67de80597c830f8b8d92b469bf71457aa42c742
X-Git-Newrev: b917b4621022635dca8b02f24e2954107c8c0f77
X-Patchwork-Hint: ignore
Message-Id: <20231229211748.BD96A83912@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: bump to version 23.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=b917b4621022635dca8b02f24e2954107c8c0f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches (already in version)

https://github.com/merbanan/rtl_433/releases/tag/23.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 --
 ...txt-use-pkg-config-to-detect-openssl-when.patch | 42 ----------------------
 ...-minor-Fix-mongoose-build-without-threads.patch | 42 ----------------------
 package/rtl_433/rtl_433.hash                       |  2 +-
 package/rtl_433/rtl_433.mk                         |  2 +-
 5 files changed, 2 insertions(+), 88 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 599abafd2f..0bad49c223 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1210,8 +1210,6 @@ package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.p
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch Upstream
-package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch Upstream
-package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch Upstream
 package/rtmpdump/0001-include-limits.h.patch Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
diff --git a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
deleted file mode 100644
index 00858c8ff9..0000000000
--- a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b860de9e207d8fe2ea37dad28fdd014493d87703 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 27 Dec 2022 16:29:16 +0100
-Subject: [PATCH] build: Fix CMake to use pkg-config openssl when possible
- (#2290)
-
-In order to take into account the libraries used by openssl when
-building statically, using pkg-config is recommended. This patch
-therefore improves the CMakeLists.txt to use pkg-config to detect
-openssl when pkg-config is available. This will avoid
-static build failure when openssl needs to link with -latomic.
-
-Fixes:
- - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/b860de9e207d8fe2ea37dad28fdd014493d87703]
----
- CMakeLists.txt | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d47a3eda2..cf30d8be2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -175,7 +175,14 @@ set(ENABLE_OPENSSL AUTO CACHE STRING "Enable OpenSSL TLS support")
- set_property(CACHE ENABLE_OPENSSL PROPERTY STRINGS AUTO ON OFF)
- if(ENABLE_OPENSSL) # AUTO / ON
- 
--find_package(OpenSSL)
-+find_package(PkgConfig)
-+if(PKG_CONFIG_FOUND)
-+    pkg_check_modules(OPENSSL openssl)
-+    set(OPENSSL_LIBRARIES ${OPENSSL_LINK_LIBRARIES})
-+    set(OPENSSL_INCLUDE_DIR ${OPENSSL_INCLUDE_DIRS})
-+else()
-+    find_package(OpenSSL)
-+endif()
- if(OPENSSL_FOUND)
-     message(STATUS "OpenSSL TLS support will be compiled. Found version ${OPENSSL_VERSION}")
-     include_directories(${OPENSSL_INCLUDE_DIR})
diff --git a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
deleted file mode 100644
index 85bc45147a..0000000000
--- a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 707b51ecbc5598eed2fb67962232bf3fe0e96f81 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 27 Dec 2022 21:30:54 +0100
-Subject: [PATCH] minor: Fix mongoose build without threads (#2291)
-
-Fix the following build failure without threads:
-
-In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
-/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
-  407 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/707b51ecbc5598eed2fb67962232bf3fe0e96f81]
----
- include/mongoose.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/mongoose.h b/include/mongoose.h
-index 1173b3fc7..b111ea34e 100644
---- a/include/mongoose.h
-+++ b/include/mongoose.h
-@@ -404,7 +404,6 @@ unsigned int sleep(unsigned int seconds);
- #include <math.h>
- #include <netdb.h>
- #include <netinet/in.h>
--#include <pthread.h>
- #include <signal.h>
- #include <stdarg.h>
- #include <stdbool.h>
-@@ -4658,6 +4657,7 @@ size_t mg_fwrite(const void *ptr, size_t size, size_t count, FILE *f);
- #endif /* MG_ENABLE_FILESYSTEM */
- 
- #if MG_ENABLE_THREADS
-+#include <pthread.h>
- /*
-  * Starts a new detached thread.
-  * Arguments and semantics are the same as pthead's `pthread_create()`.
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 51fb29c78e..3a00e0cae7 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  61a9163d69cc4b1da46aebbcaf969bd180a055a6b90f42ad281218cc4fbefb86  rtl_433-22.11.tar.gz
+sha256  1260c58400bf35832ac1b76cb3cccf3dc1335ffa2416909c63c7d7060c74663b  rtl_433-23.11.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index e3be0e5ecf..7c33a71f31 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 22.11
+RTL_433_VERSION = 23.11
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
