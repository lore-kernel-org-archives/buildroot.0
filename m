Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC3EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D59EA80BCC;
	Sun, 19 Apr 2026 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFs5dh9eVGCg; Sun, 19 Apr 2026 19:44:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0AEF80A68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776627890;
	bh=mOdjcakU0DzEL51C6NCJCP7omCPkJKN+cqaDXWfdVWo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TRUy/Q/z/Q+m2Axh/4h+8IUSPaHKr3cx2kDlF7isPX6jECFt7vJTOI8GYa1vHWqJ5
	 jA5H7df5n89gNCWyX29rWoIlowEMDJb9tOy7LotPgbXtri2dDHXsp6n7xXLsuF+GvE
	 Ye7NxKJXv9WSY5ruTEPUiK20/vqZkuxAbnxdzk0NOt8GhRCVlG45dhIznXk0azLTG4
	 mpGa3CDFVrwh/psr11ruEtIcZm6GoqzipuIHjwQyqywkDy7L2P+77STKBAc4vFs8B2
	 uiloYNAHLrKzVEY98nFTug5bZPrCL8VGtmVoabRwOmlhpDRb5nMN6aR1qBT9mt0lMo
	 w4Xs19zyKDs6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0AEF80A68;
	Sun, 19 Apr 2026 19:44:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39FEE259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCC64100F
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nwSVs5-d7DD3 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA8140F9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA8140F9A
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:44:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7A7B81F7F; Sun, 19 Apr 2026 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:37:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a09a9c08f04bab8f0265852003ed12cdd3527411
X-Git-Newrev: 76786207ef9a3ac05af248dd8a6a2b656d0e7b41
X-Patchwork-Hint: ignore
Message-Id: <20260419194447.C7A7B81F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lftp: bump version to 4.9.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76786207ef9a3ac05af248dd8a6a2b656d0e7b41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/lavv17/lftp/releases/tag/v4.9.3

Removed patches which are included in this release.

Added patch for gnulib to fix linking error which would be introduced
by this bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 -
 ...-with-LibreSSL-following-commit-537f37898.patch | 46 -----------------
 package/lftp/0001-gnulib.patch                     | 59 ++++++++++++++++++++++
 ...-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch | 36 -------------
 package/lftp/lftp.hash                             |  6 +--
 package/lftp/lftp.mk                               |  2 +-
 6 files changed, 63 insertions(+), 88 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f313e9ba10..3b867a994b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -477,8 +477,6 @@ package/leafnode2/0001-cross_makefile.patch lib_patch.Upstream
 package/leveldb/0001-Fix-compilation-with-g-4.8.2.patch lib_patch.Upstream
 package/leveldb/0002-CMake-install-libmemenv.a.patch lib_patch.Upstream
 package/leveldb/0003-CMakeLists.txt-check-for-atomic-library.patch lib_patch.Upstream
-package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch lib_patch.Upstream
-package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch lib_patch.Upstream
 package/libabseil-cpp/0001-force-position-independent-code.patch lib_patch.Upstream
 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch lib_patch.Upstream
 package/libart/0001-art-config-cross.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
deleted file mode 100644
index 8a40351b63..0000000000
--- a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 0276d5c239c41b3a63f738a5dc47fd56ac389cf0 Mon Sep 17 00:00:00 2001
-From: Ganael Laplanche <ganael.laplanche@martymac.org>
-Date: Thu, 20 Aug 2020 12:29:05 +0200
-Subject: [PATCH] Fix build with LibreSSL (following commit 537f37898)
-
-Upstream status: https://github.com/lavv17/lftp/commit/0276d5c239c41b3a63f738a5dc47fd56ac389cf0
-Signed-off-by: Artem Panfilov <artemp@synopsys.com>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/lftp_ssl.cc | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
-index 14a3b9d4..968d3fb2 100644
---- a/src/lftp_ssl.cc
-+++ b/src/lftp_ssl.cc
-@@ -34,7 +34,7 @@
- #include "misc.h"
- #include "network.h"
- #include "buffer.h"
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
- #define X509_STORE_CTX_get_by_subject X509_STORE_get_by_subject
- #endif
- extern "C" {
-@@ -840,7 +840,7 @@ lftp_ssl_openssl_instance::lftp_ssl_openssl_instance()
-    ssl_ctx=SSL_CTX_new();
-    X509_set_default_verify_paths(ssl_ctx->cert);
- #else
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-    SSLeay_add_ssl_algorithms();
- #endif
-    ssl_ctx=SSL_CTX_new(SSLv23_client_method());
-@@ -1080,7 +1080,7 @@ void lftp_ssl_openssl::copy_sid(const lftp_ssl_openssl *o)
- 
- const char *lftp_ssl_openssl::strerror()
- {
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-    SSL_load_error_strings();
- #endif
-    int error=ERR_get_error();
--- 
-2.25.1
-
diff --git a/package/lftp/0001-gnulib.patch b/package/lftp/0001-gnulib.patch
new file mode 100644
index 0000000000..4fecabc0b4
--- /dev/null
+++ b/package/lftp/0001-gnulib.patch
@@ -0,0 +1,59 @@
+From 353a3236d9328349c18ce2e4e984755cb4a76ea7 Mon Sep 17 00:00:00 2001
+From: Jan Palus <jpalus@fastmail.com>
+Date: Sun, 17 Nov 2024 18:58:42 +0100
+Subject: [PATCH] md5-stream, sha*-stream, sm3-stream: Avoid duplicate symbols.
+
+* lib/md5-stream.c (GL_OPENSSL_INLINE): Remove definition, that caused
+the symbols defined in md5.o to be defined in md5-stream.o as well.
+* lib/sha1-stream.c (GL_OPENSSL_INLINE): Likewise.
+* lib/sha256-stream.c (GL_OPENSSL_INLINE): Likewise.
+* lib/sha512-stream.c (GL_OPENSSL_INLINE): Likewise.
+* lib/sm3-stream.c (GL_OPENSSL_INLINE): Likewise.
+
+Copyright-paperwork-exempt: Yes
+
+Upstream: https://gitweb.git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commitdiff;h=353a3236d9328349c18ce2e4e984755cb4a76ea7
+Upstream issue: https://github.com/lavv17/lftp/issues/743
+
+[Bernd: partially backported to 4.9.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ChangeLog           | 10 ++++++++++
+ lib/md5-stream.c    |  3 ---
+ lib/sha1-stream.c   |  3 ---
+ lib/sha256-stream.c |  3 ---
+ lib/sha512-stream.c |  3 ---
+ lib/sm3-stream.c    |  3 ---
+ 6 files changed, 10 insertions(+), 15 deletions(-)
+
+diff --git a/lib/md5-stream.c b/lib/md5-stream.c
+index fdd2bd8b4b..2cbdda6b0f 100644
+--- a/lib/md5-stream.c
++++ b/lib/md5-stream.c
+@@ -22,9 +22,6 @@
+ #include <config.h>
+ 
+ /* Specification.  */
+-#if HAVE_OPENSSL_MD5
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
+-#endif
+ #include "md5.h"
+ 
+ #include <stdlib.h>
+diff --git a/lib/sha1-stream.c b/lib/sha1-stream.c
+index cbdf95ab76..b713e678a6 100644
+--- a/lib/sha1-stream.c
++++ b/lib/sha1-stream.c
+@@ -24,9 +24,6 @@
+ #include <config.h>
+ 
+ /* Specification.  */
+-#if HAVE_OPENSSL_SHA1
+-# define GL_OPENSSL_INLINE _GL_EXTERN_INLINE
+-#endif
+ #include "sha1.h"
+ 
+ #include <stdlib.h>
+-- 
+2.52.0
+
diff --git a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
deleted file mode 100644
index 4251a5e176..0000000000
--- a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3ffa0132987bdde986c82c924bc51b13b37f8b54 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 6 Apr 2022 22:56:21 +0200
-Subject: [PATCH] src/lftp_ssl.c: fix build with libressl >= 2.7.0
-
-X509_OBJECT_get0_X509_CRL is provided by libressl since version 2.7.0
-and
-https://github.com/libressl-portable/openbsd/commit/9866ae34c0af718973475296bd9ef036d3aaa94e
-resulting in the following build failure:
-
-/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
-(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/lavv17/lftp/commit/3ffa0132987bdde986c82c924bc51b13b37f8b54]
----
- src/lftp_ssl.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
-index 26e91e4b..a814543d 100644
---- a/src/lftp_ssl.cc
-+++ b/src/lftp_ssl.cc
-@@ -664,7 +664,7 @@ int gnutls_x509_crt_list_import(gnutls_x509_crt_t *certs, unsigned int* cert_max
- #elif USE_OPENSSL
- //static int lftp_ssl_passwd_callback(char *buf,int size,int rwflag,void *userdata);
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
- // for compatibility with older versions
- X509_OBJECT *X509_OBJECT_new()
- {
diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index e4c3305c03..8a548fba0a 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,7 +1,7 @@
-# From http://lftp.yar.ru/ftp/lftp-4.9.2.md5sum
-md5  b3a272ecb7a2b60e3827776f90ffb2f3  lftp-4.9.2.tar.xz
+# From http://lftp.yar.ru/ftp/lftp-4.9.3.md5sum
+md5  f2e4ffa81b68106a14d354d50635bbf4  lftp-4.9.3.tar.xz
 # Locally calculated after checking gpg signature
-sha256  c517c4f4f9c39bd415d7313088a2b1e313b2d386867fe40b7692b83a20f0670d  lftp-4.9.2.tar.xz
+sha256  96e7199d7935be33cf6b1161e955b2aab40ab77ecdf2a19cea4fc1193f457edc  lftp-4.9.3.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 483ca298cd..50b3f9809f 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.9.2
+LFTP_VERSION = 4.9.3
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
