Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C45C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0695360B51;
	Thu, 12 May 2022 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psKjLsP1yged; Thu, 12 May 2022 20:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12CA360B35;
	Thu, 12 May 2022 20:47:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3E691BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1B0360B35
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:47:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sD-y2qljDeCT for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:47:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF5776076A
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:47:12 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k126so3719565wme.2
 for <buildroot@buildroot.org>; Thu, 12 May 2022 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDyeNggYtoRj9yUZNQFapdGl21qzzRxwlmZjA7lGqL8=;
 b=YKDZ/wx5QVZ2tyEu2P04O1lzfRje5LCesjcd7jqGybCX4aprxR9I2Yo9tuuHJcr1sw
 Pn1wKiV9tu3+zWX0MEBICyHm0VXxaHTjGPcPUZKRyg8b5KxTvCxG9VWBkx1wQK1TWCxd
 HSn4jGfsfyXKK+Dv+oOt7cGUqEUqSC2gNL+M3+8oOpftXvYQZ/szr2TT3W3IjmCyM63k
 +NPezmWRNAm1cYlslRZMMbPSyMdCV7FCzaH6qcOf1QANh+9QDZ7wts2ZKlhq1F+8glWC
 UOkg413pQAlt+m5PkEoV1Y6QET0beyWits7dTzdKvtkq/liH5YZerOknPylsuoT5/mtT
 Sw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDyeNggYtoRj9yUZNQFapdGl21qzzRxwlmZjA7lGqL8=;
 b=1FiMCHHTW48NZGXkPjaZjonZBIuDm82YSO6+taoJrnpXh2Y3GQ1fNwrAXULCKAhDt8
 V0W9DViKcsZXfVXejk+QoOzisbWn0By0R8tMrplGlcgWQH3Dj3yhZ3enxpQGIzYS3FDb
 R+yxaYAXKkHGOQODrnRdAb1TsnLSQBmZ+7PwReL7Dc1w7AkStNZwnu8WFgQp6mx18/iW
 1bSTOm9MRsMwP23OSuI+X1DDb42fk4fpBSEqKwyQDAnudzBJwZA8qbptY7rdCtYPknbT
 oKlWnnhC9hCMSOmSzofatxxkBoKa/G8CVNonzx1i3UOHvNww7GofmNvBwcqe06nEjLso
 FLQw==
X-Gm-Message-State: AOAM533PL5aP3lP9KGFFeXoB0mqqVN6Tbi96/ElE/4moRldJzskLZvAY
 91RYfwt7G92e0/v50z4mE8XwuAyFHCw=
X-Google-Smtp-Source: ABdhPJweoWGuwTP/kCjxQUJfs+j11UhZtOt1ElrSMlij3aPZYPeIJxSj7Q2yD5Gyn5wAyWogp9IzVg==
X-Received: by 2002:a05:600c:3d0a:b0:395:baf7:ca43 with SMTP id
 bh10-20020a05600c3d0a00b00395baf7ca43mr8969149wmb.53.1652388430614; 
 Thu, 12 May 2022 13:47:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r21-20020adfb1d5000000b0020c5253d924sm406334wra.112.2022.05.12.13.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:47:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:44:51 +0200
Message-Id: <20220512204451.2824389-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: fix build with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
      |       ^~

Fixes:
 - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...enssl.c-fix-build-with-libressl-3.5..patch | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch

diff --git a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
new file mode 100644
index 0000000000..110976c4bb
--- /dev/null
+++ b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
@@ -0,0 +1,66 @@
+From 97fbbd678b2012e64acddd523677bc55a177bc58 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 12 May 2022 20:41:50 +0200
+Subject: [PATCH] common/crypto_openssl.c: fix build with libressl >= 3.5.0
+ (#522)
+
+Fix the following build failure with libressl >= 3.5.0:
+
+/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
+/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
+  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
+      |       ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/97fbbd678b2012e64acddd523677bc55a177bc58]
+---
+ common/crypto_openssl.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/common/crypto_openssl.c b/common/crypto_openssl.c
+index 60d4bd4df..51d7ec2d9 100644
+--- a/common/crypto_openssl.c
++++ b/common/crypto_openssl.c
+@@ -138,14 +138,16 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
+ {
+     int result = 0;
+     DH *dh;
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000)
+     const BIGNUM *pub_key = NULL;
+     const BIGNUM *priv_key = NULL;
+ #endif
+ 
+     if(!(dh = DH_new()))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     dh->p = BN_bin2bn(prime, keylen, NULL);
+     dh->g = BN_bin2bn(gen, gen_len, NULL);
+ #else
+@@ -154,7 +156,8 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
+ #endif
+     if(!DH_generate_key(dh))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     if(BN_bn2bin(dh->priv_key, priv_out) == 0)
+ 	goto out;
+     if(BN_bn2bin(dh->pub_key, pub_out) == 0)
+@@ -181,7 +184,8 @@ int dh_compute_shared_key(uint8_t *shared_out, const uint8_t *priv, const uint8_
+ 
+     if(!(dh = DH_new()))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     dh->p = BN_bin2bn(prime, keylen, NULL);
+     dh->priv_key = BN_bin2bn(priv, keylen, NULL);
+ #else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
