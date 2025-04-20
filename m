Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892EDC369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F3180CE7;
	Sun, 20 Apr 2025 17:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3at6MrLsnCd; Sun, 20 Apr 2025 17:46:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1A980D07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD1A980D07;
	Sun, 20 Apr 2025 17:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6287668
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EE1340002
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEXCcRhyRx5Q for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F59405A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66F59405A3
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BD2C85E2C; Sun, 20 Apr 2025 17:46:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Apr 2025 19:35:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18630db8e822120d0d4b9f37fa7c0d901f55d8e9
X-Git-Newrev: 8181727e23603bc717fd9551ce0bbc97d17231aa
X-Patchwork-Hint: ignore
Message-Id: <20250420174644.5BD2C85E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fluent-bit: bump to 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8181727e23603bc717fd9551ce0bbc97d17231aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

News:
- https://fluentbit.io/announcements/v4.0.0/

FLB_UNICODE_ENCODER was added, and enabled by default in commit [1],
which requires LIBSTDCPP, disable it if BR2_INSTALL_LIBSTDCPP is not set.

Also add two more patches to drop the LIBSTDCPP requirement.

[1] https://github.com/fluent/fluent-bit/commit/3b04755e99fa500e98dcd1318f9b12f6863d31e4

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ly-enable-CXX-support-if-tests-are-requir.patch | 34 ++++++++++++++++++++++
 .../0007-lib-miniz-only-require-a-C-compiler.patch | 27 +++++++++++++++++
 package/fluent-bit/fluent-bit.hash                 |  2 +-
 package/fluent-bit/fluent-bit.mk                   |  7 ++++-
 4 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
new file mode 100644
index 0000000000..f7b282165c
--- /dev/null
+++ b/package/fluent-bit/0006-lib-zstd-only-enable-CXX-support-if-tests-are-requir.patch
@@ -0,0 +1,34 @@
+From b6d898185d441e00acad867c0c80aadf4d7b0d37 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 22:43:30 +0200
+Subject: [PATCH] lib: zstd: only enable CXX support if tests are required
+
+Upstream: https://github.com/facebook/zstd/pull/4357/files
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/zstd-1.5.7/build/cmake/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+index 347d41c0f..70e233df3 100644
+--- a/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
++++ b/lib/zstd-1.5.7/build/cmake/CMakeLists.txt
+@@ -37,7 +37,6 @@ project(zstd
+   VERSION "${ZSTD_FULL_VERSION}"
+   LANGUAGES C   # Main library is in C
+             ASM # And ASM
+-            CXX # Testing contributed code also utilizes CXX
+   )
+ 
+ message(STATUS "ZSTD VERSION: ${zstd_VERSION}")
+@@ -170,6 +169,7 @@ if (ZSTD_BUILD_PROGRAMS)
+ endif ()
+ 
+ if (ZSTD_BUILD_TESTS)
++    enable_language(CXX)
+     enable_testing()
+     if (NOT ZSTD_BUILD_STATIC)
+         message(SEND_ERROR "You need to build static library to build tests")
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
new file mode 100644
index 0000000000..bfd32d6b68
--- /dev/null
+++ b/package/fluent-bit/0007-lib-miniz-only-require-a-C-compiler.patch
@@ -0,0 +1,27 @@
+From 3732cea4bb3dd9b79732da7bfbf60258bc418195 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Tue, 1 Apr 2025 23:01:13 +0200
+Subject: [PATCH] lib: miniz: only require a C compiler
+
+Upstream: https://github.com/richgel999/miniz/pull/338
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ lib/miniz/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/miniz/CMakeLists.txt b/lib/miniz/CMakeLists.txt
+index ce6ade1c0..91012b36a 100644
+--- a/lib/miniz/CMakeLists.txt
++++ b/lib/miniz/CMakeLists.txt
+@@ -7,7 +7,7 @@ if(DEFINED PROJECT_NAME)
+ endif()
+ 
+ if(CMAKE_MINOR_VERSION LESS 12)
+-  project(miniz)
++  project(miniz C)
+   # see issue https://gitlab.kitware.com/cmake/cmake/merge_requests/1799
+ else()
+   project(miniz C)
+-- 
+2.43.0
+
diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
index 9abf13698a..e4394f69d1 100644
--- a/package/fluent-bit/fluent-bit.hash
+++ b/package/fluent-bit/fluent-bit.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f86ecbe208ae152841909a063f28ca250b8a6771c5e43dcb1786ef310f927904  fluent-bit-3.2.10.tar.gz
+sha256  ef9a479c8cc12e01de6682e0cfd21a0a5d335a0ab9be14bbca37211fbf428cad  fluent-bit-4.0.0.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index 276bfd540a..915ec692b3 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUENT_BIT_VERSION = 3.2.10
+FLUENT_BIT_VERSION = 4.0.0
 FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 FLUENT_BIT_LICENSE = Apache-2.0
 FLUENT_BIT_LICENSE_FILES = LICENSE
@@ -23,6 +23,11 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_PREFER_SYSTEM_LIB_CARES=Yes \
 	-DFLB_PREFER_SYSTEM_LIB_NGHTTP2=Yes
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+FLUENT_BIT_CONF_OPTS += \
+	-DFLB_UNICODE_ENCODER=No
+endif
+
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
 FLUENT_BIT_WAMR_ARCH = $(call qstrip,$(BR2_PACKAGE_FLUENT_BIT_WASM_ARCH))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
