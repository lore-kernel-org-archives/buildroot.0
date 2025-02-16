Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DE1C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6436B509E6;
	Fri, 28 Feb 2025 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTVJBaC1Ux3O; Fri, 28 Feb 2025 17:19:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37DD050118
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DD050118;
	Fri, 28 Feb 2025 17:19:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D6A5711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBA3742D5E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS2-8zjmHJst for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2BA42D6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B2BA42D6A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1668D7F8BE; Fri, 28 Feb 2025 16:30:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 11:24:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d9b8a2a5f1902c126ebe9856001f993ad4db39d8
X-Git-Newrev: 1040a4b714f530cb96589f35db017fcef5448dc8
X-Patchwork-Hint: ignore
Message-Id: <20250228163041.1668D7F8BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/protozero: bump
 version to 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1040a4b714f530cb96589f35db017fcef5448dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.0
Drop upstream patch.
Updated license hash due to copyright year bump:
https://github.com/mapbox/protozero/commit/e91587f4bb1a0c443c663f4d1fcfd1ace674616f

Bump minimal GCC version to 5. (Switched to C++14 as minimum requirement)

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien: remove patch entry in .checkpackageignore]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...sts.txt-protobuf-is-only-needed-for-tests.patch | 35 ----------------------
 package/protozero/Config.in                        |  2 +-
 package/protozero/protozero.hash                   |  4 +--
 package/protozero/protozero.mk                     |  2 +-
 5 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ed29682bb7..d54bd353b2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -994,7 +994,6 @@ package/proftpd/S50proftpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/prosody/0001-enable-syslog.patch lib_patch.Upstream
 package/prosody/0002-add-pidfile.patch lib_patch.Upstream
 package/prosody/S50prosody Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch lib_patch.Upstream
 package/proxychains-ng/0001-add-configure-check-for-non-POSIX-compliant-getnameinfo-signature.patch lib_patch.Upstream
 package/ptpd/S65ptpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/ptpd2/0001-musl.patch lib_patch.Upstream
diff --git a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch b/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
deleted file mode 100644
index 3033e24aa2..0000000000
--- a/package/protozero/0001-CMakeLists.txt-protobuf-is-only-needed-for-tests.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1c16d3ffccd9e415c6ea3681f23231cd5184043c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 16 Feb 2022 00:11:38 +0100
-Subject: [PATCH] CMakeLists.txt: protobuf is only needed for tests
-
-Don't check for protobuf if tests are disabled. As a side effect, this
-will avoid a build failure if clang-tidy and protobuf are found but
-tests are disabled
-
-Fix #109
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mapbox/protozero/pull/110]
----
- CMakeLists.txt | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b975d49..df2ca15 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -52,7 +52,9 @@ endif()
- #
- #-----------------------------------------------------------------------------
- 
--find_package(Protobuf)
-+if(BUILD_TESTING)
-+    find_package(Protobuf)
-+endif()
- 
- 
- #-----------------------------------------------------------------------------
--- 
-2.34.1
-
diff --git a/package/protozero/Config.in b/package/protozero/Config.in
index e6347e6f7f..b2c253c5a0 100644
--- a/package/protozero/Config.in
+++ b/package/protozero/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PROTOZERO
 	bool "protozero"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	help
 	  Minimalistic protocol buffer decoder and encoder in C++.
 	  Designed for high performance. Suitable for writing zero copy
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index f0b8e39009..217e18a7c9 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
-sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
+sha256  d95ca543fc42bd22b8c4bce1e6d691ce1711eda4b4910f7863449e6517fade6b  protozero-1.8.0.tar.gz
+sha256  254c0e9f18d261bfc55ff277cf12e3c1ca25839d56af17fba65d142396021466  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index a46e37d69b..e5160d3f04 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.7.1
+PROTOZERO_VERSION = 1.8.0
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
