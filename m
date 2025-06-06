Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0F6C71141
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9561781E8B;
	Thu, 12 Jun 2025 08:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAbE1g0WA_zq; Thu, 12 Jun 2025 08:39:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9651F8202C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9651F8202C;
	Thu, 12 Jun 2025 08:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 618FC1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D680640792
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwtkVmOx5Uij for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E75406C9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E75406C9
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05373811D1; Thu, 12 Jun 2025 08:38:33 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 6 Jun 2025 21:52:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 110cd929322727d31351d2f4b8e5bbe81b000bf3
X-Git-Newrev: e0bd9bafb4371b3405f728b45824ca54babed162
X-Patchwork-Hint: ignore
Message-Id: <20250612083833.05373811D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to 4.0.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0bd9bafb4371b3405f728b45824ca54babed162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://fluentbit.io/announcements/v4.0.3/

Other remarks:
- Dropped 0003-lib-miniz-only-require-a-C-compiler.patch
  as it is upstream. [1]

- Added msgpack-c as a system dependency since this has been
  added to buildroot.

- Added sqlite as system dependency as it can't really be
  disabled otherwise due to an upstream compile bug. [2]

- Sorted the config entries while at it.

[1] https://github.com/fluent/fluent-bit/pull/10315
[2] https://github.com/fluent/fluent-bit/issues/9757

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0003-lib-miniz-only-require-a-C-compiler.patch | 31 ----------------------
 package/fluent-bit/Config.in                       |  6 +++--
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  8 +++---
 4 files changed, 10 insertions(+), 37 deletions(-)

diff --git a/package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch
deleted file mode 100644
index 29c2d9e220..0000000000
--- a/package/fluent-bit/0003-lib-miniz-only-require-a-C-compiler.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From abb3b388aaf7ea72ea1fcad77ead52f15a0cf543 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Tue, 1 Apr 2025 22:56:00 +0200
-Subject: [PATCH] lib: miniz: only require a C compiler
-
-Commit https://github.com/richgel999/miniz/commit/05ab4dc05c9d1e1f951f5849b659e2c7e291a620
-"Add some catch2 tests" dropped that C flag, but should instead only have added a simple
-enable_language call for the tests only.
-
-Upstream: https://github.com/richgel999/miniz/commit/383e551cccf41fc2ce1177712d6a37a85d936642
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- lib/miniz/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
-index 859133ad0..f3d80f80a 100644
---- a/lib/miniz/CMakeLists.txt
-+++ b/lib/miniz/CMakeLists.txt
-@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
- endif()
- 
- if(CMAKE_MINOR_VERSION LESS 12)
--  project(miniz)
-+  project(miniz C)
-   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
- else()
-   project(miniz C)
--- 
-2.43.0
-
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 71488afd73..aeae034b2a 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -4,12 +4,14 @@ config BR2_PACKAGE_FLUENT_BIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_MSGPACK_C
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_NGHTTP2
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENGINES # needed by bundled librdkafka
-	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_ZSTD
 	help
 	  Fast and Lightweight Logs and Metrics processor.
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 37943c6a4f..ec820416ed 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  aa0577ba7251081c8d5398b2a905b5b0585bb657ca13b39a5e12931437516f08  fluent-bit-4.0.2.tar.gz
+sha256  c7d276238d25242467218941842d8cd4df6cfa52cc9379ae5755220cdefd1dc1  fluent-bit-4.0.3.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 23b899e1dd..3e7e04907e 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 4.0.2
+FLUENT_BIT_VERSION = 4.0.3
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
 FLUENT_BIT_CPE_ID_VENDOR = treasuredata
 FLUENT_BIT_CPE_ID_PRODUCT = fluent_bit
-FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml nghttp2 openssl \
-	zstd
+FLUENT_BIT_DEPENDENCIES = c-ares host-bison host-flex libyaml msgpack-c \
+	nghttp2 openssl sqlite zstd
 
 FLUENT_BIT_CMAKE_BACKEND = ninja
 
@@ -22,7 +22,9 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_MSGPACK=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes \
+	-DFLB_PREFER_SYSTEM_LIB_SQLITE=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_ZSTD=Yes
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
