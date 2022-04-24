Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9743AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 19:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3457B82628;
	Sun, 24 Apr 2022 19:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYzY7BAPw9XR; Sun, 24 Apr 2022 19:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08BA825BF;
	Sun, 24 Apr 2022 19:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1E8A1BF348
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F3F9825BF
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 19:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vNixIaABVbgv for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 19:22:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52AC1825E8
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 19:22:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso11261395wml.1
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rMDpdNiZAbzq97AOF42QV8sWz4RfksGCMi8sd7HwoJk=;
 b=XU7aobitq49diYBvziGf0uLCjtP6XBtv9QItdh5fGOKFnWZpO5qPKGHsA7+vPB4sLV
 M0BnV1RGw6S7iWyt13d2+ZiKsUtnGvRPZ9/PdXNQ4cWDGvt7aGeyN1c+xI0iWz1XiB24
 GYwcCs+WmsK45wU8JrEFyPMbrQymLPtZKyEu3fNWVvI0iPhDiDLxXLxj4UxNjnTZkraj
 QTbI/m6eQLILo/CW+l9YzQYX8o0SgY4WvckS1P929jpuZIujx6JTCbBfD0YX86QnXI3+
 KZ8jViXn10jaucDzyWe3EL+1oJV0urAcsT4aPM46H8eG7X8RZhygb18HSGPFOM0OvFNS
 D9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rMDpdNiZAbzq97AOF42QV8sWz4RfksGCMi8sd7HwoJk=;
 b=klRRJmWJWlyttHU5B+28TlrjCllQ2EbQF6g0D7rjzfWlFof5THZ8O7vfTXJEvylVhV
 6pVZKf9tpPM2CmP8Sqfdff6j8fUhLNmw9h0fFxkoWZBh11bN1ynKTmxztb+fpjxi2j36
 GVmgDHtqzF0IdJ8/ypCKYyi5ruZM3SdJWqLOCy962fUacCwpPQkXlKmZhHPg9iaOTzU9
 Ayg4jES9CPPFfWlGKR4OIlJ1rJh7n/eOv8k62cuxkKKZF0oi4F+CeiyZXigP5eOZsqAb
 JdO/CELJRaTyBZyBxTXd2HiQsGT2yB+Ya4YJdwAxoU5vhg4eWEXpcJ814JdzZpdhR7N8
 9Dlg==
X-Gm-Message-State: AOAM530199feDFkgEAW+fK1R1lNX3nqlhFKzK6aayvTKuXBGLK8TFA8x
 2ZpZ0EcTZ5M/YP17jR5ARmRMlyVNFrU=
X-Google-Smtp-Source: ABdhPJzvDV4C8CRI8qbTW5fYrFf1pOARq6Lf48kbdmLvfLy67+deo858AEkR3XwOnZVjAWqCWWfLTA==
X-Received: by 2002:a05:600c:34ce:b0:392:9cf:4e25 with SMTP id
 d14-20020a05600c34ce00b0039209cf4e25mr22602010wmq.193.1650828122364; 
 Sun, 24 Apr 2022 12:22:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l20-20020adfa394000000b0020ad1210f9dsm4927072wrb.74.2022.04.24.12.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 12:22:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 21:19:57 +0200
Message-Id: <20220424191957.435337-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build with libressl
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 3.4.1 raised since
commit 25ef2c26dabaf1553f1724214a4fa5e3ce48dfc8:

In file included from eXtl_dtls.c:82:
/home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
 1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
      |      ^~~~~~~~~~~~~
eXtl_dtls.c: In function 'SSL_set0_rbio':
eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  108 |   BIO_free_all(s->rbio);
      |                 ^~

Fixes:
 - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dtls.c-fix-build-with-libressl-3.4.1.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch

diff --git a/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
new file mode 100644
index 0000000000..0b4be43b6c
--- /dev/null
+++ b/package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch
@@ -0,0 +1,43 @@
+From 4201c0ff3fd75e09025d515c427f85f9fec89621 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 22:27:35 +0200
+Subject: [PATCH] src/eXtl_dtls.c: fix build with libressl >= 3.4.1
+
+Fix the following build failure with libressl >= 3.4.1 which provides
+SSL_set0_rbio() since
+https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc:
+
+In file included from eXtl_dtls.c:82:
+/home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6: note: previous declaration of 'SSL_set0_rbio' was here
+ 1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
+      |      ^~~~~~~~~~~~~
+eXtl_dtls.c: In function 'SSL_set0_rbio':
+eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
+  108 |   BIO_free_all(s->rbio);
+      |                 ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to amoizard@antisip.com]
+---
+ src/eXtl_dtls.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
+index 07c0dc2..d0bd7dc 100644
+--- a/src/eXtl_dtls.c
++++ b/src/eXtl_dtls.c
+@@ -102,7 +102,7 @@
+ #define RANDOM "random.pem"
+ #define DHFILE "dh1024.pem"
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3040100L)
+ 
+ static void SSL_set0_rbio(SSL *s, BIO *rbio) {
+   BIO_free_all(s->rbio);
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
