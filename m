Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90437C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C7BF435DB;
	Wed, 10 Jan 2024 09:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C7BF435DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkB8P-Tl2y5s; Wed, 10 Jan 2024 09:50:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD32543637;
	Wed, 10 Jan 2024 09:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD32543637
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 616321BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5BF1613DA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5BF1613DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUGqrig_YeWi for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD0B1613D3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD0B1613D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C8FB852DA; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:46:42 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f67494c4f10273b76c18602985e892b9fd3c669d
X-Git-Newrev: f9bc00b561abaf3129faec8c51bc74d2cb45ac20
X-Patchwork-Hint: ignore
Message-Id: <20240110094924.9C8FB852DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libebml: bump to
 version 1.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9bc00b561abaf3129faec8c51bc74d2cb45ac20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Drop patch (already in version)
- C++14 is required since
  https://github.com/Matroska-Org/libebml/commit/4159caf84c18f64137e6cdb5f15c5e76d0bb0976

https://github.com/Matroska-Org/libebml/blob/release-1.4.4/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit cef841bf7d428a92b5af41b6ea21d7f8ae004526)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...riate-header-files-for-std-numeric_limits.patch | 40 ----------------------
 package/libebml/Config.in                          |  6 ++--
 package/libebml/libebml.hash                       |  2 +-
 package/libebml/libebml.mk                         |  2 +-
 package/libmatroska/Config.in                      |  6 ++--
 5 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch b/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
deleted file mode 100644
index c7e789c02e..0000000000
--- a/package/libebml/0001-include-appropriate-header-files-for-std-numeric_limits.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f0bfd53647961e799a43d918c46cf3b6bff89806 Mon Sep 17 00:00:00 2001
-From: Moritz Bunkus <mo@bunkus.online>
-Date: Sat, 27 Feb 2021 20:36:52 +0100
-Subject: [PATCH] include appropriate header files for std::numeric_limits
-
-Fixes #80.
-
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/Matroska-Org/libebml/commit/f0bfd53647961e799a43d918c46cf3b6bff89806]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                 | 4 ++++
- src/EbmlString.cpp        | 1 +
- src/EbmlUnicodeString.cpp | 1 +
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/EbmlString.cpp b/src/EbmlString.cpp
-index 27e55fd..4c05fcf 100644
---- a/src/EbmlString.cpp
-+++ b/src/EbmlString.cpp
-@@ -34,6 +34,7 @@
-   \author Steve Lhomme     <robux4 @ users.sf.net>
- */
- #include <cassert>
-+#include <limits>
- 
- #include "ebml/EbmlString.h"
- 
-diff --git a/src/EbmlUnicodeString.cpp b/src/EbmlUnicodeString.cpp
-index 496a16a..99fc073 100644
---- a/src/EbmlUnicodeString.cpp
-+++ b/src/EbmlUnicodeString.cpp
-@@ -36,6 +36,7 @@
- */
- 
- #include <cassert>
-+#include <limits>
- 
- #include "ebml/EbmlUnicodeString.h"
- 
diff --git a/package/libebml/Config.in b/package/libebml/Config.in
index a00b894358..b770154af7 100644
--- a/package/libebml/Config.in
+++ b/package/libebml/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_LIBEBML
 	bool "libebml"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  Access library for the EBML (Extensible Binary Meta
 	  Language, a binary derivative of XML) format.
 
 	  http://matroska.org
 
-comment "libebml needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libebml needs a toolchain w/ C++, wchar, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libebml/libebml.hash b/package/libebml/libebml.hash
index 32ca1e3dd3..c83fde32ab 100644
--- a/package/libebml/libebml.hash
+++ b/package/libebml/libebml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41c7237ce05828fb220f62086018b080af4db4bb142f31bec0022c925889b9f2  libebml-1.4.2.tar.xz
+sha256  82dc5f83356cc9340aee76ed7512210b3a4edf5f346bc9c2c7044f55052687a7  libebml-1.4.4.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
index 056cf888e1..c85638c03e 100644
--- a/package/libebml/libebml.mk
+++ b/package/libebml/libebml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEBML_VERSION = 1.4.2
+LIBEBML_VERSION = 1.4.4
 LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.xz
 LIBEBML_SITE = http://dl.matroska.org/downloads/libebml
 LIBEBML_INSTALL_STAGING = YES
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
index ec0e8415d7..b2e4354df5 100644
--- a/package/libmatroska/Config.in
+++ b/package/libmatroska/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBMATROSKA
 	bool "libmatroska"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libebml
 	select BR2_PACKAGE_LIBEBML
 	help
 	  Extensible open standard audio/video container format access
@@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBMATROSKA
 
 	  http://matroska.org
 
-comment "libmatroska needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "libmatroska needs a toolchain w/ C++, wchar, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
