Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF036C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FEF584EC2;
	Sun, 11 Feb 2024 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZD8iKqRhbg4; Sun, 11 Feb 2024 21:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A75184EC7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A75184EC7;
	Sun, 11 Feb 2024 21:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26D731BF39A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1418C84EC7
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3e45j0Kckyz for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A381684EC2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A381684EC2
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A381684EC2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:10:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso2138708f8f.0
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 13:10:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707685825; x=1708290625;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHpifvQh4gpP/GMt0ro7sAuSF+u//r3Zm1QX9DjAdpo=;
 b=D+BS9dKeA+a/IiX0YBCmhEiVG9Q0fPVVZ/HSJ6rtUDU+vqzD+nBLJqgi6T3fUlNDLh
 xuWOz4zZHKC8diC/OfkDNSS9HQGPdJIgpf3Yz6pV7TP/vL2Aevm+pDJjnepCf8ye4PYw
 K3q0bKg64bZDcgHHkA53DMfOHKattnmWG/ysPwiinJaLBZTKejkm+dvo687Qv/n5rWPt
 QJrKADHrM1aX1eFjkTJ6Zf8YhemLldK0Y2Ox4o3TdVA3VQIxd1KRXxGDf+bGE2qU9ybD
 IprVyA5syVyxgUC+FFqvor6xqUt3hQpR5PIPYWiZY8rCLZ4ndLjdhdtuoNpx9J3rQ0Ee
 EJ4Q==
X-Gm-Message-State: AOJu0YzDIl7oVozWZyiOq+ORLJxFv7jC1msQ65j5f1f/rYoLnE/uIIGE
 L4UVig1lzIiHkVCZ0cGPes2LweVL9IRiBb8IXeRcjx/5VSMSX44ZNmzlXd7H6bU=
X-Google-Smtp-Source: AGHT+IF8K9kpwhNmaZGgz8bLGDuOGEkDhTIgTARsPkNq2vW9H3knurLAotQBVyxUg82PRXlLSbApSg==
X-Received: by 2002:a5d:4e8c:0:b0:33b:38ce:8a92 with SMTP id
 e12-20020a5d4e8c000000b0033b38ce8a92mr5846988wru.20.1707685824498; 
 Sun, 11 Feb 2024 13:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH1aCE5ke2NAMiubq+0z9T9A/qb2G4ep7YP9gsaNG6Z5E5ln6QspzFN4nfkq5tO8DFh/+2FCIelEVcT7CkSdIiGdC8gdugKUu8hGLyU/nb/147g8ca6Wx9XUPUFEklf0wjIEzI1g==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b00410c2f39833sm2047801wmq.30.2024.02.11.13.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 13:10:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:10:22 +0100
Message-ID: <20240211211022.2003157-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707685825; x=1708290625; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JHpifvQh4gpP/GMt0ro7sAuSF+u//r3Zm1QX9DjAdpo=;
 b=AZg2xaiZ3W1j7pmIGKseUaEsKJ6x0SRIsS+XWFenI8GjtZf2EgOxa7ZiWT/f14gJmq
 nkvXeDzcsrzFpMwJpf8rzaqpG/swtYcEZUEkVXsCaRceOsDYYFDr460QvqxpTaUnjdLf
 PlYaoDDY/rDCsLpqoFhaWzK7xWgSow0ovBG3XaWoavsWUJZww8K0W5+djTsGvpp93YcQ
 wttWoi1c+26KpTf+9zOU3ARcOB/L9vNrSd9hjtMo/8UQEsw5I4U2Ejg0o+KFgXyCYKec
 ZKaJg2e/cPlrnfTi1SkuR7TM0/e8HNlZShXzq4I/qgyqZpkx34pYN5AzwL2TqHxVf0Yo
 WxRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AZg2xaiZ
Subject: [Buildroot] [PATCH 1/1] package/exim: fix libressl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libressl build failure raised since bump to version
4.97 in commit faec3ca30e358575f70a036879029f63f7da9b29 and
https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:

In file included from tls.c:473:
tls-openssl.c: In function 'tls_client_stapling_cb':
tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
 2652 |         bs->certs
      |           ^~

Fixes: faec3ca30e358575f70a036879029f63f7da9b29
 - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/exim/0007-typoes.patch                | 58 +++++++++++++++++++
 ...nssl.c-fix-build-with-libressl-3.5.0.patch | 43 ++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 package/exim/0007-typoes.patch
 create mode 100644 package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch

diff --git a/package/exim/0007-typoes.patch b/package/exim/0007-typoes.patch
new file mode 100644
index 0000000000..6bbfc9eecd
--- /dev/null
+++ b/package/exim/0007-typoes.patch
@@ -0,0 +1,58 @@
+From caf57fe7eb5018b8df196e6d9f99586232798eb3 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Wed, 8 Nov 2023 14:22:37 +0000
+Subject: [PATCH] typoes
+
+Upstream: https://git.exim.org/exim.git/commit/caf57fe7eb5018b8df196e6d9f99586232798eb3
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/src/tls-openssl.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/tls-openssl.c b/src/tls-openssl.c
+index 851ac77c5..237303ba9 100644
+--- a/src/tls-openssl.c
++++ b/src/tls-openssl.c
+@@ -77,9 +77,9 @@ change this guard and punt the issue for a while longer. */
+ #  define EXIM_HAVE_OPENSSL_KEYLOG
+ #  define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
+ #  define EXIM_HAVE_SESSION_TICKET
+-#  define EXIM_HAVE_OPESSL_TRACE
+-#  define EXIM_HAVE_OPESSL_GET0_SERIAL
+-#  define EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
++#  define EXIM_HAVE_OPENSSL_TRACE
++#  define EXIM_HAVE_OPENSSL_GET0_SERIAL
++#  define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
+ #  define EXIM_HAVE_SSL_GET0_VERIFIED_CHAIN
+ #  ifndef DISABLE_OCSP
+ #   define EXIM_HAVE_OCSP
+@@ -1756,7 +1756,7 @@ level. */
+ DEBUG(D_tls)
+   {
+   SSL_CTX_set_info_callback(ctx, info_callback);
+-#if defined(EXIM_HAVE_OPESSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
++#if defined(EXIM_HAVE_OPENSSL_TRACE) && !defined(OPENSSL_NO_SSL_TRACE)
+   /* this needs a debug build of OpenSSL */
+   SSL_CTX_set_msg_callback(ctx, SSL_trace);
+ #endif
+@@ -2442,7 +2442,7 @@ tls_in.ocsp = OCSP_NOT_RESP;
+ if (!olist)
+   return SSL_TLSEXT_ERR_NOACK;
+ 
+-#ifdef EXIM_HAVE_OPESSL_GET0_SERIAL
++#ifdef EXIM_HAVE_OPENSSL_GET0_SERIAL
+  {
+   const X509 * cert_sent = SSL_get_certificate(s);
+   const ASN1_INTEGER * cert_serial = X509_get0_serialNumber(cert_sent);
+@@ -2646,7 +2646,7 @@ if (!(bs = OCSP_response_get1_basic(rsp)))
+ 
+       debug_printf("certs contained in basicresp:\n");
+       x509_stack_dump_cert_s_names(
+-#ifdef EXIM_HAVE_OPESSL_OCSP_RESP_GET0_CERTS
++#ifdef EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
+ 	OCSP_resp_get0_certs(bs)
+ #else
+ 	bs->certs
+-- 
+2.30.2
+
diff --git a/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch b/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..67d96fc1af
--- /dev/null
+++ b/package/exim/0008-src-src-tls-openssl.c-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,43 @@
+From 88f45502272a9a674948204e460ebe90202827d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 11 Feb 2024 21:45:42 +0100
+Subject: [PATCH] src/src/tls-openssl.c: fix build with libressl >= 3.5.0
+
+OCSP_BASICRESP is an opaque structure since libressl 3.5.0 and
+https://github.com/libressl/openbsd/commit/57442b0028fb09287793f279ee57ebb38e9ab954
+resulting in the following build failure since version 4.97 and
+https://git.exim.org/exim.git/commit/6bf0021993572586f031ac7d973ca33358c2dac8:
+
+In file included from tls.c:473:
+tls-openssl.c: In function 'tls_client_stapling_cb':
+tls-openssl.c:2652:11: error: invalid use of incomplete typedef 'OCSP_BASICRESP' {aka 'struct ocsp_basic_response_st'}
+ 2652 |         bs->certs
+      |           ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/869fde62128d7b0c65e0ac596a3a3f69b332583d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://bugs.exim.org/show_bug.cgi?id=3074
+---
+ src/src/tls-openssl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tls-openssl.c b/src/tls-openssl.c
+index 237303ba9..c7f94c160 100644
+--- a/src/tls-openssl.c
++++ b/src/tls-openssl.c
+@@ -98,6 +98,10 @@ change this guard and punt the issue for a while longer. */
+ # define EXIM_HAVE_OPENSSL_CIPHER_GET_ID
+ #endif
+ 
++#if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
++# define EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_CERTS
++#endif
++
+ #if !defined(LIBRESSL_VERSION_NUMBER) && (OPENSSL_VERSION_NUMBER >= 0x030000000L)
+ # define EXIM_HAVE_EXPORT_CHNL_BNGNG
+ # define EXIM_HAVE_OPENSSL_X509_STORE_GET1_ALL_CERTS
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
