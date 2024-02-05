Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA4EC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0F18417CB;
	Mon,  5 Feb 2024 10:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0F18417CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xX812nt00Eoh; Mon,  5 Feb 2024 10:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6AAD417B1;
	Mon,  5 Feb 2024 10:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6AAD417B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75F041BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D66417B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59D66417B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcZ9xzWF5tst for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:15:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71E8341568
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E8341568
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6157186A0D; Mon,  5 Feb 2024 10:15:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:14:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c5981d1a119bc9779a9c1d507899f835559f7b8
X-Git-Newrev: 0d6e5ca41f174b8cc18d668445ebd4d9578dd013
X-Patchwork-Hint: ignore
Message-Id: <20240205101559.6157186A0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 4.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d6e5ca41f174b8cc18d668445ebd4d9578dd013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop first patch (already in version)

https://github.com/warmcat/libwebsockets/compare/v4.3.2...v4.3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...CMakeLists.txt-fix-build-with-pkg-config.patch} |  0
 ...-CMakeLists.txt-fix-build-without-threads.patch | 47 ----------------------
 package/libwebsockets/libwebsockets.hash           |  2 +-
 package/libwebsockets/libwebsockets.mk             |  2 +-
 5 files changed, 2 insertions(+), 50 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 15ceb65fd8..bcb6aff6ce 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -727,7 +727,6 @@ package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch Upstream
 package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch Upstream
 package/libwebsock/0002-fix-ssl.patch Upstream
 package/libwebsock/0003-fix-incorrect-inline.patch Upstream
-package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch Upstream
 package/libyuv/0001-i386-sse2.patch Upstream
 package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch Upstream
 package/lighttpd/S50lighttpd EmptyLastLine Indent Shellcheck Variables
diff --git a/package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
similarity index 100%
rename from package/libwebsockets/0002-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
rename to package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-with-pkg-config.patch
diff --git a/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
deleted file mode 100644
index ae46602a53..0000000000
--- a/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c83cf48b9095a6914a0844bec4439763bb0c9138 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 May 2022 23:15:40 +0200
-Subject: [PATCH] lib/tls/CMakeLists.txt: fix build without threads
-
-openssl can be built without threads resulting in the following build
-failure:
-
--- Looking for HMAC_CTX_new
--- Looking for HMAC_CTX_new - not found
-
-[...]
-
-In file included from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets.h:661,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/core/./private-lib-core.h:140,
-                 from /home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/lib/plat/unix/unix-misc.c:28:
-/home/buildroot/autobuild/instance-0/output-1/build/libwebsockets-4.3.1/include/libwebsockets/lws-genhash.h:85:18: error: field 'ctx' has incomplete type
-   85 |         HMAC_CTX ctx;
-      |                  ^~~
-
-To fix this build failure, don't unconditionally add pthread if openssl
-has been found through pkg-config as openssl.pc will contain the
-appropriate dependencies (i.e. -lpthread but also -lz or -latomic)
-
-Fixes:
- - http://autobuild.buildroot.org/results/2ae9e3249b6fcc9e6c30e7783e264fc6599e61df
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/warmcat/libwebsockets/commit/c83cf48b9095a6914a0844bec4439763bb0c9138]
----
- lib/tls/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
-index 559be9abb..a2b78c252 100644
---- a/lib/tls/CMakeLists.txt
-+++ b/lib/tls/CMakeLists.txt
-@@ -311,7 +311,7 @@ endif()
- if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
- 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} ${CMAKE_DL_LIBS})
- endif()
--if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
-+if ((CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX) AND NOT ((${CMAKE_SYSTEM_NAME} MATCHES "QNX") OR PC_OPENSSL_FOUND))
- 	set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} pthread)
- endif()
- 
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 4bff068241..01e7c7bfd1 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6a85a1bccf25acc7e8e5383e4934c9b32a102880d1e4c37c70b27ae2a42406e1  libwebsockets-4.3.2.tar.gz
+sha256  6fd33527b410a37ebc91bb64ca51bdabab12b076bc99d153d7c5dd405e4bdf90  libwebsockets-4.3.3.tar.gz
 sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index daf481b3bc..c00c44cac3 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.3.2
+LIBWEBSOCKETS_VERSION = 4.3.3
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
