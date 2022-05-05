Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51617C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C58AB41988;
	Thu,  5 May 2022 21:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6aSgdaL5v2n8; Thu,  5 May 2022 21:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D5D4197D;
	Thu,  5 May 2022 21:04:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09E071BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E665C8405E
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qXq-kcVUHaT6 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:04:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BF3B8405C
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:04:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c11so7598826wrn.8
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+NCov8H8Wr1kmJ2vmcw2EVMvugMK/ZBuTtCLrkVlo8=;
 b=bnDW1ssp5umJ7iYgrwxzVq6qsWdqUKcJ3HjpwS4AfjmUtTILq01/E3gQ84rybqZJkB
 0KgFBBTw+iIkhE9gwEW3LNerpbLtNbIUnt2NFg+tpS/qcasDYOQzUvriKYB3EM3r6+ux
 3GoYnqaUfMjMQEvl69ypE5QJltVesBP1G1vygDhXQo3p8UNXdyF6PZl6sz8NTgm8lB84
 F+Ud0XVM6Ogpo816eoINRYw9zjcfMhwYZZTcVOVuWCWQctIdDrpiim9OS1j+gQWX9+/B
 yqvVFG13k4fRijJzdSr3lJeMzpIpj3gdL3i6xY0FgOzzrrdQ2a4T/PWslM0/CUX0DoH3
 rYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+NCov8H8Wr1kmJ2vmcw2EVMvugMK/ZBuTtCLrkVlo8=;
 b=Zr+C7f0PJ610dDAoaXNokeNvBdZ4fUnx7JUYBjemWXfoQTm6B9u9AKVgBjQI+OGPD4
 LLBcwJP7lEQ9TxRXOP6v7Frmu+BrKDEm2kp+QyoogPEGUB5u5QSB57yRFmrYYKptvmES
 k/RsLIkl2wu4joicCPQp34h5+txMRtzjWjcNeZnvovRy9eTcooHsvPeLytwIda3UVGZ+
 ugL2MUyfBnOKxjS0v9XKmL+kxjVpX64UQsk17zqmACVV9CKv5IIpIT4ADoFln60Muxc0
 IsTo7qhr2Qete3Sm2CHuSVu73KRfcp6FKAegY0IyTXGFQsO9OhRloRybHG1wdW4YWIFF
 IOKA==
X-Gm-Message-State: AOAM533qAtFX6Q1+YpAbA581h2uNpLE/EwvRWdGcq8nBU+Kdmu1VBmrs
 iEfwtWiXllgRBxicSymMxuBEC/uxI2w=
X-Google-Smtp-Source: ABdhPJwL0H/rGuJNZTTKjCs/j+Bip7ukAczGb2ie013Vx6CHgJiPSBH0hZkxC/tFGafAf2kccVgToQ==
X-Received: by 2002:a5d:4e45:0:b0:20a:d742:608a with SMTP id
 r5-20020a5d4e45000000b0020ad742608amr34769wrt.84.1651784668039; 
 Thu, 05 May 2022 14:04:28 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 d12-20020adffd8c000000b0020c5253d8f2sm1934896wrr.62.2022.05.05.14.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 14:04:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 23:01:51 +0200
Message-Id: <20220505210151.9244-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: fix build with
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

pkcs11h-openssl.c: In function 'DSA_meth_set1_name':
pkcs11h-openssl.c:239:41: error: invalid use of incomplete typedef 'DSA_METHOD' {aka 'struct dsa_method'}
  239 |  rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
      |                                         ^~

Fixes:
 - http://autobuild.buildroot.org/results/9b0d3bf7d97696c7be6de1724daaba196626b865

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...5-0-does-not-have-DSA_meth_set1_name.patch | 69 +++++++++++++++++++
 package/pkcs11-helper/pkcs11-helper.mk        |  2 +
 2 files changed, 71 insertions(+)
 create mode 100644 package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch

diff --git a/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
new file mode 100644
index 0000000000..21ce66ae79
--- /dev/null
+++ b/package/pkcs11-helper/0002-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
@@ -0,0 +1,69 @@
+From 17d10b0dfb2b56a047db307687640adcd560e199 Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Mon, 2 May 2022 21:26:58 +0300
+Subject: [PATCH] openssl: libressl-3.5.0 does not have DSA_meth_set1_name
+
+while it does not expose the DSA_METHOD structure.
+
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/OpenSC/pkcs11-helper/commit/17d10b0dfb2b56a047db307687640adcd560e199]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog             |  1 +
+ configure.ac          | 16 ++++++++++++++++
+ lib/pkcs11h-openssl.c |  4 ++++
+ 3 files changed, 21 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 716bb8d8..57697a3b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -300,7 +300,9 @@ if test "${have_openssl}" = "no"; then
+ fi
+ 
+ if test "${have_openssl}" = "yes"; then
++	old_CFLAGS="${CFLAGS}"
+ 	old_LIBS="${LIBS}"
++	CFLAGS="${CFLAGS} ${OPENSSL_CFLAGS}"
+ 	LIBS="${LIBS} ${OPENSSL_LIBS}"
+ 	AC_CHECK_FUNCS([ \
+ 		RSA_meth_dup RSA_meth_free \
+@@ -344,6 +346,20 @@ if test "${have_openssl}" = "yes"; then
+ 	)
+ 	AC_MSG_CHECKING([for OpenSSL ec support])
+ 	AC_MSG_RESULT([${openssl_ec}])
++	# https://github.com/OpenSC/pkcs11-helper/pull/55
++	AC_COMPILE_IFELSE(
++		[AC_LANG_PROGRAM(
++			[[#include <openssl/dsa.h>]],
++			[[
++				int foo() {
++					DSA_METHOD *meth = NULL;
++					sizeof(meth->name);
++				}
++			]]
++		)],
++		[AC_DEFINE([HAVE_DSA_METHOD_NAME], [1], [Have DSA_METHOD->name])]
++	)
++	CFLAGS="${old_CFLAGS}"
+ 	LIBS="${old_LIBS}"
+ fi
+ 
+diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
+index 961c955c..38ee8e2d 100644
+--- a/lib/pkcs11h-openssl.c
++++ b/lib/pkcs11h-openssl.c
+@@ -235,9 +235,13 @@ DSA_meth_free (DSA_METHOD *meth)
+ static int
+ DSA_meth_set1_name (DSA_METHOD *meth, const char *name)
+ {
++#ifdef HAVE_DSA_METHOD_NAME
+ 	CK_RV rv;
+ 	rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
+ 	return rv == CKR_OK ? 1 : 0;
++#else
++	return 0;
++#endif
+ }
+ #endif
+ 
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 4fc3e21e5a..f8fe54ecf5 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -11,6 +11,8 @@ PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
 PKCS11_HELPER_INSTALL_STAGING = YES
+# We're patching configure.ac
+PKCS11_HELPER_AUTORECONF = YES
 
 PKCS11_HELPER_CONF_OPTS = \
 	--disable-crypto-engine-polarssl \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
