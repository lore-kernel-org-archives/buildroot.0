Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC86C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6F560F7E;
	Fri, 11 Jul 2025 10:22:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kT9aNiqXJzos; Fri, 11 Jul 2025 10:22:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA0D60FE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA0D60FE7;
	Fri, 11 Jul 2025 10:22:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 527541E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F32DE40CDB
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2yoNAYhTwr3 for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC37940E76
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC37940E76
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA4AB86377; Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:39:41 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e57fbecdb4dbbbba044d8a0627f0c935c57fd37a
X-Git-Newrev: d6db027193ccf4c96f785e7b2088385f9c3ded30
X-Patchwork-Hint: ignore
Message-Id: <20250711102104.AA4AB86377@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/tor: bump version
 to 0.4.8.17
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6db027193ccf4c96f785e7b2088385f9c3ded30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Release notes:
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-17/19681

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1e8be117f0cc935bf7082ce156d9799b4bd14668)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...sl_mgt-define-DISABLE_ENGINES-after-OPENS.patch | 58 ----------------------
 package/tor/tor.hash                               |  4 +-
 package/tor/tor.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 61 deletions(-)

diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
deleted file mode 100644
index f8ad803203..0000000000
--- a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
-From: orbea <orbea@riseup.net>
-Date: Thu, 31 Aug 2023 14:35:52 -0700
-Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
- OPENSSL_NO_ENGINE
-
-With LibreSSL-3.8.1 these engines are no long available causing a build
-failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
-opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
-of the openssl includes which would define OPENSSL_NO_ENGINE and then
-fails to define DISABLE_ENGINES.
-
-As the define is used in only a single .c file it is best to move it
-there.
-
-Signed-off-by: orbea <orbea@riseup.net>
-Upstream: https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
- src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
-index 6c01cb6aa8..ca12a82518 100644
---- a/src/lib/crypt_ops/crypto_openssl_mgt.c
-+++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
-@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
-
- #include <string.h>
-
-+#ifdef OPENSSL_NO_ENGINE
-+/* Android's OpenSSL seems to have removed all of its Engine support. */
-+#define DISABLE_ENGINES
-+#endif
-+
- #ifndef NEW_THREAD_API
- /** A number of preallocated mutexes for use by OpenSSL. */
- static tor_mutex_t **openssl_mutexes_ = NULL;
-diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
-index 96a37721dd..eac0ec1977 100644
---- a/src/lib/crypt_ops/crypto_openssl_mgt.h
-+++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
-@@ -49,11 +49,6 @@
- #define OPENSSL_V_SERIES(a,b,c) \
-   OPENSSL_VER((a),(b),(c),0,0)
-
--#ifdef OPENSSL_NO_ENGINE
--/* Android's OpenSSL seems to have removed all of its Engine support. */
--#define DISABLE_ENGINES
--#endif
--
- #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
- /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
-  * setting up various callbacks.
---
-GitLab
-
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 34c7c0f097..55c915ef4d 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.16.tar.gz.sha256sum
-sha256  6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb  tor-0.4.8.16.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
+sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 5f376d136f..399d4b481f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.16
+TOR_VERSION = 0.4.8.17
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
