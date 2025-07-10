Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B9C8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFA2383F10;
	Fri, 11 Jul 2025 10:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Io1uSlSSNxJ; Fri, 11 Jul 2025 10:10:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A29483ECE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A29483ECE;
	Fri, 11 Jul 2025 10:10:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AB67D114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C96AB40C9E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D2a_TRWlEzg for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13ADB40C9D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13ADB40C9D
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11E6C862CE; Fri, 11 Jul 2025 10:09:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:24:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1946b22c0aaf2cfbfd559451005f134a183bfb18
X-Git-Newrev: 80a1a567fcc231a7b37ac7f1b206dddd8d9f4f1c
X-Patchwork-Hint: ignore
Message-Id: <20250711100953.11E6C862CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tor: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=80a1a567fcc231a7b37ac7f1b206dddd8d9f4f1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
