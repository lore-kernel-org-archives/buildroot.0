Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF5EC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E4383A62;
	Sat,  4 May 2024 08:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-80pqjYXlOC; Sat,  4 May 2024 08:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC0F183A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC0F183A67;
	Sat,  4 May 2024 08:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF8BD1BF283
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 08:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6D3383A6E
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 08:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EunVUr_71pDU for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 08:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A46183A67
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A46183A67
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A46183A67
 for <buildroot@buildroot.org>; Sat,  4 May 2024 08:52:21 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2e1a02af4a5so5259041fa.2
 for <buildroot@buildroot.org>; Sat, 04 May 2024 01:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714812739; x=1715417539;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yl+zhgkYE+YnA3Pa6JvFDDKFR5q9l/OjBaE/VWZ4ABE=;
 b=ullIjYfLtNDb49hCZZ+YwZrk4PnfB9AvyXRvjTClCgQ7k1kaC4fSHEJz/d/on1s+oV
 0Qgx8JHbW3d+5Lr3Qkwe6VXDHbvDbLhBOT9WkFJWLAuxi5M4Pu1w0xVPyoTvPhvxisK+
 bi471RFAZiBDtaI1I/HdYweL9DhNSfSC7lVtQIDrsJF0RxPilc6m0Me0q392k7xzaTgc
 QhDN+qJl/5gRKGzMFyaVIBgUVkyN00TR7JptNAQC5uBcdf+8ISS9qorATFnTj+DuLmAP
 HVsAQzdKEdhfnSGOy/y4uJMC3Y3Y4URgQeKNq/CCKpCQGda7Z6wnZhkJZn2TUpzcPKGm
 +kZw==
X-Gm-Message-State: AOJu0YzxmqpTTBdIwKhG2joudVCZbJXLZNBB+QQvGIZhSpnJ39r4T+om
 QmXQwqi4lk73tiaDp+lpiUMZZ7YK/k+71IdcjsuTw78C28c1Q0QHhFpKHA==
X-Google-Smtp-Source: AGHT+IEDBN68t4u20Rxdaki8sJWSJeUMSVbixGOEQOsz2AzSKdOEKSxS16fAM0T8LMSaYBtJemTJmA==
X-Received: by 2002:a2e:beac:0:b0:2da:e7f7:7315 with SMTP id
 a44-20020a2ebeac000000b002dae7f77315mr3416945ljr.45.1714812738715; 
 Sat, 04 May 2024 01:52:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 gb30-20020a056000459e00b0034e0346317dsm5728055wrb.13.2024.05.04.01.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 01:52:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 10:52:14 +0200
Message-ID: <20240504085214.336652-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714812739; x=1715417539; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yl+zhgkYE+YnA3Pa6JvFDDKFR5q9l/OjBaE/VWZ4ABE=;
 b=gxE4uzkf7iEgU8qcfyTzzeb54wIRr4aam58FnLOVClWxNpBezETt3A0+tcC5jZjQTG
 2Oofts0/2CkDa5b4fDKy8ToEuAzq7dyOoJnx6UoL52g2pTkmiXCr5rfaEIi9Y8X5HRsR
 I1NUjYHfTKys7o/2RWG8CYklx9uXKOYiBwUUi5ZE/75Ix8NMDMgXrrD2H9Bir4QMlkCE
 qrLi9f7lLN/HwR3Egb/DSzBhmC1MoiFhkLkvqd+uxWqNAGMTjpLAsF6MlMI0zirlehbi
 X2JHgmJQRhEOONhAMXN8GtFuouEP/xtIidh5k2w8cvJtd+p0qM4e17kO48YfxZMm+MCU
 GGvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gxE4uzkf
Subject: [Buildroot] [PATCH 1/1] package/rsync: bump to version 3.3.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop first patch (already in version)

https://github.com/RsyncProject/rsync/blob/v3.3.0/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...py-in-crypto-lib-instead-of-MD5_Init.patch | 28 -------------------
 ...pkg-config-to-retrieve-openssl-depe.patch} |  0
 package/rsync/rsync.hash                      |  4 +--
 package/rsync/rsync.mk                        |  2 +-
 4 files changed, 3 insertions(+), 31 deletions(-)
 delete mode 100644 package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
 rename package/rsync/{0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch => 0001-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch} (100%)

diff --git a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch b/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
deleted file mode 100644
index 5381159968..0000000000
--- a/package/rsync/0001-Check-for-EVP_MD_CTX_copy-in-crypto-lib-instead-of-MD5_Init.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 556a2c5bc2f6244f140a96302d4df92cfc25af8b Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayne@opencoder.net>
-Date: Tue, 25 Oct 2022 21:55:53 -0700
-Subject: [PATCH] Check for EVP_MD_CTX_copy in crypto lib instead of MD5_Init.
-
-Upstream: https://github.com/WayneD/rsync/commit/556a2c5bc2f6244f140a96302d4df92cfc25af8b
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a2c99558..ccad7f13 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -432,10 +432,10 @@ AH_TEMPLATE([USE_OPENSSL],
- if test x"$enable_openssl" != x"no"; then
-     if test x"$ac_cv_header_openssl_md4_h" = x"yes" && test x"$ac_cv_header_openssl_md5_h" = x"yes"; then
-       AC_MSG_RESULT(yes)
--      AC_SEARCH_LIBS(MD5_Init, crypto,
-+      AC_SEARCH_LIBS(EVP_MD_CTX_copy, crypto,
-           [AC_DEFINE(USE_OPENSSL)
- 	   enable_openssl=yes],
--          [err_msg="$err_msg$nl- Failed to find MD5_Init function in openssl crypto lib.";
-+          [err_msg="$err_msg$nl- Failed to find EVP_MD_CTX_copy function in openssl crypto lib.";
- 	   no_lib="$no_lib openssl"])
-     else
-         AC_MSG_RESULT(no)
diff --git a/package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch b/package/rsync/0001-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
similarity index 100%
rename from package/rsync/0002-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
rename to package/rsync/0001-configure.ac-use-pkg-config-to-retrieve-openssl-depe.patch
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 842b5c099f..edeca9c4df 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.2.7.tar.gz.asc
-sha256  4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb  rsync-3.2.7.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.3.0.tar.gz.asc
+sha256  7399e9a6708c32d678a72a63219e96f23be0be2336e50fd1348498d07041df90  rsync-3.3.0.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index b9d392c8cb..188c87e1d4 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.7
+RSYNC_VERSION = 3.3.0
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
