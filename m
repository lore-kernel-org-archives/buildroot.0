Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A1CAC58E
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A00761698;
	Sat, 13 Sep 2025 13:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCQ_5xj8DtO6; Sat, 13 Sep 2025 13:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4969861777
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4969861777;
	Sat, 13 Sep 2025 13:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF9C312D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0F9361777
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fm9baBKBSLXI for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0EEB61546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0EEB61546
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:42:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB5B784537; Sat, 13 Sep 2025 13:42:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Sep 2025 15:36:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 718b6ff826fbae23c9f3fcd4b899ace22616e976
X-Git-Newrev: 7a6a2ee15165d09c8eb995290944f7519747acf4
X-Patchwork-Hint: ignore
Message-Id: <20250913134234.CB5B784537@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: bump to version 1.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a6a2ee15165d09c8eb995290944f7519747acf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- brings compatibility with protobuf v30.0+
- drop upstreamed patch

Changelog:
https://github.com/USBGuard/usbguard/releases/tag/usbguard-1.1.4
https://github.com/USBGuard/usbguard/releases/tag/usbguard-1.1.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ke-GitHub-Actions-cover-build-with-GCC-13.patch | 114 ---------------------
 package/usbguard/usbguard.hash                     |   4 +-
 package/usbguard/usbguard.mk                       |   2 +-
 3 files changed, 3 insertions(+), 117 deletions(-)

diff --git a/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch b/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch
deleted file mode 100644
index 415b8e1dd1..0000000000
--- a/package/usbguard/0001-Fix-build-for-GCC-13-make-GitHub-Actions-cover-build-with-GCC-13.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 22b1e0897af977cc96af926c730ff948bd120bb5 Mon Sep 17 00:00:00 2001
-From: Sebastian Pipping <sebastian@pipping.org>
-Date: Fri, 31 Mar 2023 09:39:49 +0200
-Subject: [PATCH] Fix build for GCC 13 + make GitHub Actions cover build with
- GCC 13 (#586)
-
-* include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it for
-uint8_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-* docker.yml: Cover openSUSE Tumbleweed with GCC 13+
-
-Based on scripts/docker/build_on_centos_8_2.Dockerfile .
-
----------
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Co-authored-by: Khem Raj <raj.khem@gmail.com>
-Upstream: https://github.com/USBGuard/usbguard/commit/22b1e0897af977cc96af926c730ff948bd120bb5
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- .github/workflows/docker.yml                  |  1 +
- .../build_on_opensuse_tumbleweed.Dockerfile   | 50 +++++++++++++++++++
- src/Library/Base64.cpp                        |  1 -
- src/Library/Base64.hpp                        |  1 +
- 4 files changed, 52 insertions(+), 1 deletion(-)
- create mode 100644 scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
-
-diff --git a/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile b/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
-new file mode 100644
-index 00000000..d0993d8c
---- /dev/null
-+++ b/scripts/docker/build_on_opensuse_tumbleweed.Dockerfile
-@@ -0,0 +1,50 @@
-+##
-+## Copyright (c) 2023 Sebastian Pipping <sebastian@pipping.org>
-+##
-+## This program is free software; you can redistribute it and/or modify
-+## it under the terms of the GNU General Public License as published by
-+## the Free Software Foundation; either version 2 of the License, or
-+## (at your option) any later version.
-+##
-+## This program is distributed in the hope that it will be useful,
-+## but WITHOUT ANY WARRANTY; without even the implied warranty of
-+## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+## GNU General Public License for more details.
-+##
-+## You should have received a copy of the GNU General Public License
-+## along with this program.  If not, see <http://www.gnu.org/licenses/>.
-+
-+FROM opensuse/tumbleweed:latest
-+RUN zypper --non-interactive install dnf rpm-repos-openSUSE-Tumbleweed \
-+        && \
-+    dnf install -y \
-+            asciidoc \
-+            autoconf \
-+            automake \
-+            dbus-1-glib-devel \
-+            diffutils \
-+            file \
-+            gcc-c++ \
-+            git \
-+            libgcrypt-devel \
-+            libqb-devel \
-+            libsodium-devel \
-+            libtool \
-+            libxslt \
-+            make \
-+            polkit-devel \
-+            protobuf-devel
-+ADD usbguard.tar usbguard/
-+ADD catch.tar usbguard/src/ThirdParty/Catch/
-+ADD pegtl.tar usbguard/src/ThirdParty/PEGTL/
-+WORKDIR usbguard
-+RUN git init &>/dev/null && ./autogen.sh
-+RUN ./configure --with-bundled-catch --with-bundled-pegtl || ! cat config.log
-+RUN make dist
-+RUN tar xf usbguard-*.tar.gz
-+RUN mv -v usbguard-*.*.*/ usbguard-release/
-+RUN mkdir usbguard-release/build/
-+WORKDIR usbguard-release/build/
-+RUN ../configure --with-bundled-catch --with-bundled-pegtl || ! cat config.log
-+RUN bash -c 'set -o pipefail; make V=1 "-j$(nproc)" |& tee build.log'
-+RUN ! grep -F 'include file not found' build.log
-diff --git a/src/Library/Base64.cpp b/src/Library/Base64.cpp
-index ddb28dce..0246a134 100644
---- a/src/Library/Base64.cpp
-+++ b/src/Library/Base64.cpp
-@@ -22,7 +22,6 @@
- 
- #include "Base64.hpp"
- #include <stdexcept>
--#include <cstdint>
- 
- namespace usbguard
- {
-diff --git a/src/Library/Base64.hpp b/src/Library/Base64.hpp
-index 0947f214..e0c745cb 100644
---- a/src/Library/Base64.hpp
-+++ b/src/Library/Base64.hpp
-@@ -23,6 +23,7 @@
- #endif
- 
- #include <string>
-+#include <cstdint>
- #include <cstddef>
- 
- namespace usbguard
diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
index 6c10dc9d3e..10eab07f95 100644
--- a/package/usbguard/usbguard.hash
+++ b/package/usbguard/usbguard.hash
@@ -1,5 +1,5 @@
-# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.2/usbguard-1.1.2.tar.gz.sum
-sha256  dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934  usbguard-1.1.2.tar.gz
+# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.4/usbguard-1.1.4.tar.gz.sum
+sha256  7d76b75e779e3c9e6c2fc10e7389dfa34056864c9f0c6eaca722687b7e75893c  usbguard-1.1.4.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 4a5028f509..5f6672d44a 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBGUARD_VERSION = 1.1.2
+USBGUARD_VERSION = 1.1.4
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
