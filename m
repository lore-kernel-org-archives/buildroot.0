Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E34CCD1BE
	for <buildroot@archiver.kernel.org>; Thu, 23 Oct 2025 10:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C04C982A2E;
	Thu, 23 Oct 2025 10:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmChiemb3iyF; Thu, 23 Oct 2025 10:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D9982E22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D9982E22;
	Thu, 23 Oct 2025 10:44:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2F7443F
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 10:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B92EC82E22;
 Thu, 23 Oct 2025 10:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7yRnQw4O5D14; Thu, 23 Oct 2025 10:44:21 +0000 (UTC)
X-Greylist: delayed 301 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 23 Oct 2025 10:44:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1425782A2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1425782A2E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=216.184.2.64;
 helo=mx1a.swcp.com; envelope-from=hudson@swcp.com; receiver=<UNKNOWN> 
Received: from mx1a.swcp.com (mx1a.swcp.com [216.184.2.64])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1425782A2E
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 10:44:20 +0000 (UTC)
Received: from ame4.swcp.com (ame4.swcp.com [216.184.2.31])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 59NAdJBn021909
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 04:39:19 -0600
Received-SPF: pass (ame4.swcp.com: domain of hudson@swcp.com designates
 216.184.2.83 as permitted sender) receiver=ame4.swcp.com;
 client-ip=216.184.2.83; helo=hachi.swcp.com; envelope-from=hudson@swcp.com;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
DKIM-Filter: OpenDKIM Filter v2.10.3 ame4.swcp.com 59NAdHHA057756
Received: from hachi.swcp.com (hachi.swcp.com [216.184.2.83])
 by ame4.swcp.com (8.18.1/8.18.1) with ESMTPS id 59NAdHHA057756
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 04:39:18 -0600 (MDT)
 (envelope-from hudson@swcp.com)
Received: from hachi.swcp.com (localhost [127.0.0.1])
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Debian-2+deb12u2) with ESMTP id
 59NAdHRV3521267
 for <buildroot@buildroot.org>; Thu, 23 Oct 2025 04:39:17 -0600
Received: (from hudson@localhost)
 by hachi.swcp.com (8.17.1.9/8.17.1.9/Submit) id 59NAdHZU3521266
 for buildroot@buildroot.org; Thu, 23 Oct 2025 04:39:17 -0600
Date: Thu, 23 Oct 2025 04:39:17 -0600
To: buildroot@buildroot.org
Message-ID: <aPoF1TdyuQ9KYqrL@hachi.swcp.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Scanned-By: MIMEDefang 2.86
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4
 (ame4.swcp.com [216.184.2.127]); Thu, 23 Oct 2025 04:39:18 -0600 (MDT)
X-Virus-Scanned: clamav-milter 1.4.1 at ame4
X-Virus-Status: Clean
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=trmm.net
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: bump version to
 4.3.7
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
From: Trammell Hudson via buildroot <buildroot@buildroot.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop all the patches (already in version).  Works on Pi 4b and 0W.

https://github.com/mikebrady/shairport-sync/releases/tag/4.3.7

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 ...e.ac-find-sndfile-through-pkg-config.patch |  45 --------
 ...0002-mbedtls-add-support-to-mbedtls3.patch | 105 ------------------
 package/shairport-sync/shairport-sync.hash    |   2 +-
 package/shairport-sync/shairport-sync.mk      |   2 +-
 4 files changed, 2 insertions(+), 152 deletions(-)
 delete mode 100644 package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
 delete mode 100644 package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch

diff --git a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch b/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
deleted file mode 100644
index b593703a2a..0000000000
--- a/package/shairport-sync/0001-configure.ac-find-sndfile-through-pkg-config.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 900b1827c55cc6020b3242640075174c2e6b12a5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 4 Aug 2021 22:16:40 +0200
-Subject: [PATCH] configure.ac: find sndfile through pkg-config
-
-Find sndfile through pkg-config to retrieve sndfile dependencies such as
-flac and avoid the following static build failure:
-
-/tmp/instance-3/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/10.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: /tmp/instance-3/output-1/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libsndfile.a(libsndfile_la-flac.o): in function `flac_byterate':
-flac.c:(.text+0xfc): undefined reference to `FLAC__StreamDecoderErrorStatusString'
-
-Fixes:
- - http://autobuild.buildroot.org/results/92ed30a6855ca11800b779718822bcba4a69c9a3
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/mikebrady/shairport-sync/pull/1263
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f77087c5..9b982c51 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -303,7 +303,14 @@
- AC_ARG_WITH(convolution, [AS_HELP_STRING([--with-convolution],[choose audio DSP convolution support])])
- if test "x$with_convolution" = "xyes" ; then
-   AC_DEFINE([CONFIG_CONVOLUTION], 1, [Include audio DSP convolution support.])
--  AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
-+  if  test "x${with_pkg_config}" = xyes ; then
-+    PKG_CHECK_MODULES(
-+      [sndfile], [sndfile],
-+      [CFLAGS="${sndfile_CFLAGS} ${CFLAGS}"
-+      LIBS="${sndfile_LIBS} ${LIBS}"], AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
-+  else
-+    AC_CHECK_LIB([sndfile], [sf_open], , AC_MSG_ERROR(Convolution support requires the sndfile library -- libsndfile1-dev suggested!))
-+  fi
- fi
- AM_CONDITIONAL([USE_CONVOLUTION], [test "x$with_convolution" = "xyes"])
- 
--- 
-2.30.2
-
diff --git a/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch b/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
deleted file mode 100644
index e0e8ea53de..0000000000
--- a/package/shairport-sync/0002-mbedtls-add-support-to-mbedtls3.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From d73b585c6f6d9136ae7a04243a54d734fa57d779 Mon Sep 17 00:00:00 2001
-From: Seo Suchan <tjtncks@gmail.com>
-Date: Thu, 9 May 2024 19:10:59 +0900
-Subject: [PATCH] mbedtls: add support to mbedtls3
-
-Signed-off-by: Seo Suchan <tjtncks@gmail.com>
-Upstream: https://github.com/mikebrady/shairport-sync/commit/d73b585c6f6d9136ae7a04243a54d734fa57d779
-[thomas: backport the line numbers]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- common.c | 30 ++++++++++++++++++++++++++----
- player.c |  1 -
- player.h |  1 -
- 3 files changed, 26 insertions(+), 6 deletions(-)
-
-diff --git a/common.c b/common.c
-index 4dc75bc7f..0e2a07243 100644
---- a/common.c
-+++ b/common.c
-@@ -77,6 +77,12 @@
- #include <mbedtls/md.h>
- #include <mbedtls/version.h>
- #include <mbedtls/x509.h>
-+
-+#if MBEDTLS_VERSION_MAJOR == 3
-+#define MBEDTLS_PRIVATE_V3_ONLY(_q) MBEDTLS_PRIVATE(_q)
-+#else
-+#define MBEDTLS_PRIVATE_V3_ONLY(_q) _q
-+#endif
- #endif
- 
- #ifdef CONFIG_LIBDAEMON
-@@ -691,8 +697,14 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
- 
-   mbedtls_pk_init(&pkctx);
- 
-+#if MBEDTLS_VERSION_MAJOR == 3
-   rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key),
-+                            NULL, 0, mbedtls_ctr_drbg_random, &ctr_drbg);
-+#else
-+  rc = mbedtls_pk_parse_key(&pkctx, (unsigned char *)super_secret_key, sizeof(super_secret_key), 
-                             NULL, 0);
-+
-+#endif
-   if (rc != 0)
-     debug(1, "Error %d reading the private key.", rc);
- 
-@@ -701,19 +713,29 @@ uint8_t *rsa_apply(uint8_t *input, int inlen, int *outlen, int mode) {
- 
-   switch (mode) {
-   case RSA_MODE_AUTH:
--    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);
--    outbuf = malloc(trsa->len);
-+    mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V15, MBEDTLS_MD_NONE);    
-+    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
-+#if MBEDTLS_VERSION_MAJOR == 3
-+    rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
-+                                   inlen, input, outbuf);
-+#else
-     rc = mbedtls_rsa_pkcs1_encrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
-                                    inlen, input, outbuf);
-+#endif
-     if (rc != 0)
-       debug(1, "mbedtls_pk_encrypt error %d.", rc);
--    *outlen = trsa->len;
-+    *outlen = trsa->MBEDTLS_PRIVATE_V3_ONLY(len);
-     break;
-   case RSA_MODE_KEY:
-     mbedtls_rsa_set_padding(trsa, MBEDTLS_RSA_PKCS_V21, MBEDTLS_MD_SHA1);
--    outbuf = malloc(trsa->len);
-+    outbuf = malloc(trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
-+#if MBEDTLS_VERSION_MAJOR == 3
-+    rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg,
-+                                   &olen, input, outbuf, trsa->MBEDTLS_PRIVATE_V3_ONLY(len));
-+#else
-     rc = mbedtls_rsa_pkcs1_decrypt(trsa, mbedtls_ctr_drbg_random, &ctr_drbg, MBEDTLS_RSA_PRIVATE,
-                                    &olen, input, outbuf, trsa->len);
-+#endif
-     if (rc != 0)
-       debug(1, "mbedtls_pk_decrypt error %d.", rc);
-     *outlen = olen;
-diff --git a/player.c b/player.c
-index 8c1752722..d023d269c 100644
---- a/player.c
-+++ b/player.c
-@@ -47,7 +47,6 @@
- 
- #ifdef CONFIG_MBEDTLS
- #include <mbedtls/aes.h>
--#include <mbedtls/havege.h>
- #endif
- 
- #ifdef CONFIG_POLARSSL
-diff --git a/player.h b/player.h
-index 11435bf91..b35eb7652 100644
---- a/player.h
-+++ b/player.h
-@@ -9,7 +9,6 @@
- 
- #ifdef CONFIG_MBEDTLS
- #include <mbedtls/aes.h>
--#include <mbedtls/havege.h>
- #endif
- 
- #ifdef CONFIG_POLARSSL
diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index 331866a379..dc7c7eee5b 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17990cb2620551caa07a1c3b371889e55803071eaada04e958c356547a7e1795  shairport-sync-3.3.9.tar.gz
+sha256  a1242d100b61fe1fffbbf706e919ed51d6a341c9fb8293fb42046e32ae2b3338  shairport-sync-4.3.7.tar.gz
 sha256  1daaa904985807b7f9f2fa91f6b19f3faadf8df4e813f7451a691f89a6965e3f  LICENSES
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 5d01ab042e..493eefbd6f 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 3.3.9
+SHAIRPORT_SYNC_VERSION = 4.3.7
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
