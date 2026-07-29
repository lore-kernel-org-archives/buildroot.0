Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B03C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEAB280F40;
	Wed, 29 Jul 2026 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBj7lhPv1SgH; Wed, 29 Jul 2026 20:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CFE080F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785355597;
	bh=ngTlqBvcIeShHtNZDXxwZwkzVLua6wSqf5itQ00RC/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lMtBq9aZE6zD/ODzfHoyDXIodVBcubAARia5Da1zuHIC28gNZFdll00u+H13OkEz2
	 od9+vY7IumfBIHew77fdsYNx65iQJ3EJBe26fE7tJAfblbrQ+V8465USya1bmefhZ2
	 y0DpiinPWwvxCqz7DwlNel8nWMz0CmCisIeCJLoceezPPU6sd9ZJkoeuT32sMs6un7
	 YA/lRHksdZHPO29nFDKkji3VRKa5OZ9Lmn02VyH+Vpz2KVd+A7Sbs7f6S5nAvtOTDk
	 ax2NgTqih8x4UIt0p9VovLrd5XVe4w/goayRymCyxzo4jHD0z+Tipgt3DLFLQxfCX1
	 e7g4odpz0k3mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CFE080F34;
	Wed, 29 Jul 2026 20:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9362726E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7998E40623
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sz_YvW0pY_dn for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948AB40659
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948AB40659
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:06:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 538268B500; Wed, 29 Jul 2026 20:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Jul 2026 21:58:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e237d22179f7f534900e0fd11fc74942d12a6b2
X-Git-Newrev: a19e6cfe63064fb827b6234142374accd0317846
X-Patchwork-Hint: ignore
Message-Id: <20260729200548.538268B500@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/yaml-cpp: bump version to 0.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a19e6cfe63064fb827b6234142374accd0317846
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/jbeder/yaml-cpp/releases/tag/yaml-cpp-0.9.0

Drop upstream patches.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...1-emitterutils-Explicitly-include-cstdint.patch | 42 ----------------------
 ...policy-range-to-avoid-deprecation-warning.patch | 26 --------------
 package/yaml-cpp/yaml-cpp.hash                     |  2 +-
 package/yaml-cpp/yaml-cpp.mk                       |  4 +--
 4 files changed, 3 insertions(+), 71 deletions(-)

diff --git a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch b/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
deleted file mode 100644
index e3dc308a2f..0000000000
--- a/package/yaml-cpp/0001-emitterutils-Explicitly-include-cstdint.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7b469b4220f96fb3d036cf68cd7bd30bd39e61d2 Mon Sep 17 00:00:00 2001
-From: Christopher Fore <csfore@posteo.net>
-Date: Wed, 14 Aug 2024 21:02:32 -0400
-Subject: [PATCH] emitterutils: Explicitly include <cstdint>
-
-GCC 15 will no longer include it by default, resulting in build
-failures in projects that do not explicitly include it.
-
-Error:
-src/emitterutils.cpp:221:11: error: 'uint16_t' was not declared in this scope
-  221 | std::pair<uint16_t, uint16_t> EncodeUTF16SurrogatePair(int codePoint) {
-      |           ^~~~~~~~
-src/emitterutils.cpp:13:1: note: 'uint16_t' is defined in header '<cstdint>';
-this is probably fixable by adding '#include <cstdint>'
-   12 | #include "yaml-cpp/null.h"
-  +++ |+#include <cstdint>
-   13 | #include "yaml-cpp/ostream_wrapper.h"
-
-Tests pass.
-
-Closes: #1307
-See-also: https://gcc.gnu.org/pipermail/gcc-cvs/2024-August/407124.html
-See-also: https://bugs.gentoo.org/937412
-Signed-off-by: Christopher Fore <csfore@posteo.net>
-
-Upstream: https://github.com/jbeder/yaml-cpp/commit/7b469b4220f96fb3d036cf68cd7bd30bd39e61d2
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/emitterutils.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/emitterutils.cpp b/src/emitterutils.cpp
-index fc41011a5..f801b1d0c 100644
---- a/src/emitterutils.cpp
-+++ b/src/emitterutils.cpp
-@@ -1,4 +1,5 @@
- #include <algorithm>
-+#include <cstdint>
- #include <iomanip>
- #include <sstream>
- 
diff --git a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch b/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
deleted file mode 100644
index 6ab3df96cf..0000000000
--- a/package/yaml-cpp/0002-Specify-CMake-policy-range-to-avoid-deprecation-warning.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c2680200486572baf8221ba052ef50b58ecd816e Mon Sep 17 00:00:00 2001
-From: Craig Scott <craig.scott@crascit.com>
-Date: Thu, 17 Aug 2023 08:54:05 +1000
-Subject: [PATCH] Specify CMake policy range to avoid deprecation warning
- (#1211)
-
-Upstream: https://github.com/jbeder/yaml-cpp/commit/c2680200486572baf8221ba052ef50b58ecd816e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 46dc18059..1ae92e2b7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,6 @@
--# 3.5 is actually available almost everywhere, but this a good minimum
--cmake_minimum_required(VERSION 3.4)
-+# 3.5 is actually available almost everywhere, but this a good minimum.
-+# 3.14 as the upper policy limit avoids CMake deprecation warnings.
-+cmake_minimum_required(VERSION 3.4...3.14)
- 
- # enable MSVC_RUNTIME_LIBRARY target property
- # see https://cmake.org/cmake/help/latest/policy/CMP0091.html
diff --git a/package/yaml-cpp/yaml-cpp.hash b/package/yaml-cpp/yaml-cpp.hash
index 92bf65d2f7..321f932df4 100644
--- a/package/yaml-cpp/yaml-cpp.hash
+++ b/package/yaml-cpp/yaml-cpp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16  yaml-cpp-0.8.0.tar.gz
+sha256  25cb043240f828a8c51beb830569634bc7ac603978e0f69d6b63558dadefd49a  yaml-cpp-0.9.0.tar.gz
 sha256  aa6fcc27be034e41e21dd832f9175bfe694a48491d9e14ff0fa278e19ad14f1b  LICENSE
diff --git a/package/yaml-cpp/yaml-cpp.mk b/package/yaml-cpp/yaml-cpp.mk
index c259f1e531..b963dba094 100644
--- a/package/yaml-cpp/yaml-cpp.mk
+++ b/package/yaml-cpp/yaml-cpp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-YAML_CPP_VERSION = 0.8.0
-YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,$(YAML_CPP_VERSION))
+YAML_CPP_VERSION = 0.9.0
+YAML_CPP_SITE = $(call github,jbeder,yaml-cpp,yaml-cpp-$(YAML_CPP_VERSION))
 YAML_CPP_INSTALL_STAGING = YES
 YAML_CPP_LICENSE = MIT
 YAML_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
