Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD63DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 10:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F2C883FF1;
	Mon, 18 Apr 2022 10:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jE9x2HtelsVN; Mon, 18 Apr 2022 10:01:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C35583FEC;
	Mon, 18 Apr 2022 10:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44A841BF391
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 10:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3253E83FEC
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 10:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llQV2NeHBzYU for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 10:01:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D369083FB6
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 10:01:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e21so18006151wrc.8
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 03:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Au1OSHQ+Z/KUq4lgry91tuAM8x/dLiqW7YL05WKdI0Q=;
 b=KXGNEbaR1OByu9kUX8VcbJSMvViP8/Wms3W4tx7Badi7z0HspL85dR1Wny1Ulg5OQ6
 PzcoKvFcEyKPJu5NghbUkoV3Jr007TcdkhzcuO1PByTIpZBgwVmIUVEJh2v7qCB0vxLL
 FwFSR81CZtO7vbayu/zkM+CTzfvp2VE4314vBlvzWw9TDCFRo72sxJRLuazTv4dQgv3D
 Qgq7a1gZegvMsMEuBA57lYe/omOv2bQFoXCjknDlwUQhf3rFM6nQjAxM9++LwEDoZenX
 ajA92w3knipNx2lBlQcRebjIFAGLdofFmlP4QvCdxFDUty0IttchdYkKGod13HMShI26
 2clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Au1OSHQ+Z/KUq4lgry91tuAM8x/dLiqW7YL05WKdI0Q=;
 b=QzvjVbed1dWXcf0oNu1N7dRU8IwRprrL3GGpkoRPXRsWnos5vHHSSC0Ooa1XQp5UxK
 B69rkbgeYz0ETd43FfseuO7ZUOquyXMNBzSjBVkzSY5zmNXz4PufkPEAGtqDkiNXJkh6
 pQgxB5WZ2gVbYlZZ68KOipR/Z5b7sw3jpNdcUrrLXGZoL9majOQngtQJ4XrGiAdCvIVU
 M9P8puzojeaktF6bL3A6pzfgQJUUZQ57F62aqlPdHgjSYgulPCWhX6wEd35/pGzZMi+V
 n155d0eutHlgIqdg/K36/o+dmxepJyba+ShZe5w5/Q/sjbIOvEUqgeydE6psuTLOWQSN
 sUYA==
X-Gm-Message-State: AOAM530cYeT4xNBm2iqB6Tx1UbTqFixKCxljkXu7F1Gn4NV6R0rQrDh5
 xKh8yX2GsbiYgZHSxMF2kuq5D7X2pm0=
X-Google-Smtp-Source: ABdhPJwHkXMHRrZDPtr2dfRiGkuD60WnEKfTLG84nvExJSlVHkCfx6gt7pk857j1P1O6wjMstmhCvg==
X-Received: by 2002:a5d:490a:0:b0:207:b3d0:18d6 with SMTP id
 x10-20020a5d490a000000b00207b3d018d6mr7517200wrq.503.1650276078569; 
 Mon, 18 Apr 2022 03:01:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056000186500b0020a8688963bsm6108388wri.89.2022.04.18.03.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 03:01:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 11:59:19 +0200
Message-Id: <20220418095919.13738-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/keepalived: fix build with libressl
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
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl:

/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'

Fixes:
 - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0003-fix-build-with-libressl.patch        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/keepalived/0003-fix-build-with-libressl.patch

diff --git a/package/keepalived/0003-fix-build-with-libressl.patch b/package/keepalived/0003-fix-build-with-libressl.patch
new file mode 100644
index 0000000000..090d35511c
--- /dev/null
+++ b/package/keepalived/0003-fix-build-with-libressl.patch
@@ -0,0 +1,50 @@
+From bbec15d4781670ac1be5e543cb04543f79200e69 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 12 Apr 2022 20:30:57 +0200
+Subject: [PATCH] fix build with libressl
+
+SSL_set0_rbio is provided by libressl since version 3.4.0 and
+https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc
+but SSL_set0_wbio is not provided resulting in the following build
+failure:
+
+/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
+check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/acassen/keepalived/commit/bbec15d4781670ac1be5e543cb04543f79200e69]
+---
+ configure.ac                 | 2 +-
+ keepalived/check/check_ssl.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5a2ea76ec..e8b5ccc41 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1327,7 +1327,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ AC_CHECK_FUNCS([SSL_CTX_set_verify_depth])
+ 
+ # SSL_set0_rbio(), SSL_set0_wbio() OPENSSL_init_crypto() and TLS_method() introduced OpenSSL v1.1.0
+-AC_CHECK_FUNCS([SSL_set0_rbio OPENSSL_init_crypto TLS_method])
++AC_CHECK_FUNCS([SSL_set0_wbio OPENSSL_init_crypto TLS_method])
+ 
+ # In OpenSSL v1.1.1 the call to SSL_CTX_new() fails if OPENSSL_init_crypto() has been called with
+ # OPENSSL_INIT_NO_LOAD_CONFIG. It does not fail in v1.1.0h and v1.1.1b.
+diff --git a/keepalived/check/check_ssl.c b/keepalived/check/check_ssl.c
+index 0155fce59..2cbedb8d3 100644
+--- a/keepalived/check/check_ssl.c
++++ b/keepalived/check/check_ssl.c
+@@ -234,7 +234,7 @@ ssl_connect(thread_ref_t thread, int new_req)
+ 		BIO_get_fd(req->bio, &bio_fd);
+ 		if (fcntl(bio_fd, F_SETFD, fcntl(bio_fd, F_GETFD) | FD_CLOEXEC) == -1)
+ 			log_message(LOG_INFO, "Setting CLOEXEC failed on ssl socket - errno %d", errno);
+-#ifdef HAVE_SSL_SET0_RBIO
++#ifdef HAVE_SSL_SET0_WBIO
+ 		BIO_up_ref(req->bio);
+ 		SSL_set0_rbio(req->ssl, req->bio);
+ 		SSL_set0_wbio(req->ssl, req->bio);
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
