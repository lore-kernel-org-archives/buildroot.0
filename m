Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CB6C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E519436E5;
	Wed, 10 Jan 2024 20:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E519436E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14nQzvE-ILM5; Wed, 10 Jan 2024 20:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4259436D7;
	Wed, 10 Jan 2024 20:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4259436D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 704981BF95D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F187613FF
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F187613FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w8e7Fs0MPrtC for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F16061555
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F16061555
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1853F85D63; Wed, 10 Jan 2024 20:22:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:12:31 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 530183a915bb7acdc07e05b3fc41c88314021cbb
X-Git-Newrev: fda35e7115776cb3844c5f2e89c3f8cbc81fbad0
X-Patchwork-Hint: ignore
Message-Id: <20240110202204.1853F85D63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libssh2: bump
 version to 1.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=fda35e7115776cb3844c5f2e89c3f8cbc81fbad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit af87ad197caf434936fe239f2718fd17b60fcb8b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Opaque-structs-in-LibreSSL-3-5.patch      | 27 ----------------------
 package/libssh2/libssh2.hash                       |  4 ++--
 package/libssh2/libssh2.mk                         |  3 ++-
 3 files changed, 4 insertions(+), 30 deletions(-)

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
