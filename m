Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C3ACCA473
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 08:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0D4860E9A;
	Mon,  6 Jun 2022 08:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYx8P3Gno2Vp; Mon,  6 Jun 2022 08:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAB6E60B01;
	Mon,  6 Jun 2022 08:41:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59A3D1BF39C
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56875410C1
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 08:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef-9OWshaUpL for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 08:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A30540999
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 08:41:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q26so8494801wra.1
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB7JSlNXpB7Su9uvm0lSuXNKshYZgf3t5sUp40pfRwg=;
 b=jnE+NaCZj54tjz9qAXdHeQEYZSfwcq0Qaaqy69Hh7noxQVLmqCkSUYCgHKxfG7u7eG
 7NOcOfWxfmfZGIuWhvQpzEp2UETPu0T8oBQUR1OZ+LBeZQd3hXPZtnoS2TN7+oiLSXVJ
 b9iPMsLx2nbsVIt2RwsPW0UVGLxp5l/P264AEDmC6UEWNA0UNPjGukpz/vUsjUCYDWlh
 g88vHL6lSydF8iqJugu6ty50AMblwBBaNdcKkmmp80BBxlupbNDmupm4bDOadvk7TGH+
 F3qC3BPXecmefEeWPoYMz9AphWuF8Ffb3u1jw321fPMhMR56AlL8Jf6ysQcujg8Aj8ry
 J0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UB7JSlNXpB7Su9uvm0lSuXNKshYZgf3t5sUp40pfRwg=;
 b=1GxQbbV/eYymm4APPIEmczn5rES0P9BQDMBLR2h9oIRD9a2HxwzHlcmutXWagWEmVc
 L4quUty/mGwPQ7zyv7qRzhy7ZTj1r+C2+rxaKn+L7hk56MoWJ93Y98G9zfKWly/FrMmA
 UBsKh8rzq4Mytw/Ux9KKCfYSAZc4rtwrca7Q8SPhSQTCgkKUOpd+hJ3onLwv++0vN0FG
 yZfIW/tw/U+I9gVXuVBFJNMBRiT06ayOdu60MqXvDSswy44Y3Kb5139Jjy4nZQz78QAE
 5DEJsOZhN4y3hvH9/xwOPCU2PWVeBmjgDtCpczzdRs5Vtgi1o6xdfGwdAz48gEnNjt5Z
 0XSg==
X-Gm-Message-State: AOAM530kban1AHrD+xWoBVndv89hfQQ+vCJi6hZU0u93iBbm1LUSZqeA
 YA4ZT6nE2u66pLQRJidABOYakGy0Ccw=
X-Google-Smtp-Source: ABdhPJzxghwd6YVGwX1eYFJKRtLXxUAWsv4M4ocK/plDNRPd7dBACb4xKs6aEGE6S4FMBG5or1LTAA==
X-Received: by 2002:a5d:648a:0:b0:217:3552:eb2d with SMTP id
 o10-20020a5d648a000000b002173552eb2dmr7545290wri.78.1654504885091; 
 Mon, 06 Jun 2022 01:41:25 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c3b9600b00397342e3830sm24752891wms.0.2022.06.06.01.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 01:41:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 10:38:27 +0200
Message-Id: <20220606083827.117950-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xml-security-c: fix build with
 libressl >= 3.5.0
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from ../xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp:36:0,
                 from enc/OpenSSL/OpenSSLCryptoKeyRSA.cpp:35:
../xsec/enc/OpenSSL/OpenSSLSupport.hpp:92:20: error: field 'mp_ctx_store' has incomplete type 'EVP_ENCODE_CTX {aka evp_Encode_Ctx_st}'
     EVP_ENCODE_CTX mp_ctx_store;
                    ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-build-with-libressl-3.5.0.patch  | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch

diff --git a/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch b/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..1b2591aa36
--- /dev/null
+++ b/package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,91 @@
+From 66d1d626cf1405119d89c6fd0fb7e9019bd67f6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Jun 2022 10:24:58 +0200
+Subject: [PATCH] fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+In file included from ../xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp:36:0,
+                 from enc/OpenSSL/OpenSSLCryptoKeyRSA.cpp:35:
+../xsec/enc/OpenSSL/OpenSSLSupport.hpp:92:20: error: field 'mp_ctx_store' has incomplete type 'EVP_ENCODE_CTX {aka evp_Encode_Ctx_st}'
+     EVP_ENCODE_CTX mp_ctx_store;
+                    ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e908e59ec5b8e1ac505c44900dcb39527f0ec1d3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://issues.apache.org/jira/browse/SANTUARIO-588]
+---
+ xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp | 3 ++-
+ xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp | 3 ++-
+ xsec/enc/OpenSSL/OpenSSLSupport.cpp      | 5 +++--
+ xsec/enc/OpenSSL/OpenSSLSupport.hpp      | 3 ++-
+ 4 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
+index a8ea9f1d..a9a84e3f 100644
+--- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
++++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.cpp
+@@ -48,7 +48,8 @@ XERCES_CPP_NAMESPACE_USE
+ //           Construction/Destruction
+ // --------------------------------------------------------------------------------
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+ OpenSSLCryptoBase64::OpenSSLCryptoBase64() : mp_ectx(&m_ectx_store), mp_dctx(&m_dctx_store) { }
+ OpenSSLCryptoBase64::~OpenSSLCryptoBase64() { }
+ #else
+diff --git a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
+index 82aeb0a1..7c947d50 100644
+--- a/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
++++ b/xsec/enc/OpenSSL/OpenSSLCryptoBase64.hpp
+@@ -205,7 +205,8 @@ private :
+     EVP_ENCODE_CTX *mp_ectx;              // Encode context
+     EVP_ENCODE_CTX *mp_dctx;              // Decode context
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+     EVP_ENCODE_CTX m_ectx_store;
+     EVP_ENCODE_CTX m_dctx_store;
+ #endif 
+diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.cpp b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
+index cf874f82..c4453004 100644
+--- a/xsec/enc/OpenSSL/OpenSSLSupport.cpp
++++ b/xsec/enc/OpenSSL/OpenSSLSupport.cpp
+@@ -273,7 +273,8 @@ int ECDSA_SIG_set0(ECDSA_SIG *sig, BIGNUM *r, BIGNUM *s)
+ 
+ #endif
+ 
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	 ((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+ EvpEncodeCtxRAII::EvpEncodeCtxRAII() : mp_ctx(&mp_ctx_store) { };
+ EvpEncodeCtxRAII::~EvpEncodeCtxRAII() { }
+ #else
+@@ -289,4 +290,4 @@ EVP_ENCODE_CTX
+     return mp_ctx;
+ }
+ 
+-#endif
+\ No newline at end of file
++#endif
+diff --git a/xsec/enc/OpenSSL/OpenSSLSupport.hpp b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
+index b5f67f26..09d50899 100644
+--- a/xsec/enc/OpenSSL/OpenSSLSupport.hpp
++++ b/xsec/enc/OpenSSL/OpenSSLSupport.hpp
+@@ -88,7 +88,8 @@ public:
+ 
+ private:
+     EVP_ENCODE_CTX *mp_ctx;
+-#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER < 0x10100000L) || \
++	((defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L))
+     EVP_ENCODE_CTX mp_ctx_store;
+ #endif    
+ };
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
