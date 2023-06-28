Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F063EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 28 Jun 2023 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CF640871;
	Wed, 28 Jun 2023 15:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95CF640871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVwdnM9Edmhm; Wed, 28 Jun 2023 15:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 710B140093;
	Wed, 28 Jun 2023 15:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710B140093
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5FECA1BF2E5
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4552460BDA
 for <buildroot@lists.busybox.net>; Wed, 28 Jun 2023 15:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4552460BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ThIHfQP_KAZ for <buildroot@lists.busybox.net>;
 Wed, 28 Jun 2023 15:03:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1052E60B9E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1052E60B9E
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 15:03:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2BA14A4C0740
 for <buildroot@buildroot.org>; Wed, 28 Jun 2023 17:03:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55104)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qEWhJ-0006jb-2k
 for buildroot@buildroot.org; Wed, 28 Jun 2023 17:03:09 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Jun 2023 17:03:09 +0200
Message-Id: <20230628150309.544293-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687964590;
 bh=HIJXBVlwIOeaMs3zKWehC7jjKHvz1uVzwBpimqc3x58=;
 h=From:To:Subject:Date:From;
 b=0A68okLiMkjqF7vXo+3XvIeDqZ32dMRQWKu3eR6gKIw1CpgLbjxzzKtnIsWWVHnrV
 i+kX9QgxvgnR8sn36C60O4XHIaAEiYXsDdmV5be9+aI8/zzWD3+rHyWkKzjkVKK9Bs
 jEOXYaLwVSe6TWGunnW3xlvro1X5QN/A9mh5BWb5/+46eMqpKUo1RDHY50wABVGTFq
 KBaaaJx9VJmj87GwD5QkAJ5Oiyk5ThEAMav2Bzxqf152bIuxQ6flCUfOUsNVyrMWBE
 Af+iW4jhc+b69kNCaW9DkaBbi7+mfj+NuOemHeFFb0HKAiuJ/i0FSZAimPh+pnrlsb
 o6jZx9fCV8PTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=0A68okLi
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump version to 1.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.libssh2.org/changes.html
https://lists.haxx.se/pipermail/libssh2-devel/2023-May/000114.html

Removed patch which is included in current release:
https://github.com/libssh2/libssh2/commit/b952674f120748174ed2c0fb93e7bd78cf355cac

Updated license hash due to copyright year bump:
https://github.com/libssh2/libssh2/commit/1a186f1ead5ab0beca1fcc12aa693c166ef855b8

Switched tarball to .xz

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 .../0001-Opaque-structs-in-LibreSSL-3-5.patch | 27 -------------------
 package/libssh2/libssh2.hash                  |  4 +--
 package/libssh2/libssh2.mk                    |  3 ++-
 4 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 package/libssh2/0001-Opaque-structs-in-LibreSSL-3-5.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 6f9c8b90dc..3c38e34eb7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -836,7 +836,6 @@ package/libspatialindex/0001-allow-building-static-libs.patch Upstream
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
