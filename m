Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB2607030E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UDaFgAu2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D96D806F6;
	Wed,  4 Nov 2026 21:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmyDKDuGZ1ht; Wed,  4 Nov 2026 21:53:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E16A811A8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829200;
	b=n3SW2/CyYWfkXvQuFGGelLFdP8Po/EAbJYK5BXWpLz+OTPi8uaK5mcLgeuOqr+tiQmBX
	 GUYRm5pT6CVkSIOFvgWJ5btMp4x7MbfXy6cXj/koMe7RI/0AapZ39xVwL27Lxyw6ZuU2W
	 iX2MEyyP4d3r4VTc+THl0Gsu2jzPgmAqrnu98IlJn5EuyywB4GY/Gf7WbHWW4MnZOX2F9
	 cG00sh5lf52hd5n5MQd2SC094W19MHmlGVpTPng4v0hmcxlTmS/JW5m5xnbOaWiuQY/OL
	 yP/+vMHJOSaxjg52X1t1LpxeoBZ11O63MBxbYIxHac5HXBBWkymIYP0oTTfQEWCDNEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829200;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0kZMY4PGtaUEAXAxVThScT8zKG5ki+cCG0jh6tgqPfE=;
	b=SEvu7S/TviECOo/v6klROTmelJA/TwkOjForXhADFga1TrhEUVIDp/aY6Lr5kyZdStKP
	 nyOuGIL3YNDvZMg8T37PzRaHRzlEKvjW3DA7gQmUv7KHRCa36Z7qrQ0J20mNiO/tVupND
	 hn6nKntrQfWyIXOe6vdJ5hxcseM9ov++nZL4RJT3xU/oVn6xkZ33lCNFSkGUWF8+iGkrU
	 +hfQWXP+fQIM4zbueV0SwK++WuxGeG5RkgY7LCA/PDrIO7aO8LdNp+wOBc7x98U3EUuFB
	 3hWKXdFTQUiTbZR1E+jbaVEv7AZUbpRea7Wi1cO138dHbNCR+8/V2E2Cf+s+usAE3hw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829200;
	bh=0kZMY4PGtaUEAXAxVThScT8zKG5ki+cCG0jh6tgqPfE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UDaFgAu2BN1XVMU6tFUNUkQyvb/X0j6G5ryLriJ7e/f5lKHjGl2EHkskrSj5AOm5/
	 emqFLqsl/S/MZDtO5yXbhJUkhB2SdycUIX5/Y8Gpbivj72Gnv2uU2vUOXr0O3ZZilF
	 At26wfYqYpborOJm5yR4sLeaDo8qmrYNY9LHTTNdKdnxdUhIobVf138AlBJDv12ZUQ
	 OgAP48zaDOTeg0LJNMFmSt4VWBLInWUFF+ZP3H+ooM/6BAM6ihB+sgkYaw40SM9rHl
	 eFmMvKPPd+gOPwHap1+XnacegPNd+EDc1hW8qbZ/qHAYhSBnsWPbPBIjjTlONVPfBU
	 nIzpIc2pizt4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E16A811A8;
	Wed,  4 Nov 2026 21:53:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 174CAB6C
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 086CD407D0
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDEjvKP-D8yl for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:53:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 26CC7407BC
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26CC7407BC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2BD039DE37; Wed,  4 Nov 2026 21:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:51:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 12e4700524e8f47faf087242a26d4c2473037038
X-Git-Newrev: 0b820f8e22a936ca80a3c7c8eb862c7476f53a71
X-Patchwork-Hint: ignore
Message-Id: <20261104215147.2BD039DE37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump to version
 5.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b820f8e22a936ca80a3c7c8eb862c7476f53a71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

There are no release notes for the 5.x series; the git history is at
https://github.com/warmcat/libwebsockets/compare/v4.5.8...v5.1.0

Version 5.0.0 added mbedtls 4 support, and 5.1.0 brings the mbedtls 4
fixes on top of it, so libwebsockets now builds and works with
mbedtls 4.1.

Drop patch 0001, which was applied upstream in a reworked form as
commit 8a0dbfba1 ("cmake: only use libatomic if it provides the 64-bit
atomics").

HTTP/3 (QUIC) is now enabled by default. With OpenSSL, it forces the
new GnuTLS backend on, and with mbedtls it requires an mbedtls carrying
the libwebsockets QUIC patches, so the configure step fails either way:

  LWS_ROLE_QUIC (HTTP/3) requires mbedtls to be patched with QUIC
  support.

Disable HTTP/3 and QUIC, which version 4.5.8 did not have either.

LWS_PRE, the headroom required before buffers passed to lws_write(),
grew on 64-bit builds, and the soname changed from
libwebsockets.so.21 to libwebsockets.so.23.

The LICENSE file lists two more files that are already MIT licensed
(lib/misc/dht and lib/misc/qrcodegen.c), hence the hash change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sl-only-link-libatomic-if-it-is-available.patch | 61 ----------------------
 package/libwebsockets/libwebsockets.hash           |  4 +-
 package/libwebsockets/libwebsockets.mk             |  6 ++-
 3 files changed, 7 insertions(+), 64 deletions(-)

diff --git a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch b/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
deleted file mode 100644
index 84724f9c50..0000000000
--- a/package/libwebsockets/0001-cmake-openssl-only-link-libatomic-if-it-is-available.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e0480a47e95a0d74c826926ae6bfef14fc8d988f Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 27 Oct 2026 08:47:29 +0100
-Subject: [PATCH] cmake: openssl: only link libatomic if it is available
-
-Commit 09aade8c9 ("cmake: openssl: Added check for atomic library")
-adds -latomic to CMAKE_REQUIRED_LIBRARIES whenever 64-bit atomics
-don't work out of the box, without checking that libatomic exists.
-
-Some toolchains don't provide libatomic at all, e.g. GCC toolchains
-built without thread support, as libatomic relies on pthreads. On such
-a toolchain for a CPU without native 64-bit atomics (e.g. ARMv5), every
-OpenSSL API probe then fails to link:
-
-  ld: cannot find -latomic: No such file or directory
-
-so lws believes it deals with a pre-1.1 OpenSSL and the build fails:
-
-  include/libwebsockets/lws-genhash.h:93:18: error: field 'ctx' has incomplete type
-     93 |         HMAC_CTX ctx;
-        |                  ^~~
-
-Only use libatomic if linking against it makes the 64-bit atomics
-test pass.
-
-Assisted-by: Claude:claude-opus-5-5
-Upstream: sent to Andy Green <andy@warmcat.com> on 2026-10-27
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- lib/tls/CMakeLists.txt | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/lib/tls/CMakeLists.txt b/lib/tls/CMakeLists.txt
-index d91c3dab6..9060d32fe 100644
---- a/lib/tls/CMakeLists.txt
-+++ b/lib/tls/CMakeLists.txt
-@@ -564,10 +564,17 @@ if (DEFINED LIB_LIST)
- endif()
- if(UNIX AND (CMAKE_C_COMPILER_ID STREQUAL "GNU" OR CMAKE_C_COMPILER_ID MATCHES "Clang"))
-   check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64)
--  if(HAVE_WORKING_ATOMIC_64)
--    set(LWS_ATOMIC_LIB "")
--  else()
--    set(LWS_ATOMIC_LIB atomic)
-+  set(LWS_ATOMIC_LIB "")
-+  if(NOT HAVE_WORKING_ATOMIC_64)
-+    # libatomic is not always available (eg, toolchains without threads),
-+    # only use it if it actually provides the 64-bit atomics
-+    set(CMAKE_REQUIRED_LIBRARIES_SAVE ${CMAKE_REQUIRED_LIBRARIES})
-+    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES} atomic)
-+    check_c_source_compiles("int main() { long long x = 0; __atomic_fetch_add(&x, 1, __ATOMIC_SEQ_CST); return 0; }" HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
-+    set(CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES_SAVE})
-+    if(HAVE_WORKING_ATOMIC_64_WITH_LIBATOMIC)
-+      set(LWS_ATOMIC_LIB atomic)
-+    endif()
-   endif()
- endif()
- if (UNIX AND NOT (${CMAKE_SYSTEM_NAME} MATCHES "QNX"))
--- 
-2.34.1
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 654d3007e6..fe5c7b06ce 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b6ade658f4af3a823d0dc806ae5ef0623f0f4f5e2aeb895a0f77c4783840c30e  libwebsockets-4.5.8.tar.gz
-sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
+sha256  9acbba00aaa9e6178ae09c6f920d95449b527c1417e81d2cdd4103bc6d64d13f  libwebsockets-5.1.0.tar.gz
+sha256  e98c88a3de53b32c75d8130e29f5f3c4cdd89fb0c002091748e7d2d626dcb914  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 51f3df80f1..513b09ded2 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.5.8
+LIBWEBSOCKETS_VERSION = 5.1.0
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
+# HTTP/3 (QUIC) is enabled by default, but needs GnuTLS when OpenSSL
+# is used, and an mbedtls with the libwebsockets QUIC patches.
 LIBWEBSOCKETS_CONF_OPTS = \
 	-DDISABLE_WERROR=ON \
+	-DLWS_WITH_HTTP3=OFF \
+	-DLWS_ROLE_QUIC=OFF \
 	-DLWS_WITHOUT_TESTAPPS=ON \
 	-DLWS_IPV6=ON \
 	-DLWS_UNIX_SOCK=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
