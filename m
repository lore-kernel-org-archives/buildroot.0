Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7430DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 16:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 225CC60FFD;
	Mon,  4 Apr 2022 16:27:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixzYep8wMQZW; Mon,  4 Apr 2022 16:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF9460FF3;
	Mon,  4 Apr 2022 16:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 604A31BF983
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0A860FF3
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 16:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w58POix44xOh for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 16:27:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5924560EDE
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 16:27:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id n35so6251180wms.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbPJqUUNO3CSZsLLrM1mtZPEdYdJl2hhxx5KclvuKyE=;
 b=NLaJUOY/iAWDQGR8TUzUASFaszapLGb9Z9AGHKi3CQe8PSKkQNG752kPZjzLduD4o5
 ueK6pBWBvXNe8cCJqy8y6PUg9kdLj/az273gUmg1+J574LPMbIkr+wbDdLJ2Rs0dxBJs
 5Ivl1axw12zfbIxGCAEaPCFA8m03j9gOv81P2VKlg8bPGviFyNtIefG5NZNbZIZXoLi+
 C0bVWs2yBu/br7JlIzAvfpWEqZEBeL74HWM+mo14poOyuJSd4PYo+akMcfAptdRLT2HR
 9wnYcUon2qcjAOV27NQ7rIw4tCyjP0TKdapfjzx1e3vcRpMNopq12EaiZzaFrZer/RE5
 KjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AbPJqUUNO3CSZsLLrM1mtZPEdYdJl2hhxx5KclvuKyE=;
 b=NCw27a0UUmQ60Y8OdtdQiqb9bhy4eYUXEQInEAt/fS26RpAyolucrJNiomPujVNMs4
 VYkq15qbAFfuEqk7sk6EGjUfinDT2qBMXWHrHuItgI8DsU+62/9XH7Ghxm+FkB0NQHmS
 P6IlkVhCQF30du+X7puvrQAp7wRi7uKdwkoHaiUakSA538Dx9zo4IalAYqrGhWypINLp
 GUIUo3MWqW3rIZbQJf7GZIxXbg5lW/nI0s2CYLlyfUsT048f33RuAVsN1SQ932FLsvSQ
 9znLg1OcfJrEcYNW48p3rArQU1Rqw6d7r4lkD4B10bexWO1R0apoyPHGSmmp8qGN+etp
 exeQ==
X-Gm-Message-State: AOAM531TMZwLspfddaS6zFtF0fKg3DP5xMRRXPTMVJlgfcvg2N8+/uf8
 wT1KSXghWRV3asV3nOaSmKw20apV0O8=
X-Google-Smtp-Source: ABdhPJzPLZOW4BQkzEAaJGqKGBoDnpG85dAdAeoFXxql8wswZbSFb7TjwTdobOQY3mMT+pZkOPwgrQ==
X-Received: by 2002:a05:600c:26d4:b0:38e:7b79:1095 with SMTP id
 20-20020a05600c26d400b0038e7b791095mr2063983wmv.95.1649089647403; 
 Mon, 04 Apr 2022 09:27:27 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c1d8e00b0038dbb5ecc8asm6859wms.2.2022.04.04.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 09:27:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Apr 2022 18:25:45 +0200
Message-Id: <20220404162545.326240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ace: fix build with libressl
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

Fix the following build failure with libressl raised since the addition
of the package in commit 3621918d1bc1ddc9312dd1cc8dec6db61e712fe2:

/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
      |       ^~~~~~~~~~~~
      |       BIO_set_init

Fixes:
 - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Asynch_BIO.cpp-fix-build-with-libres.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch

diff --git a/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
new file mode 100644
index 0000000000..ad82c10172
--- /dev/null
+++ b/package/ace/0001-ACE-ace-SSL-SSL_Asynch_BIO.cpp-fix-build-with-libres.patch
@@ -0,0 +1,52 @@
+From e06cadc3b95a577e6a8bbc94f93dd063710c73a1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 3 Apr 2022 15:25:49 +0200
+Subject: [PATCH] ACE/ace/SSL/SSL_Asynch_BIO.cpp: fix build with libressl
+
+Fix the following build failure with libressl:
+
+/home/autobuild/autobuild/instance-10/output-1/build/ace-7.0.6/ace/SSL/SSL_Asynch_BIO.cpp:174:7: error: 'BIO_get_init' was not declared in this scope; did you mean 'BIO_set_init'?
+  174 |   if (BIO_get_init(pBIO) == 0 || p_stream == 0 || buf == 0 || len <= 0)
+      |       ^~~~~~~~~~~~
+      |       BIO_set_init
+
+Fixes:
+ - http://autobuild.buildroot.org/results/386afa88ac9e5e3bb65dddeabf610bb1e9bc4285
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/DOCGroup/ACE_TAO/commit/e06cadc3b95a577e6a8bbc94f93dd063710c73a1]
+---
+ ACE/ace/SSL/SSL_Asynch_BIO.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ace/SSL/SSL_Asynch_BIO.cpp b/ace/SSL/SSL_Asynch_BIO.cpp
+index a657d8a14e6f7..64aa14c6ab9a7 100644
+--- a/ace/SSL/SSL_Asynch_BIO.cpp
++++ b/ace/SSL/SSL_Asynch_BIO.cpp
+@@ -41,7 +41,7 @@ extern "C"
+ 
+ #define BIO_TYPE_ACE  ( 21 | BIO_TYPE_SOURCE_SINK )
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ static BIO_METHOD methods_ACE =
+   {
+     BIO_TYPE_ACE, // BIO_TYPE_PROXY_SERVER,
+@@ -68,14 +68,14 @@ static BIO_METHOD methods_ACE =
+ #else
+ static BIO_METHOD* methods_ACE;
+ # define BIO_set_num(b, val)
+-#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L */
++#endif /* OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER) */
+ 
+ ACE_BEGIN_VERSIONED_NAMESPACE_DECL
+ 
+ BIO *
+ ACE_SSL_make_BIO (void * ssl_asynch_stream)
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+   BIO * const pBIO = BIO_new (&methods_ACE);
+ #else
+   if (!methods_ACE)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
