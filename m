Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF2DC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F22843E5;
	Sat, 17 Sep 2022 14:41:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68F22843E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOPAJOYCCtc5; Sat, 17 Sep 2022 14:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ADE2843DD;
	Sat, 17 Sep 2022 14:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ADE2843DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5F41BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7412660ACA
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7412660ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6M9xXX8zgc4p for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70D9D60C07
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D9D60C07
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5D19C8444F; Sat, 17 Sep 2022 14:40:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:27:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bf567f66fc04ae8d9a70de3a9dd40d039a5e9b4
X-Git-Newrev: ae8a1b8660ecce3db898fb7cbae5cc5b45ae3a61
X-Patchwork-Hint: ignore
Message-Id: <20220917144059.5D19C8444F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cryptography: bump to
 version 38.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae8a1b8660ecce3db898fb7cbae5cc5b45ae3a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...invalid-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 ----------------------
 .../python-cryptography/python-cryptography.hash   |  2 +-
 package/python-cryptography/python-cryptography.mk |  4 +-
 3 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
deleted file mode 100644
index 5d953b8931..0000000000
--- a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 891a06101d7b48c61d0d3174f79e9962b995770e Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 29 Apr 2022 16:06:10 -0600
-Subject: [PATCH] Remove invalid OPENSSL_NO_PSK defined guard (#7146)
-
-These symbols are not conditional on OPENSSL_NO_PSK in ssl.h
-
-SSL_CTX_set_psk_find_session_callback:
-https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L847
-
-SSL_CTX_set_psk_use_session_callback:
-https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L850-L851
-
-As such we can not guard the fallback with defined(OPENSSL_NO_PSK)
-as this will result in redeclaration errors.
-
-Fixes:
-build/temp.linux-sparc64-3.10/_openssl.c:2286:8: error: 'SSL_CTX_set_psk_find_session_callback' redeclared as different kind of symbol
- 2286 | void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
-      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:855:6: note: previous declaration of 'SSL_CTX_set_psk_find_session_callback' was here
-  855 | void SSL_CTX_set_psk_find_session_callback(SSL_CTX *ctx,
-      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-build/temp.linux-sparc64-3.10/_openssl.c:2293:8: error: 'SSL_CTX_set_psk_use_session_callback' redeclared as different kind of symbol
- 2293 | void (*SSL_CTX_set_psk_use_session_callback)(SSL_CTX *,
-      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
-/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:858:6: note: previous declaration of 'SSL_CTX_set_psk_use_session_callback' was here
-  858 | void SSL_CTX_set_psk_use_session_callback(SSL_CTX *ctx,
-      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-891a06101d7b48c61d0d3174f79e9962b995770e]
----
- src/_cffi_src/openssl/ssl.py | 3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/src/_cffi_src/openssl/ssl.py b/src/_cffi_src/openssl/ssl.py
-index 1314b85b0..d036e4f2d 100644
---- a/src/_cffi_src/openssl/ssl.py
-+++ b/src/_cffi_src/openssl/ssl.py
-@@ -785,8 +785,7 @@ void (*SSL_CTX_set_cookie_verify_cb)(SSL_CTX *,
- static const long Cryptography_HAS_SSL_COOKIE = 1;
- #endif
- #if CRYPTOGRAPHY_OPENSSL_LESS_THAN_111 || \
--    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL || \
--    defined(OPENSSL_NO_PSK)
-+    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL
- static const long Cryptography_HAS_PSK_TLSv1_3 = 0;
- void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
-                                            int (*)(
--- 
-2.25.1
-
diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 66ac9d094a..0f6a62164b 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  49692c2a2b7c18f854d20ac5239cd5bbccef033e3efdc7647b3e29fd5970c823  cryptography-37.0.4.tar.gz
+sha256  59f77beef181a9e6643ad2c10b8c6551fc561452287bd3552bec76c86d55b774  cryptography-38.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  43dad2cc752ab721cd9a9f36ece70fb53ab7713551f2d3d8694d8e8c5a06d6e2  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index 28ccc8a65c..c0265f5bfa 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 37.0.4
+PYTHON_CRYPTOGRAPHY_VERSION = 38.0.1
 PYTHON_CRYPTOGRAPHY_SOURCE = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/89/d9/5fcd312d5cce0b4d7ee8b551a0ea99e4ea9db0fdbf6dd455a19042e3370b
+PYTHON_CRYPTOGRAPHY_SITE = https://files.pythonhosted.org/packages/6d/0c/5e67831007ba6cd7e52c4095f053cf45c357739b0a7c46a45ddd50049019
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = setuptools
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
