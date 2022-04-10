Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B19EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7310241700;
	Sun, 10 Apr 2022 14:12:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMMehU2nndVs; Sun, 10 Apr 2022 14:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20DBE416F7;
	Sun, 10 Apr 2022 14:12:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48C321BF3B5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 441D1416F7
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yeg387SJs0gk for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F389241691
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:12:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id p189so8361641wmp.3
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 07:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V7SAURokf43QcyT4cngJRhhpPDJQz8j25h/79pnaXvI=;
 b=ZEJ9rpo9x+TpVP0sHKh4d8kCMqQstWLX/8FeGK5IVac2XeBhnyRTJRSlhqMpvyG0Es
 c8SDJ6EqOSlxVigLeKXmk3ZKPV8CHHLgxNZyR8+Z161+j57Z8H2SIIOu2aUZYdqsME0h
 Ju3Ndh10FQLkgqvNZcDH6ZSbTEChMIdgn2F3yE3ZW8AiufbGGm3Klv66xl8v85VbKVm0
 r4tCs0QY+A7qo0yHG6xkeI4k7TZHRA6/o5jCIrV9by4wWqGswv2BTkqJeKqYk2mTEMK3
 O4TXE+48kmv/bOUaLy1cHLigni89TpMR4IrXe63A4rESPje7PNuW6529ks76f2xzZM/F
 24fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V7SAURokf43QcyT4cngJRhhpPDJQz8j25h/79pnaXvI=;
 b=0u7ln4cOTDpqopWgLQ+OROxYa02Mk7r2JqTGiiYWnM9+hE0bI4axeo1r4VToYz61e/
 IlbQwMj0J0y321nxOTw3FScsptuPF07gIu+fe9bgKnZ9zD606BYiRVi9gnL78nVgazHY
 UKvtz9sDHiTXKfw2Sid8XSgN/jtmvPNNOy9/k0DNwGTOt6bIVtLp6GesL7ybj2WmQEMH
 A8T93lyQNcwDKSpEvXyqtp9fxbVFPrQ7uudq8d6fZRBBWEWqqsGhlh0zacFc+kQP+1Z2
 mwKqDZA6Oz5wUjFNXftrjsAKS9WmLi2qHitEN5pic9eEWPpzaTK1cFxtR8gsp3w+KPs7
 DgMA==
X-Gm-Message-State: AOAM5328W5JlqPS2roDHJLWUgHECPml87+JhQNDPmzGh93OKVO7kOMK9
 Q/VpnS0qxO2Dr5nQCnBSUBFoW03YmwA=
X-Google-Smtp-Source: ABdhPJwnvfh878EDehNm48uZdUI+bVT3GB2K5cbwYpeZmXmeBqPVxvzZzEPsowGSuCTlyot7gLIavw==
X-Received: by 2002:a05:600c:3ba8:b0:38e:ba3a:dc3b with SMTP id
 n40-20020a05600c3ba800b0038eba3adc3bmr1845132wms.185.1649599966001; 
 Sun, 10 Apr 2022 07:12:46 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm24080535wrg.62.2022.04.10.07.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 07:12:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:10:43 +0200
Message-Id: <20220410141043.144288-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lftp: fix build with libressl
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

Fix the following build failure with libressl > 2.7.0:

/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._ssl.c-fix-build-with-libressl-2.7.0.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch

diff --git a/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
new file mode 100644
index 0000000000..4251a5e176
--- /dev/null
+++ b/package/lftp/0002-src-lftp_ssl.c-fix-build-with-libressl-2.7.0.patch
@@ -0,0 +1,36 @@
+From 3ffa0132987bdde986c82c924bc51b13b37f8b54 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Apr 2022 22:56:21 +0200
+Subject: [PATCH] src/lftp_ssl.c: fix build with libressl >= 2.7.0
+
+X509_OBJECT_get0_X509_CRL is provided by libressl since version 2.7.0
+and
+https://github.com/libressl-portable/openbsd/commit/9866ae34c0af718973475296bd9ef036d3aaa94e
+resulting in the following build failure:
+
+/nvmedata/autobuild/instance-21/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblaze-buildroot-linux-musl/11.2.0/../../../../microblaze-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-21/output-1/host/microblaze-buildroot-linux-musl/sysroot/usr/lib/libcrypto.a(x509_lu.c.o): in function `X509_OBJECT_get0_X509_CRL':
+(.text+0xc3c): multiple definition of `X509_OBJECT_get0_X509_CRL'; /nvmedata/autobuild/instance-21/output-1/build/lftp-4.9.2/src/.libs/liblftp-network.a(liblftp_network_la-lftp_ssl.o):(.text+0x894): first defined here
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7fd1dfd5bc750ae5a3278ca950c838ae90704b23
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/lavv17/lftp/commit/3ffa0132987bdde986c82c924bc51b13b37f8b54]
+---
+ src/lftp_ssl.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index 26e91e4b..a814543d 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -664,7 +664,7 @@ int gnutls_x509_crt_list_import(gnutls_x509_crt_t *certs, unsigned int* cert_max
+ #elif USE_OPENSSL
+ //static int lftp_ssl_passwd_callback(char *buf,int size,int rwflag,void *userdata);
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
+ // for compatibility with older versions
+ X509_OBJECT *X509_OBJECT_new()
+ {
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
