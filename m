Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C6EEA845
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 20:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B03FF60B62;
	Thu, 12 Feb 2026 20:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufk9F9wBpO6s; Thu, 12 Feb 2026 20:05:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 919E360B79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770926712;
	bh=FHy/bO8QDzpTeQB8dNyXacz+DLMuI8dTzNDoP5YOm5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZqPV8KFCjbphEtAAUbQVFKL/plErksDEqZkE8s3A40zNTwE0r/BsoZwCQyUVUKmSh
	 C/MRomxP2sqGI51wy40jbZvzNcbs4qTv26LSuqz76K+RmwCmp4I5YfnbtJakNABrk7
	 BrRHojBpgF+JFL4M72e/C7fbKlkiO8gZ2rmq58jMwZan0Mgs3vZBhYXcfYfAKpD7Eo
	 Ei7rxnPIsNFU+PE9mk8xxc/cfSU10f/gsTpw0B7K+rgUAeObzOZ5yMLk/Zhb+jNqlB
	 ht1LNubN28o9ib3jm3cXSSGP8N/CiFBVaM1g1cIzn8YqC7CiaVVv37IdJcGtBJyBnN
	 WkFTz4qmnsDhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919E360B79;
	Thu, 12 Feb 2026 20:05:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 140D11D6
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 018B460B62
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-N-OQ-hPY3V for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 20:05:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34B6E60B46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34B6E60B46
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:05:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 20CBD86C75; Thu, 12 Feb 2026 20:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 20:56:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0981dc05d6dc300966ce1aa7483ad7b763878756
X-Git-Newrev: 9d39f112b0059dda2f6740a7eb2c3ec4f72bb9c5
X-Patchwork-Hint: ignore
Message-Id: <20260212200510.20CBD86C75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-cffi: bump to version 0.2.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d39f112b0059dda2f6740a7eb2c3ec4f72bb9c5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/q66/cffi-lua/releases/tag/v0.2.4

remove upstreamed patch

Update COPYING license hash, after year update in:
https://github.com/q66/cffi-lua/commit/9f2acc9a2a0c8e59dda35c0e11333d1b66296667

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Julien: add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-src-platform.hh-fix-or1k-build.patch      | 39 ----------------------
 package/lua-cffi/lua-cffi.hash                     |  4 +--
 package/lua-cffi/lua-cffi.mk                       |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch b/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
deleted file mode 100644
index 35d023df44..0000000000
--- a/package/lua-cffi/0001-src-platform.hh-fix-or1k-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 2294e61b057215bf089b1d1c482a5dcbcad6b414 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 23 May 2024 17:50:18 +0200
-Subject: [PATCH] src/platform.hh: fix or1k build
-
-Fix the following or1k build failure raised since version 0.2.2 and
-https://github.com/q66/cffi-lua/commit/27755f61e4c625dff951302bade4ad07e3609ca5:
-
-In file included from /home/buildroot/autobuild/run/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/lua.hpp:6,
-                 from ../src/lua.hh:23,
-                 from ../src/parser.hh:4,
-                 from ../src/ffilib.cc:7:
-../src/ffilib.cc: In static member function 'static void ffi_module::setup(lua_State*)':
-../src/ffilib.cc:1616:28: error: expected ')' before 'FFI_ARCH_NAME'
- 1616 |         lua_pushliteral(L, FFI_ARCH_NAME);
-      |                            ^~~~~~~~~~~~~
-
-Fixes: 27755f61e4c625dff951302bade4ad07e3609ca5
- - http://autobuild.buildroot.org/results/4e14753732c5b6fe8ba9ecc4050ffb35f471c428
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/q66/cffi-lua/commit/2294e61b057215bf089b1d1c482a5dcbcad6b414
----
- src/platform.hh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/platform.hh b/src/platform.hh
-index 84e0a89..dab1e76 100644
---- a/src/platform.hh
-+++ b/src/platform.hh
-@@ -192,7 +192,7 @@
- #  endif
- #elif defined(__OR1K__)
- #  define FFI_ARCH FFI_ARCH_OR1K
--#  define FFO_ARCH_NAME "or1k"
-+#  define FFI_ARCH_NAME "or1k"
- #elif defined(__riscv) || defined(__riscv__)
- #  if __riscv_xlen == 32
- #    define FFI_ARCH FFI_ARCH_RV32
diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
index 318f60fefe..c036a702b3 100644
--- a/package/lua-cffi/lua-cffi.hash
+++ b/package/lua-cffi/lua-cffi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1d2577a62a843e5e6db35af1b58300d279b4df58eccef5e823441501f960d388  lua-cffi-0.2.3.tar.gz
-sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
+sha256  89e418e734c3628d4169fe5d237dff3f7769d0c42de5ed8b484a404f42cdc061  lua-cffi-0.2.4.tar.gz
+sha256  38211991cb0a5685f962f231a013d416330c9a33e7797f35f635034349751668  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index f0127b335a..bc1f20c0db 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION = 0.2.3
+LUA_CFFI_VERSION = 0.2.4
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
