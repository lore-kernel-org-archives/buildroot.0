Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699C9C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 05:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A145C400B9;
	Wed, 30 Aug 2023 05:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A145C400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HewfVuFze2Sr; Wed, 30 Aug 2023 05:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D1434156F;
	Wed, 30 Aug 2023 05:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D1434156F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5A91BF3F9
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 05:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07B0941561
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 05:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07B0941561
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLCEbYH3g52I for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 05:37:08 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA27241576
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 05:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA27241576
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bf7a6509deso27518475ad.3
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 22:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693373827; x=1693978627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Innh7RXrICIKj/mQVfI3mZqEqjKp2DNwDQELfvTZWM=;
 b=gpQTzFPy+jzfE+nsKiayA9iwJWpOP7BpE8p6hC76+WkDIJ/ibIVQwAtOuYLyefTeLy
 9YSvAiFwimm0ajAROKr0whuQyqPyD568Vem7gh5yGeFgJwhRQyQGK+e7UuKYE0boKm0z
 kDbggm53m6S9KFPvsq5Irzvql/vnZ3Xy+q3Q22DafoHeZ3fXgn00PtRWWmbXZVY8GeoY
 eHHPWHpVVcIsaIG69+7N5n1ncm5ajlsQJp6id/yjbhHZgSQr82lzf4W1Op2ddIX8M6Og
 GiQhINr8rIka2JIOuXE24AQ/hxlM2RLjHbW5hIaQ+3GrHlLbOMt9BZGbNynvaClRu0xQ
 nTKw==
X-Gm-Message-State: AOJu0YzrnxMUXw0n/nXCRsyOoRAtpswiElVDt+UXJrsvOz48JTZ7tYcI
 /ycCZfpxvhnwA25y8hqCggYyEjh7DwixUA==
X-Google-Smtp-Source: AGHT+IHCTKKQfXHPwlo686fEjksFYfqNsV5Amp/Bi0fNxZ8iGTP+04Qx2Pg6dsi3KuMg48Nn0zOz7g==
X-Received: by 2002:a17:902:d48e:b0:1b8:6cae:4400 with SMTP id
 c14-20020a170902d48e00b001b86cae4400mr1314263plg.37.1693373826651; 
 Tue, 29 Aug 2023 22:37:06 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a170902860200b001b9f032bb3dsm10281432plo.3.2023.08.29.22.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 22:37:05 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 15:36:54 +1000
Message-Id: <20230830053654.1827435-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693373827; x=1693978627; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Innh7RXrICIKj/mQVfI3mZqEqjKp2DNwDQELfvTZWM=;
 b=GgV7WVzpE8hsVR33uZnBuze1Jj3Zrqp0txSZQo9DMq28dOrjnaQEW/1MvpANSY9yur
 gXULrLjvxxl9fGeZQDthbopzT376lyQlJhocTfGNiWGF0IgHU5+YY6E7xAaOIQEyR+iI
 osLGSF5QIQlwnq1gih/e6xdQp/yCbvjd8kseW13CHq+JNxte+CutneJdOjMCdz2xVMWl
 M5oC2KKWTMYrX/vVmVRe7Jskygj88fBy3osEpsW6exFp5Sy8cQnOG1KwmckQ3eN0zRDn
 X7n+agdKjbWgVzLuCyG5uCauRvtWx536+f126Ae31Ybc8ZSsgqExSTWX2EYJyp4pRc16
 sv+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GgV7WVzp
Subject: [Buildroot] [PATCH v3] package/libspdm: new package
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

Add the libspdm package (https://github.com/DMTF/libspdm).

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
This uses the 3.0 release with 4 patches on top. The first 3 patches are
accepted upstream and the 4th patch has been submitted.

v3:
 - Drop the libcrypto changes
 - Fixes and cleanups based on review feedback

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...-x509-Remove-internal-OpenSSL-crypto.patch | 43 ++++++++++
 ...lib_openssl-ecd-Allow-disabling-code.patch | 55 +++++++++++++
 ...-ec-Remove-internal-OpenSSL-crypto-i.patch | 81 +++++++++++++++++++
 ...llow-disabling-EDDSA-support-from-co.patch | 30 +++++++
 package/libspdm/Config.in                     | 19 +++++
 package/libspdm/libspdm.hash                  |  3 +
 package/libspdm/libspdm.mk                    | 45 +++++++++++
 9 files changed, 278 insertions(+)
 create mode 100644 package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
 create mode 100644 package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
 create mode 100644 package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
 create mode 100644 package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
 create mode 100644 package/libspdm/Config.in
 create mode 100644 package/libspdm/libspdm.hash
 create mode 100644 package/libspdm/libspdm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9b500f3701..5b5556d492 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,7 @@ F:	board/sifive/
 F:	boot/opensbi/
 F:	configs/hifive_unleashed_defconfig
 F:	package/xen/
+F:	package/libspdm/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index 54cddc3914..eda464262a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -193,6 +193,7 @@ menu "Development tools"
 	source "package/jo/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
+	source "package/libspdm/Config.in"
 	source "package/make/Config.in"
 	source "package/mawk/Config.in"
 	source "package/patch/Config.in"
diff --git a/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
new file mode 100644
index 0000000000..420098be11
--- /dev/null
+++ b/package/libspdm/0001-cryptlib_openssl-x509-Remove-internal-OpenSSL-crypto.patch
@@ -0,0 +1,43 @@
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
index 0000000000..7cc0ad2c94
--- /dev/null
+++ b/package/libspdm/0002-cryptlib_openssl-ecd-Allow-disabling-code.patch
@@ -0,0 +1,55 @@
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
index 0000000000..1a4a924ee8
--- /dev/null
+++ b/package/libspdm/0003-cryptlib_openssl-ec-Remove-internal-OpenSSL-crypto-i.patch
@@ -0,0 +1,81 @@
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
index 0000000000..78807770b6
--- /dev/null
+++ b/package/libspdm/0004-CMakeLists.txt-Allow-disabling-EDDSA-support-from-co.patch
@@ -0,0 +1,30 @@
+From 97611ce8279341205463ace6a5f2ff93c52fc417 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 30 Aug 2023 13:37:07 +1000
+Subject: [PATCH] CMakeLists.txt: Allow disabling EDDSA support from command
+ line
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
index 0000000000..2d0f46da85
--- /dev/null
+++ b/package/libspdm/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBSPDM
+	bool "libspdm"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  libspdm is a sample implementation that follows
+	  the DMTF SPDM specifications
+
+	  https://github.com/DMTF/libspdm
+
+config BR2_PACKAGE_LIBSPDM_CPU_FAMILLY
+	string
+	default "arc" if BR2_arcle || BR2_arceb
+	default "arm" if BR2_arm || BR2_armeb
+	default "aarch64" if BR2_aarch64 || BR2_aarch64_be
+	default "ia32" if BR2_i386
+	default "riscv32" if BR2_riscv && BR2_RISCV_32
+	default "riscv64" if BR2_riscv && BR2_RISCV_64
+	default "x64" if BR2_x86_64
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
index 0000000000..f174547cbb
--- /dev/null
+++ b/package/libspdm/libspdm.mk
@@ -0,0 +1,45 @@
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
+LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILLY))
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
+	$(INSTALL) -m 0755 -t $(STAGING_DIR)/usr/lib/ $(@D)/lib/*
+
+	mkdir -p $(STAGING_DIR)/usr/include/libspdm/
+	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include/libspdm/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
+	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
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
