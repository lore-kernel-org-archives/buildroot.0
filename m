Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4039CEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 13:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E65A781186;
	Sat,  1 Jul 2023 13:23:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E65A781186
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE7WFFqXiaHp; Sat,  1 Jul 2023 13:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB3680F5C;
	Sat,  1 Jul 2023 13:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB3680F5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 60A9D1BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A294161B
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 13:23:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A294161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSB-nCZqnAXt for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 13:23:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07ACB41602
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 13:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07ACB41602
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8C5C8437B; Sat,  1 Jul 2023 13:23:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 15:23:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce72a74d2163a455c499701b16bc0f4350ad935
X-Git-Newrev: af87ad197caf434936fe239f2718fd17b60fcb8b
X-Patchwork-Hint: ignore
Message-Id: <20230701132347.E8C5C8437B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh2: bump version to 1.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=af87ad197caf434936fe239f2718fd17b60fcb8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://www.libssh2.org/changes.html
https://lists.haxx.se/pipermail/libssh2-devel/2023-May/000114.html

Removed patch which is included in current release:
https://github.com/libssh2/libssh2/commit/b952674f120748174ed2c0fb93e7bd78cf355cac

Updated license hash due to copyright year bump:
https://github.com/libssh2/libssh2/commit/1a186f1ead5ab0beca1fcc12aa693c166ef855b8

Switched tarball to .xz

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Opaque-structs-in-LibreSSL-3-5.patch      | 27 ----------------------
 package/libssh2/libssh2.hash                       |  4 ++--
 package/libssh2/libssh2.mk                         |  3 ++-
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dadc8e0978..5a7e1e32bc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -844,7 +844,6 @@ package/libspatialindex/0001-allow-building-static-libs.patch Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch Upstream
 package/libsquish/0001-Makefile-add-f-option-for-ln-to-remove-existing-dest.patch Upstream
 package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch Upstream
-package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch Upstream
 package/libsvg/0001-fix-expat-static-declaration.patch Upstream
 package/libsvg/0002-Fix-undefined-symbol-png_set_gray_1_2_4_to_8.patch Upstream
 package/libsvgtiny/0001-disable-debug-printfs.patch Upstream
diff --git a/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch b/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
deleted file mode 100644
index 2e1fd8871c..0000000000
--- a/package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 7f55a033e5054529e5e69f06725dd02a573329b6 Mon Sep 17 00:00:00 2001
-From: Charlie Li <git@vishwin.info>
-Date: Wed, 2 Mar 2022 19:50:56 -0500
-Subject: [PATCH] Opaque structs in LibreSSL 3.5
-
-[Retrieved (and backported) from:
-https://github.com/libssh2/libssh2/pull/682/commits/7f55a033e5054529e5e69f06725dd02a573329b6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/openssl.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/openssl.h b/src/openssl.h
-index 3eef02368..c13542481 100644
---- a/src/openssl.h
-+++ b/src/openssl.h
-@@ -94,8 +94,8 @@
- #include <openssl/pem.h>
- #include <openssl/rand.h>
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
--    !defined(LIBRESSL_VERSION_NUMBER)
-+#if (OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)) || \
-+    (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000L)
- # define HAVE_OPAQUE_STRUCTS 1
- #endif
- 
diff --git a/package/libssh2/libssh2.hash b/package/libssh2/libssh2.hash
index 7267e85987..b5bc571f86 100644
--- a/package/libssh2/libssh2.hash
+++ b/package/libssh2/libssh2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51  libssh2-1.10.0.tar.gz
-sha256  859e60d760a3446ecaf777339f1eef98c527aea40714384d24b882a83ffdd23a  COPYING
+sha256  a488a22625296342ddae862de1d59633e6d446eff8417398e06674a49be3d7c2  libssh2-1.11.0.tar.xz
+sha256  fda5e2522c58ba1f31c9f2044747616457466f4aebec16ade4af86e3a16a8e02  COPYING
diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
index cd74784d82..8bedbdffba 100644
--- a/package/libssh2/libssh2.mk
+++ b/package/libssh2/libssh2.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBSSH2_VERSION = 1.10.0
+LIBSSH2_VERSION = 1.11.0
+LIBSSH2_SOURCE= libssh2-$(LIBSSH2_VERSION).tar.xz
 LIBSSH2_SITE = https://www.libssh2.org/download
 LIBSSH2_LICENSE = BSD
 LIBSSH2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
