Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2094C433F5
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 08:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64E31410D3;
	Wed, 20 Apr 2022 08:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BqUHDtp9cFDP; Wed, 20 Apr 2022 08:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F77640936;
	Wed, 20 Apr 2022 08:21:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A0361BF319
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 569B061047
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 08:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8xkvAVbhn4ol for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 08:21:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FAE6605A9
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 08:21:41 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b19so1128667wrh.11
 for <buildroot@buildroot.org>; Wed, 20 Apr 2022 01:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHDap1NfDg5Wz1xsg+qqJxPj4Na7dt1dVx1SQwrTZEU=;
 b=IPpuMnoGJTr6VgnwtcC2m9+yyQTXfmo138xjAt6+QraByafsKUaFVL5WDkH8XzoCNS
 PDo7LNRG/PatWy3D6tv3fmRDhZypCnukxjdrtsXvtb2fZNmJxFX5oKitHcNT91v9REmC
 sJTkHArXU7OSLZddjoz+Xi2bmGOesziXHVr7DPLWfQQmg/thEGhmfdmgyHoyICqYIB84
 EpJ2h7kSr0TKZXsgYBxRyC9NUhyV8c7eEhunAwHZ8fOIbur73rZGCcg2sKpWCPXksFh9
 EdHQLCF9nNRGXiNS+c5aU1ikU1GTQdSNrgig/95WzVrQjOm5C4ub+VzaFBrnD2AAS+eh
 paNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHDap1NfDg5Wz1xsg+qqJxPj4Na7dt1dVx1SQwrTZEU=;
 b=Cg9OC5aKO/Kj1gJuosD13f20I3MZ53RGZa2pN5uSrS7K2iAmXCXS9KQGUGZowFGebQ
 I9Hwwm65xURs7uu0STl0Jd4UtXRytcoZcK1h5zZYhNmjJPtRzw58X5xOJM50kjfUTRKE
 vc7f+5n/CJ9vwI4bkbWQrMpnhwy8gpPsrEwxxp0zEwvFb7WQsj/5nhZ9CvdPfHOHtaY+
 y52Yrc8ZOFA0Afo9n5ZswqryEWrT12+iVHs1JpgH5o16TvPAoS2NvNZmEng+kZa7oFMC
 COEvoUCef7xyhGAHapPFDDtLsDTmWrWUYI/OdMEkTO0VxMUsAiyMa703M+xnaoOGWBtI
 ELfA==
X-Gm-Message-State: AOAM531W6QUchtnV8JsF+4IIACgspQ3CMyAJcbHDK8CCDgteoVqMCzUS
 9kpt7AptFklqd7TvK5ZKlpTcs9A5vo0=
X-Google-Smtp-Source: ABdhPJx6OpbCOLjGcCrgRpCpqi6uI77uviNtxdBjD9s4/6gD5XlJwWx5QlQKZAh45losI4gvPcT4fw==
X-Received: by 2002:a5d:47aa:0:b0:20a:8b96:5b2c with SMTP id
 10-20020a5d47aa000000b0020a8b965b2cmr13459657wrb.621.1650442899997; 
 Wed, 20 Apr 2022 01:21:39 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n5-20020adf8b05000000b00207a4fd0185sm14610216wra.7.2022.04.20.01.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:21:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 20 Apr 2022 10:19:39 +0200
Message-Id: <20220420081939.295448-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: all features needs dynamic
 library
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add dynamic library dependency to BR2_PACKAGE_WOLFSSL_ALL to fix the
following static build failure with ibrdtnd, a "wolfssl all"-enabled
libcurl and openssl:

/nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/opt/ext-toolchain/bin/../lib/gcc/sh4aeb-buildroot-linux-musl/11.2.0/../../../../sh4aeb-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/bin/../sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libssl.a(ssl_ciph.o): in function `SSL_COMP_get_compression_methods':
ssl_ciph.c:(.text+0x25ac): multiple definition of `SSL_COMP_get_compression_methods'; /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libwolfssl.a(libwolfssl_la-ssl.o):ssl.c:(.text+0x1ca60): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/be1d327ed4c91a6280a88906a399dfe146f0b64e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcurl/Config.in      | 5 +++++
 package/libuhttpd/Config.in    | 3 ++-
 package/libuhttpd/libuhttpd.mk | 2 +-
 package/wolfssl/Config.in      | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index f2ddce6e81..84ad18211a 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -78,8 +78,13 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
+	depends on !BR2_STATIC_LIBS # wolfssl-all
 	select BR2_PACKAGE_WOLFSSL_ALL
 
+comment "WolfSSL needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_WOLFSSL
+	depends on BR2_STATIC_LIBS
+
 endchoice
 
 comment "A TLS library is needed for SSL/TLS support"
diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 97fc984ea0..a552a88f0c 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBUHTTPD
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
+		!BR2_STATIC_LIBS
 	help
 	  A lightweight and fully asynchronous HTTP server
 	  library based on libev
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index b8cf935d01..0d5306c6dd 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -18,7 +18,7 @@ LIBUHTTPD_CONF_OPTS += \
 	-DUSE_MBEDTLS=OFF \
 	-DUSE_OPENSSL=ON \
 	-DUSE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
 LIBUHTTPD_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 3c6d68f592..3a97125e8d 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -13,9 +13,13 @@ if BR2_PACKAGE_WOLFSSL
 
 config BR2_PACKAGE_WOLFSSL_ALL
 	bool "enable all features, except SSLv3"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable all wolfSSL features, except SSL version 3.0 support.
 
+comment "all features, except SSLv3 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WOLFSSL_SSLV3
 	bool "enable SSLv3"
 	help
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
