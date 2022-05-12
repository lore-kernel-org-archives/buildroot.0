Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE67C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9578A82ED2;
	Thu, 12 May 2022 21:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEs1gfYbswyC; Thu, 12 May 2022 21:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C08F82C84;
	Thu, 12 May 2022 21:49:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D900A1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6CE660B88
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puhwyI-BFb11 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF16A60B4F
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:49:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w4so8966568wrg.12
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5HEMxwpFn3JasLxqjVoCKlRvNhGIpeb1nuoZYJQ4eI=;
 b=B4x8L2CzgM/06nS3hR9570y5D6hYy+AYce8L0Ij/8E435BNusCwyXd5x27r1QXKnvD
 COFtT7+TXsX7ZHfFHfaA0Ku0Mqn8SDQBE6D4xZLg7fl5t0K+rhoaFElxTOBjsF4evVyV
 cy25PltGJW/aY8P8aUp6YegFSvuHgilToTx+0/Jf19zm7ENhRNoYFmXA5aC9aCmQw434
 4pk+DwlNfYKhiC+qmpjQu/oubtJgMkU1pBjE4FiFQfN+CI59vcD+OcT5bUOcY0vJpv2n
 8KLsq/eElOLPLIhVKrcLln7cDKBREqKAWmcK3USIIyAxFiRVGTZKbwcU4Nt0cnu54Kyu
 dXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E5HEMxwpFn3JasLxqjVoCKlRvNhGIpeb1nuoZYJQ4eI=;
 b=OcUN4S615Sny3lsOd1e87b0koBdYKvfQv/eavXEY7hW1Sz3NF353NhNIxqv9vu3tyk
 hI81Lgn2O9PjjE/tTD4qj40qL8PU1CMhaSiBAYnOElxLrQgSXqn4n6o5ycXuXK0vyS4k
 a+YtNLz1j9bZTbqfP/MRKEEwEzoLbuPf6Y+D+1cu6uFHr1NeA6N5dsp5PAiVirXMhC9V
 Lw7e4xD3BjN5ZNqTwCXHBHLQm6SuUAl0Rs1UpRGdJ6T7bDG/4wipvYWuFCbQPRajeGvB
 hcOwuyPNIX9QoB1XqSLe6tsTCgNvgDpNsxkOYoj1rtC1vQ3PvPdKjeLkcONMscnpl14w
 nkxw==
X-Gm-Message-State: AOAM531mZs0nXppocKGVUi5JJRazbMtacXcMyVfcss4rkZWzYQre3Rqn
 XLt/Xza9mki4b47tt+Ihq8N1HB6bFBY=
X-Google-Smtp-Source: ABdhPJyoELTT7wSTJNx7NaMKnIP0D8t1zDvI3aionOGQ4FC8A5RJ6Un6A6XqgdHCgraTCmo9AtOLow==
X-Received: by 2002:a05:6000:156e:b0:20c:4fd5:f780 with SMTP id
 14-20020a056000156e00b0020c4fd5f780mr1314688wrz.561.1652392176583; 
 Thu, 12 May 2022 14:49:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d59ac000000b0020c5253d925sm509207wrr.113.2022.05.12.14.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:49:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 23:47:16 +0200
Message-Id: <20220512214716.3021965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: fix build with libressl
 >= 3.5.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
      |                                                       ^~~~~~~~
crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
   97 |         HMAC_CTX_init(new_hmac_ctx);
      |         ^~~~~~~~~~~~~
      |         HMAC_CTX_new
crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
  130 |     HMAC_CTX_cleanup(hmac_ctx);
      |     ^~~~~~~~~~~~~~~~
crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
  133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
      |                                        ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-hash-hmac_ossl.c-fix-build-with-lib.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch

diff --git a/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
new file mode 100644
index 0000000000..eb717fc26d
--- /dev/null
+++ b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
@@ -0,0 +1,59 @@
+From c8cc6f1773ff370bb14bb963e2f632eef6d6a3c2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 12 May 2022 23:22:42 +0200
+Subject: [PATCH] libs/srtp/crypto/hash/hmac_ossl.c: fix build with libressl >=
+ 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
+crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
+   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
+      |                                                       ^~~~~~~~
+crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
+   97 |         HMAC_CTX_init(new_hmac_ctx);
+      |         ^~~~~~~~~~~~~
+      |         HMAC_CTX_new
+crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
+crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
+  130 |     HMAC_CTX_cleanup(hmac_ctx);
+      |     ^~~~~~~~~~~~~~~~
+crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
+  133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
+      |                                        ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libs/srtp/crypto/hash/hmac_ossl.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libs/srtp/crypto/hash/hmac_ossl.c b/libs/srtp/crypto/hash/hmac_ossl.c
+index 8146438b05..6730cbb35c 100644
+--- a/libs/srtp/crypto/hash/hmac_ossl.c
++++ b/libs/srtp/crypto/hash/hmac_ossl.c
+@@ -79,7 +79,8 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+ 
+ /* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
+    using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+     {
+         /* allocate memory for auth and HMAC_CTX structures */
+         uint8_t *pointer;
+@@ -125,7 +126,8 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
+ 
+     hmac_ctx = (HMAC_CTX *)a->state;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+     HMAC_CTX_cleanup(hmac_ctx);
+ 
+     /* zeroize entire state*/
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
