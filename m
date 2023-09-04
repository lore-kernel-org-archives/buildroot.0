Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF92C83F2C
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 03:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78A62408FA;
	Mon,  4 Sep 2023 03:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78A62408FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnTqXqJolTvN; Mon,  4 Sep 2023 03:36:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6243408FE;
	Mon,  4 Sep 2023 03:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6243408FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6FDBB1BF422
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 03:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CBE60FDD
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 03:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CBE60FDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ok6v8Q4d9qei for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 03:36:46 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8EED260FD2
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 03:36:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EED260FD2
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-573ac2fa37aso656192eaf.3
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 20:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693798605; x=1694403405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIdd46lXtd76ipEW5CGa9nQt3SOilbWFdyjvsX0w8M0=;
 b=EQQi4tww/pQEOA/WODecVhQonMiC0vY/cNePNMZBwybprDe/QvfZDnlZuhYEOB6c3m
 19WmqF2tvnBF1szqvDSvQSpV7NCWPqOzobn4+D3j2o9iH+W6h9qwmsaWTdqmg4wuIQRO
 cp5yKNabr/kqI6wQ+o3wYltjivh1kReuvkigtk5JhHn/uGtP3khix30ni5z+dV+fqDML
 t4L4XTlqg2h+s9iFJYR2SRbGtXl0658qYjBvsy2wk1J7sUHicwRXsE5bxX0ec17SpTj+
 KB5D1Suf3CPziPIpSgrcQe+OhAw4tBcYmOW/nW4XpnlEJLZ0ykJZrqTlD3Fy8DUcYvR+
 xrBg==
X-Gm-Message-State: AOJu0Yw+bRuWx6kuiw8Gs1gHi5HhjxTgp27FnMgbPx3H2pvgA4ibwHwj
 zUmQ8cqeub2G12gRo6+XInSJ2hrXrO49PGvQ
X-Google-Smtp-Source: AGHT+IEngqsp+2+coxu2Ak5S+eK+6eS2/549YxH91Cfv+plzGeQrBFzGdkla2Dc5/HfzhPSYLXBIGQ==
X-Received: by 2002:a05:6358:c12:b0:13a:a094:737d with SMTP id
 f18-20020a0563580c1200b0013aa094737dmr10478663rwj.18.1693798604740; 
 Sun, 03 Sep 2023 20:36:44 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a63714f000000b0056c24c2e23dsm6514946pgn.25.2023.09.03.20.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 20:36:43 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Mon,  4 Sep 2023 13:36:32 +1000
Message-Id: <20230904033632.817444-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693798605; x=1694403405; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NIdd46lXtd76ipEW5CGa9nQt3SOilbWFdyjvsX0w8M0=;
 b=LouBbObcG4VpPBROoRE3vJv7rNKx+RYJO6HKgyIGMLumVZKhbD/L7fLt72Ezx4IC4E
 36GK1tqtc0a7vbtPi2nXAdT7ps3VfzEGYI0uxH/jWQ1gTwaFcDSDifZ0IRb2b1M9auOc
 s93gB0SP15TSwVKooj8xcHHznQsvGB+KNErxA7cWgJNlJtMq6leS2uO8q37LzqkM2vuv
 U+ZtsFimMi6G220h2vuQt3tr/EJLhHwfQ8f3mnkpUH2PLSPlhkJyhrD5sQtuFHjy9lD5
 /djSKRHOGKeXgFqeYCn1dWd/UzRkKuUi9lRh4upiIbdNwHLGNbuuAUkPu91UM5yH7NmN
 EoXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LouBbObc
Subject: [Buildroot] [PATCH v4] package/libspdm: new package
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
This uses the 3.0 release with 4 patches on top. The first 3 patches are
accepted upstream and the 4th patch has been submitted.

v4:
 - Fixup alphabetical ordering
 - Add Upstream tags
 - Fixup FAMILY typo
 - Remove unsupported architectures
 - Fixup install steps
v3:
 - Drop the libcrypto changes
 - Fixes and cleanups based on review feedback


 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-x509-Remove-internal-OpenSSL-crypto.patch | 44 ++++++++++
 ...lib_openssl-ecd-Allow-disabling-code.patch | 56 +++++++++++++
 ...-ec-Remove-internal-OpenSSL-crypto-i.patch | 82 +++++++++++++++++++
 ...llow-disabling-EDDSA-support-from-co.patch | 31 +++++++
 package/libspdm/Config.in                     | 24 ++++++
 package/libspdm/libspdm.hash                  |  3 +
 package/libspdm/libspdm.mk                    | 47 +++++++++++
 9 files changed, 289 insertions(+)
 create mode 100644 package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
 create mode 100644 package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
 create mode 100644 package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
 create mode 100644 package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
 create mode 100644 package/libspdm/Config.in
 create mode 100644 package/libspdm/libspdm.hash
 create mode 100644 package/libspdm/libspdm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..fd37dab7a7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -121,6 +121,7 @@ N:	Alistair Francis <alistair@alistair23.me>
 F:	board/sifive/
 F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
+F:	package/libspdm/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..435ce74ca7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1503,6 +1503,7 @@ menu "Crypto"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
 	source "package/libsodium/Config.in"
+	source "package/libspdm/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
 	source "package/libtomcrypt/Config.in"
diff --git a/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
new file mode 100644
index 0000000000..d5d233b7ab
--- /dev/null
+++ b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
@@ -0,0 +1,44 @@
+From 7db883cdb3369cfaf9f0890b0eda503f47a5ffa3 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 11 Aug 2023 16:26:53 -0400
+Subject: [PATCH] cryptlib_openssl: x509: Remove internal OpenSSL crypto
+ include
+
+The OpenSSL source code describes the crypto include as:
+"Internal EC functions for other submodules: not for application use"
+ - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
+
+Using the internal APIS makes it difficult to use libspdm as a library
+with other packages. So let's remove the uses of the internal API and
+instead use the public API.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream: https://github.com/DMTF/libspdm/commit/7db883cdb3369cfaf9f0890b0eda503f47a5ffa3
+---
+ os_stub/cryptlib_openssl/pk/x509.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/os_stub/cryptlib_openssl/pk/x509.c b/os_stub/cryptlib_openssl/pk/x509.c
+index c067f3d0ca..1a2736132b 100644
+--- a/os_stub/cryptlib_openssl/pk/x509.c
++++ b/os_stub/cryptlib_openssl/pk/x509.c
+@@ -17,7 +17,6 @@
+ #include <openssl/bn.h>
+ #include <openssl/pem.h>
+ #include <openssl/bio.h>
+-#include <crypto/x509.h>
+ 
+ #if LIBSPDM_CERT_PARSE_SUPPORT
+ 
+@@ -2318,7 +2317,7 @@ bool libspdm_set_attribute_for_req(X509_REQ *req, uint8_t *req_info, size_t req_
+     /*get subject name from req_info and set it to CSR*/
+     x509_req_info = d2i_X509_REQ_INFO(NULL, (const unsigned char **)(&req_info), req_info_len);
+     if (x509_req_info) {
+-        X509_REQ_set_subject_name(req, x509_req_info->subject);
++        X509_REQ_set_subject_name(req, X509_REQ_get_subject_name((X509_REQ *)x509_req_info));
+         X509_REQ_INFO_free(x509_req_info);
+     } else {
+         return false;
+-- 
+2.40.1
+
diff --git a/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch b/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
new file mode 100644
index 0000000000..0ab347b3e0
--- /dev/null
+++ b/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
@@ -0,0 +1,56 @@
+From e87687d72688e980b929920b7d77dca26fff169e Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 21 Aug 2023 14:00:46 -0400
+Subject: [PATCH] cryptlib_openssl: ecd: Allow disabling code
+
+The OpenSSL source code describes the crypto include as:
+"Internal EC functions for other submodules: not for application use"
+ - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
+
+Using the internal APIS makes it difficult to use libspdm as a library
+with other packages. So let's remove the uses of the internal API and
+instead use the public API.
+
+The current ECD code uses internal APIs, making it unsuitable for use in
+production code or libraries.
+
+The supported way to do this is via OSSL params, either with
+EVP_PKEY_fromdata() [1] or using EVP_PKEY_set_octet_string_param().
+
+Unfortunately this isn't supported in OpenSSL and ed25519_set_params()
+and ed448_set_params() will always return 1, indicating no support.
+
+As there doesn't appear to be a supported method in OpenSSL to set the
+public and private keys, let's instead allow users to disable this
+support so the library can be used with the regular OpenSSL libraries.
+
+https://www.openssl.org/docs/man3.0/man3/EVP_PKEY_fromdata.html
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream: https://github.com/DMTF/libspdm/commit/e87687d72688e980b929920b7d77dca26fff169e
+---
+ os_stub/cryptlib_openssl/pk/ecd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/os_stub/cryptlib_openssl/pk/ecd.c b/os_stub/cryptlib_openssl/pk/ecd.c
+index d7cc156d86..23dbd0390b 100644
+--- a/os_stub/cryptlib_openssl/pk/ecd.c
++++ b/os_stub/cryptlib_openssl/pk/ecd.c
+@@ -12,6 +12,9 @@
+  **/
+ 
+ #include "internal_crypt_lib.h"
++
++#if (LIBSPDM_EDDSA_ED25519_SUPPORT) || (LIBSPDM_EDDSA_ED448_SUPPORT)
++
+ #include <openssl/evp.h>
+ #include <crypto/evp.h>
+ 
+@@ -471,3 +474,4 @@ bool libspdm_eddsa_verify(const void *ecd_context, size_t hash_nid,
+     EVP_MD_CTX_free(ctx);
+     return true;
+ }
++#endif /* (LIBSPDM_EDDSA_ED25519_SUPPORT) || (LIBSPDM_EDDSA_ED448_SUPPORT) */
+-- 
+2.40.1
+
diff --git a/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch b/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
new file mode 100644
index 0000000000..aacda14789
--- /dev/null
+++ b/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
@@ -0,0 +1,82 @@
+From 567b1c8ea731fe42650d43ede50a105b772dc7aa Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 11 Aug 2023 16:24:23 -0400
+Subject: [PATCH] cryptlib_openssl: ec: Remove internal OpenSSL crypto include
+
+The OpenSSL source code describes the crypto include as:
+"Internal EC functions for other submodules: not for application use"
+ - https://github.com/openssl/openssl/blob/master/include/crypto/ec.h
+
+Using the internal APIS makes it difficult to use libspdm as a library
+with other packages. So let's remove the uses of the internal API and
+instead use the public API.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream: https://github.com/DMTF/libspdm/commit/567b1c8ea731fe42650d43ede50a105b772dc7aa
+---
+ os_stub/cryptlib_openssl/pk/ec.c | 26 ++++++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/os_stub/cryptlib_openssl/pk/ec.c b/os_stub/cryptlib_openssl/pk/ec.c
+index 7dd9a8b0f8..09df0b9a25 100644
+--- a/os_stub/cryptlib_openssl/pk/ec.c
++++ b/os_stub/cryptlib_openssl/pk/ec.c
+@@ -15,7 +15,6 @@
+ #include <openssl/bn.h>
+ #include <openssl/ec.h>
+ #include <openssl/objects.h>
+-#include <crypto/ec.h>
+ 
+ /**
+  * Allocates and Initializes one Elliptic Curve context for subsequent use
+@@ -854,7 +853,7 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
+                                            uint8_t* random, size_t random_len)
+ {
+     BN_CTX *ctx = NULL;
+-    BIGNUM *k = NULL, *r = NULL, *X = NULL;
++    BIGNUM *k = NULL, *r = NULL, *X = NULL, *e = NULL;
+     const BIGNUM *order;
+     EC_POINT *tmp_point = NULL;
+     const EC_GROUP *group;
+@@ -901,6 +900,11 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
+         goto err;
+     }
+ 
++    e = BN_CTX_get(ctx);
++    if (e == NULL) {
++        return 0;
++    }
++
+     /*random number*/
+     k = BN_bin2bn(random, random_len, NULL);
+ 
+@@ -915,10 +919,24 @@ static int libspdm_ecdsa_sign_setup_random(EC_KEY *eckey, BIGNUM **kinvp, BIGNUM
+         goto err;
+     }
+ 
+-    /* compute the inverse of k */
+-    if (!ossl_ec_group_do_inverse_ord(group, k, k, ctx)) {
++    /*
++     * compute the inverse of k
++     * Based on ossl_ec_group_do_inverse_ord() from OpenSSL
++     */
++    BN_CTX_start(ctx);
++    if (!BN_set_word(e, 2)) {
++        BN_CTX_end(ctx);
++        goto err;
++    }
++    if (!BN_sub(e, order, e)) {
++        BN_CTX_end(ctx);
++        goto err;
++    }
++    if (!BN_mod_exp_mont(k, k, e, order, ctx, EC_GROUP_get_mont_data(group))) {
++        BN_CTX_end(ctx);
+         goto err;
+     }
++    BN_CTX_end(ctx);
+ 
+     /* clear old values if necessary */
+     BN_clear_free(*rp);
+-- 
+2.40.1
+
diff --git a/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch b/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
new file mode 100644
index 0000000000..fe616490f7
--- /dev/null
+++ b/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
@@ -0,0 +1,31 @@
+From 97611ce8279341205463ace6a5f2ff93c52fc417 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 30 Aug 2023 13:37:07 +1000
+Subject: [PATCH] CMakeLists.txt: Allow disabling EDDSA support from command
+ line
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream: https://github.com/DMTF/libspdm/pull/2330
+---
+ CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8a18c467a5..47b93f8bb7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -155,6 +155,11 @@ else()
+     MESSAGE(FATAL_ERROR "Unknown CRYPTO")
+ endif()
+ 
++if(DISABLE_EDDSA STREQUAL "1")
++    add_definitions(-DLIBSPDM_EDDSA_ED25519_SUPPORT=0)
++    add_definitions(-DLIBSPDM_EDDSA_ED448_SUPPORT=0)
++endif()
++
+ if(ENABLE_BINARY_BUILD STREQUAL "1")
+     if(NOT CRYPTO STREQUAL "openssl")
+         MESSAGE(FATAL_ERROR "enabling binary build not supported for non-openssl")
+-- 
+2.40.1
+
diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
new file mode 100644
index 0000000000..56c55f9c4d
--- /dev/null
+++ b/package/libspdm/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_LIBSPDM_CPU_FAMILY
+	string
+	# OpenSSL doesn't support "arc" (BR2_arcle || BR2_arceb), "arm"
+	# (if BR2_arm || BR2_armeb) or "riscv32"/"riscv6"
+	# (BR2_riscv && BR2_RISCV_32/BR2_RISCV_64). So we don't
+	# support those here
+	default "aarch64"	if BR2_aarch64 || BR2_aarch64_be
+	default "ia32"		if BR2_i386
+	default "x64"		if BR2_x86_64
+
+config BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_LIBSPDM_CPU_FAMILY != ""
+
+config BR2_PACKAGE_LIBSPDM
+	bool "libspdm"
+	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  libspdm is a sample implementation that follows
+	  the DMTF SPDM specifications
+
+	  https://github.com/DMTF/libspdm
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
new file mode 100644
index 0000000000..d06af29397
--- /dev/null
+++ b/package/libspdm/libspdm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3a40daa59f32843062c3d2699acee09bd0ee217eb8ebf0378ae12b60b6db0636  libspdm-3.0.0.tar.gz
+sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
new file mode 100644
index 0000000000..e070a7713a
--- /dev/null
+++ b/package/libspdm/libspdm.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# libspdm
+#
+################################################################################
+
+LIBSPDM_VERSION = 3.0.0
+LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
+LIBSPDM_LICENSE = BSD-3-Clause
+LIBSPDM_LICENSE_FILES = LICENSE.md
+
+LIBSPDM_INSTALL_STAGING = YES
+
+LIBSPDM_DEPENDENCIES = openssl
+
+LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
+
+LIBSPDM_CONF_OPTS = \
+	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
+	-DTOOLCHAIN=NONE \
+	-DTARGET=Release \
+	-DCRYPTO=openssl \
+	-DENABLE_BINARY_BUILD=1 \
+	-DCOMPILED_LIBCRYPTO_PATH=/usr/lib/ \
+	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
+	-DDISABLE_TESTS=1 \
+	-DDISABLE_EDDSA=1 \
+	-DLINK_FLAGS=$(STAGING_DIR)
+
+define LIBSPDM_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib
+	cp -dpfr $(@D)/lib/* $(STAGING_DIR)/usr/lib/
+
+	mkdir -p $(STAGING_DIR)/usr/include/libspdm/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/libspdm/
+
+	mkdir -p $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
+	cp -dpfr $(@D)/os_stub/spdm_crypt_ext_lib/*.h \
+		$(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib/
+endef
+
+define LIBSPDM_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -dpfr $(@D)/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
