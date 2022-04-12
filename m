Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF53C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E41416C5;
	Tue, 12 Apr 2022 18:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_VCXs22OvtV; Tue, 12 Apr 2022 18:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64314109E;
	Tue, 12 Apr 2022 18:24:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA9DB1BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B6B610B9
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d7ovwNx1hzYI for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:24:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A568A60FAA
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:24:37 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k22so10398941wrd.2
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3NzuBka0+EA9yhaVom5O+/0xmhB01yKPqYlkcFFP3s=;
 b=jxHsLICRxJja/hzvmGiABzt5L0zt+zWy01YLSqXKL+pzf4j5IfomYRfKX3t9+YIq/a
 80hLnsYZw+mGmrSIi+LqXH1g0kNf4ePxt4dKnFyp1Y/XBE1urd5vwLAboFeOcf4jwqRo
 edYe9e19OTIUPVilG2+9VjNd3F5at7NFo6VvKo6RoQy98BUXSeCzsqJMMA64Em/MBhWR
 gFATGnqhueamzfTEtQEL94wlAhFWzXzYf7aR8ANlTMPWrgLLCyx8Mboy2OIozAzP/IpW
 Ws1r+eUUmtjgXlGwEcfFw3VHd4XxrrrkcYYrAp/cXV7sx/yVmW2MdHWbbfZGEEiuE241
 h1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P3NzuBka0+EA9yhaVom5O+/0xmhB01yKPqYlkcFFP3s=;
 b=5ak9HMaXqN+nNaTehjsQ8sR42aEnaW5faYrdW+d83OOA3Q0321L7ji9AKgksKQ8NhS
 v2oKeAIwCGZ301P4qx+nQiMH4Yu/4AA8/UdAU4KeV0no5H6880jAnLkr04BN6aTVyNCf
 5vj890yHPbi3UqQgImp6twXITtWTdTFg3GKV0cjQTTuZBVKXLB3QtN2QHEF+IZWE41Gw
 ds6BVJ42pQEFNQl/8+yVrWdXIllnLdihC9DnmlGNYN3NxuZ3/f0TsLzLuJwGNWzzCV7a
 7yzuOn9vQUxqeR4Jg9qtsTa8jl+c16dQC/f4ganEVhZ6LcATcR8G9JGGxwVBXkCKqShu
 v1/Q==
X-Gm-Message-State: AOAM530hkt9GUmbJB5J7gPY2nTyjAonzb2nihdkxgvmMGFew4QF0FOps
 /+FfW/eOJ6mUm8acxB5O6x4+nl078eU=
X-Google-Smtp-Source: ABdhPJzP3Rw3ixsb8Td5tBw3uvqG10hwPIWhcRSPsSBtCOOxsv1j/yE7sEJU0TLkrmwf+Au0GioRZQ==
X-Received: by 2002:a5d:6dac:0:b0:205:ccac:c676 with SMTP id
 u12-20020a5d6dac000000b00205ccacc676mr29679122wrs.156.1649787875534; 
 Tue, 12 Apr 2022 11:24:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b0038ec7fcb979sm197539wms.26.2022.04.12.11.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:24:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:22:42 +0200
Message-Id: <20220412182242.1452070-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/azure-iot-sdk-c: fix build with
 libressl >= 2.8.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 2.8.0 raised since
https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:

/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
  961 |             bio_method = BIO_s_mem();
      |                        ^
cc1: all warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...apters-fix-build-with-libressl-2.8.0.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch

diff --git a/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
new file mode 100644
index 0000000000..e2a241bffe
--- /dev/null
+++ b/package/azure-iot-sdk-c/0001-adapters-fix-build-with-libressl-2.8.0.patch
@@ -0,0 +1,85 @@
+From 43b313988d66de144a528e4cf57827df1e8c692d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Apr 2022 20:00:36 +0200
+Subject: [PATCH] adapters: fix build with libressl >= 2.8.0 (#589)
+
+Fix the following build failure with libressl >= 2.8.0 raised since
+https://github.com/libressl-portable/openbsd/commit/703abab3212b397d500bd8c2f5f7ee6b03feb159:
+
+/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c: In function 'add_certificate_to_store':
+/nvmedata/autobuild/instance-20/output-1/build/azure-iot-sdk-c-LTS_01_2022_Ref01/c-utility/adapters/tlsio_openssl.c:961:24: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+  961 |             bio_method = BIO_s_mem();
+      |                        ^
+cc1: all warnings being treated as errors
+
+Fix #585
+
+Fixes:
+ - http://autobuild.buildroot.org/results/873f86fb2311ed29a791140f2341943475985fcc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/Azure/azure-c-shared-utility/commit/43b313988d66de144a528e4cf57827df1e8c692d]
+---
+ adapters/tlsio_openssl.c                | 2 +-
+ adapters/x509_openssl.c                 | 4 ++--
+ tests/x509_openssl_ut/x509_openssl_ut.c | 4 ++--
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/c-utility/adapters/tlsio_openssl.c b/c-utility/adapters/tlsio_openssl.c
+index 4a3df8496..aa48ce52d 100644
+--- a/c-utility/adapters/tlsio_openssl.c
++++ b/c-utility/adapters/tlsio_openssl.c
+@@ -953,7 +953,7 @@ static int add_certificate_to_store(TLS_IO_INSTANCE* tls_io_instance, const char
+         }
+         else
+         {
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+             const BIO_METHOD* bio_method;
+ #else
+             BIO_METHOD* bio_method;
+diff --git a/c-utility/adapters/x509_openssl.c b/c-utility/adapters/x509_openssl.c
+index 5a9e5ac29..46195b403 100644
+--- a/c-utility/adapters/x509_openssl.c
++++ b/c-utility/adapters/x509_openssl.c
+@@ -75,7 +75,7 @@ static int load_certificate_chain(SSL_CTX* ssl_ctx, const char* certificate)
+                 // certificates.
+ 
+                 /* Codes_SRS_X509_OPENSSL_07_006: [ If successful x509_openssl_add_ecc_credentials shall to import each certificate in the cert chain. ] */
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+                 SSL_CTX_clear_extra_chain_certs(ssl_ctx);
+ #else
+                 if (ssl_ctx->extra_certs != NULL)
+@@ -345,7 +345,7 @@ int x509_openssl_add_certificates(SSL_CTX* ssl_ctx, const char* certificates)
+         else
+         {
+             /*Codes_SRS_X509_OPENSSL_02_012: [ x509_openssl_add_certificates shall get the memory BIO method function by calling BIO_s_mem. ]*/
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+             const BIO_METHOD* bio_method;
+ #else
+             BIO_METHOD* bio_method;
+diff --git a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
+index b3349f6b0..f73191e3f 100644
+--- a/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
++++ b/c-utility/tests/x509_openssl_ut/x509_openssl_ut.c
+@@ -348,7 +348,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
+         STRICT_EXPECTED_CALL(BIO_new_mem_buf((void*)TEST_PUBLIC_CERTIFICATE, -1));
+         STRICT_EXPECTED_CALL(PEM_read_bio_X509_AUX(IGNORED_PTR_ARG, NULL, NULL, NULL));
+         STRICT_EXPECTED_CALL(SSL_CTX_use_certificate(IGNORED_PTR_ARG, IGNORED_PTR_ARG));
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+         // Actual macro name: SSL_CTX_clear_extra_chain_certs:
+         STRICT_EXPECTED_CALL(SSL_CTX_ctrl(TEST_SSL_CTX_STRUCTURE, SSL_CTRL_CLEAR_EXTRA_CHAIN_CERTS, 0, NULL));
+ #endif
+@@ -537,7 +537,7 @@ BEGIN_TEST_SUITE(x509_openssl_unittests)
+ 
+         umock_c_negative_tests_snapshot();
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L)
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && (OPENSSL_VERSION_NUMBER < 0x20000000L) || defined(LIBRESSL_VERSION_NUMBER)
+     #ifdef __APPLE__
+         size_t calls_cannot_fail_rsa[] = { 4, 5, 6, 10, 12, 13, 14 };
+         size_t calls_cannot_fail_ecc[] = { 3, 4, 8, 10, 11, 12} ;
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
