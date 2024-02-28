Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD71C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 17:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E857417A4;
	Wed, 28 Feb 2024 17:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uV1qf_OS3ggW; Wed, 28 Feb 2024 17:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41994417A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41994417A8;
	Wed, 28 Feb 2024 17:35:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF5A71BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD65860E5D
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkCh6QUNksyZ for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 17:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBD2A6071E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBD2A6071E
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 17:35:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D54B987C39; Wed, 28 Feb 2024 17:35:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 18:34:48 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: edfc7436427779ed7f2a2095f0d023df56950afc
X-Git-Newrev: 096eec5b39e610a4ccbbbe544d34874db2efb976
X-Patchwork-Hint: ignore
Message-Id: <20240228173549.D54B987C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/tor: Fix build
 with libressl >= 3.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=096eec5b39e610a4ccbbbe544d34874db2efb976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes:
http://autobuild.buildroot.net/results/85c/85cde3bcd12fb5adafb94c85d5fa636e1b5b9068/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[yann.morin.1998@free.fr: fix Upstream tag]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2fbeacf91f985df5834968e7ce95d5c0340b7fab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sl_mgt-define-DISABLE_ENGINES-after-OPENS.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
new file mode 100644
index 0000000000..f8ad803203
--- /dev/null
+++ b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
@@ -0,0 +1,58 @@
+From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Thu, 31 Aug 2023 14:35:52 -0700
+Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
+ OPENSSL_NO_ENGINE
+
+With LibreSSL-3.8.1 these engines are no long available causing a build
+failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
+opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
+of the openssl includes which would define OPENSSL_NO_ENGINE and then
+fails to define DISABLE_ENGINES.
+
+As the define is used in only a single .c file it is best to move it
+there.
+
+Signed-off-by: orbea <orbea@riseup.net>
+Upstream: https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
+ src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
+index 6c01cb6aa8..ca12a82518 100644
+--- a/src/lib/crypt_ops/crypto_openssl_mgt.c
++++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
+@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
+
+ #include <string.h>
+
++#ifdef OPENSSL_NO_ENGINE
++/* Android's OpenSSL seems to have removed all of its Engine support. */
++#define DISABLE_ENGINES
++#endif
++
+ #ifndef NEW_THREAD_API
+ /** A number of preallocated mutexes for use by OpenSSL. */
+ static tor_mutex_t **openssl_mutexes_ = NULL;
+diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
+index 96a37721dd..eac0ec1977 100644
+--- a/src/lib/crypt_ops/crypto_openssl_mgt.h
++++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
+@@ -49,11 +49,6 @@
+ #define OPENSSL_V_SERIES(a,b,c) \
+   OPENSSL_VER((a),(b),(c),0,0)
+
+-#ifdef OPENSSL_NO_ENGINE
+-/* Android's OpenSSL seems to have removed all of its Engine support. */
+-#define DISABLE_ENGINES
+-#endif
+-
+ #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
+ /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
+  * setting up various callbacks.
+--
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
