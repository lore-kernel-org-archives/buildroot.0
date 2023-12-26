Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C7BC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CED02409B5;
	Tue, 26 Dec 2023 20:36:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED02409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MebYPzRRD5ru; Tue, 26 Dec 2023 20:36:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C29C409DB;
	Tue, 26 Dec 2023 20:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C29C409DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A7C011BF591
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE7F60BC2
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE7F60BC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixpMU0W_uv1r for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:36:52 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C2BD60B90
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2BD60B90
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40d5bc68bb7so4925565e9.3
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 12:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703623009; x=1704227809;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnlXyYjeF7DNQEK2dwIGl7U09w6xK7znOiFbvGWYeDQ=;
 b=F1NlTpAHwv+FWZloDiLeMs/lQWiRSf/YLMuuEV9WGTwWifZjQSk/o5bA6v0Jfw2lZZ
 EMa3rIfFz2nmAAtRX8RbEPsN44Qh2r7oUzEyJT7PFDI5xlbxF38BfWqDLjwaPIqvsTE7
 zT5/QIOHyb4anN1ynla1hhg6k59dQGQOrWPbGnkvEBZAVjQZ+5V/56urLR9RinSu31Fg
 01LSonVp1t8bb8Q/lOI7TJ/HcoTkzIjxFUL5fB8Hs6wPhPs/mI3aDPbTs5W2sEBXiLsY
 Z3MeG7qnlgrdyECXpC20qxXsRmIZPPgNkz55YhIpPqSNC5mFB2eXiGdj1S3t6OzTKGhT
 xirA==
X-Gm-Message-State: AOJu0YzAMvkjSjDrxJdrgwo+MQilsl9AehEqYTmU1r4PXVSeaLs1wSd2
 IGrDbj900yLbTbP1wY1F3JuAyRUFl34=
X-Google-Smtp-Source: AGHT+IGKBjJCVNnp6i1W44Nd1VYlpl+Yj3OPTtiTRZ+0v4HAUQmsor3L12HFN1dtxYF6ZBX7IutaNw==
X-Received: by 2002:a05:600c:1381:b0:40c:6c81:e6d with SMTP id
 u1-20020a05600c138100b0040c6c810e6dmr3881340wmf.6.1703623009403; 
 Tue, 26 Dec 2023 12:36:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m5-20020adfe945000000b003366c058509sm13278328wrn.23.2023.12.26.12.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 12:36:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:36:47 +0100
Message-ID: <20231226203647.1249280-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703623009; x=1704227809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qnlXyYjeF7DNQEK2dwIGl7U09w6xK7znOiFbvGWYeDQ=;
 b=joUz+Kb/MgciAJH8MQ81mMj6/3wh+HbOsa1lsIDgS4HxSxHlDqA5/2asuhkPSfF5Ke
 mp24QbTTSBI6UdMqm/aZlSUIg2sfhaUqNoB8E3IuGrw2gBkGCkP12d+LqMVjde40TwD0
 6Bx88ZTYlXZspHDHBS0LUaI9BuXsGgQXgf3RgB30ra9yvhknH1VGDjHW4cCM0eAckylH
 9pWesV+s3B+tpYOPyQRPQNWFFb1Z2CJMr06FRWu5KCIIAInMrl+E3JHjuxwrZt3M4wTx
 mGas4DEF+N6xeqOi0lnrrU6QmmMsv+2OG02cNRFxUj7bCntg4Yvjhq5DY3L9wsa3Vlfo
 hMOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=joUz+Kb/
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: bump to version
 1.30.0
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

Drop patch (already in version) and so drop autoreconf

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.30.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...5-0-does-not-have-DSA_meth_set1_name.patch | 69 -------------------
 package/pkcs11-helper/pkcs11-helper.hash      |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk        |  4 +-
 4 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 81f18211e8..3934cb3bdd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1061,7 +1061,6 @@ package/pigpio/S50pigpio Shellcheck Variables
 package/pistache/0001-src-common-transport.cc-fallback-value-for-RUSAGE_TH.patch Upstream
 package/pistache/0002-src-server-listener.cc-fix-libressl-build.patch Upstream
 package/pixman/0001-Disable-tests.patch Upstream
-package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch Upstream
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch Upstream
 package/pkgconf/0002-Revert-main-assume-modversion-insted-of-version-if-o.patch Upstream
 package/pkgconf/pkg-config.in Shellcheck
diff --git a/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch b/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
deleted file mode 100644
index 21ce66ae79..0000000000
--- a/package/pkcs11-helper/0001-openssl-libressl-3-5-0-does-not-have-DSA_meth_set1_name.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 17d10b0dfb2b56a047db307687640adcd560e199 Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Mon, 2 May 2022 21:26:58 +0300
-Subject: [PATCH] openssl: libressl-3.5.0 does not have DSA_meth_set1_name
-
-while it does not expose the DSA_METHOD structure.
-
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/OpenSC/pkcs11-helper/commit/17d10b0dfb2b56a047db307687640adcd560e199]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog             |  1 +
- configure.ac          | 16 ++++++++++++++++
- lib/pkcs11h-openssl.c |  4 ++++
- 3 files changed, 21 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 716bb8d8..57697a3b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -300,7 +300,9 @@ if test "${have_openssl}" = "no"; then
- fi
- 
- if test "${have_openssl}" = "yes"; then
-+	old_CFLAGS="${CFLAGS}"
- 	old_LIBS="${LIBS}"
-+	CFLAGS="${CFLAGS} ${OPENSSL_CFLAGS}"
- 	LIBS="${LIBS} ${OPENSSL_LIBS}"
- 	AC_CHECK_FUNCS([ \
- 		RSA_meth_dup RSA_meth_free \
-@@ -344,6 +346,20 @@ if test "${have_openssl}" = "yes"; then
- 	)
- 	AC_MSG_CHECKING([for OpenSSL ec support])
- 	AC_MSG_RESULT([${openssl_ec}])
-+	# https://github.com/OpenSC/pkcs11-helper/pull/55
-+	AC_COMPILE_IFELSE(
-+		[AC_LANG_PROGRAM(
-+			[[#include <openssl/dsa.h>]],
-+			[[
-+				int foo() {
-+					DSA_METHOD *meth = NULL;
-+					sizeof(meth->name);
-+				}
-+			]]
-+		)],
-+		[AC_DEFINE([HAVE_DSA_METHOD_NAME], [1], [Have DSA_METHOD->name])]
-+	)
-+	CFLAGS="${old_CFLAGS}"
- 	LIBS="${old_LIBS}"
- fi
- 
-diff --git a/lib/pkcs11h-openssl.c b/lib/pkcs11h-openssl.c
-index 961c955c..38ee8e2d 100644
---- a/lib/pkcs11h-openssl.c
-+++ b/lib/pkcs11h-openssl.c
-@@ -235,9 +235,13 @@ DSA_meth_free (DSA_METHOD *meth)
- static int
- DSA_meth_set1_name (DSA_METHOD *meth, const char *name)
- {
-+#ifdef HAVE_DSA_METHOD_NAME
- 	CK_RV rv;
- 	rv = _pkcs11h_mem_strdup ((void *)&meth->name, name);
- 	return rv == CKR_OK ? 1 : 0;
-+#else
-+	return 0;
-+#endif
- }
- #endif
- 
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 0614e8aed4..bc9cf3478b 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  996846a3c8395e03d8c0515111dc84d82e6e3648d44ba28cb2dbbbca2d4db7d6  pkcs11-helper-1.29.0.tar.bz2
+sha256  4c5815ba910cabf26df08d449ca2909daf4538c9899aa7f7fadc61229d3488a9  pkcs11-helper-1.30.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index d1a1e38d4e..de192493ea 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.29.0
+PKCS11_HELPER_VERSION = 1.30.0
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
 PKCS11_HELPER_INSTALL_STAGING = YES
-# We're patching configure.ac
-PKCS11_HELPER_AUTORECONF = YES
 
 PKCS11_HELPER_CONF_OPTS = \
 	--disable-crypto-engine-polarssl \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
